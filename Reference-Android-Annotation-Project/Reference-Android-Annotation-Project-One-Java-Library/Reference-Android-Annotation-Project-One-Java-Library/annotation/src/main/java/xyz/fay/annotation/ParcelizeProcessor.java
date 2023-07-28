package xyz.fay.annotation;

/*
  MIT License

  Copyright (c) 2023 Fay-Ho

  Permission is hereby granted, free of charge, to any person obtaining a copy
  of this software and associated documentation files (the "Software"), to deal
  in the Software without restriction, including without limitation the rights
  to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
  copies of the Software, and to permit persons to whom the Software is
  furnished to do so, subject to the following conditions:

  The above copyright notice and this permission notice shall be included in all
  copies or substantial portions of the Software.

  THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
  IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
  FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
  AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
  LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
  OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
  SOFTWARE.
*/

import com.google.auto.service.AutoService;
import com.sun.source.tree.Tree;
import com.sun.tools.javac.api.JavacTrees;
import com.sun.tools.javac.code.Flags;
import com.sun.tools.javac.code.Type;
import com.sun.tools.javac.processing.JavacProcessingEnvironment;
import com.sun.tools.javac.tree.JCTree;
import com.sun.tools.javac.tree.TreeMaker;
import com.sun.tools.javac.tree.TreeTranslator;
import com.sun.tools.javac.util.Context;
import com.sun.tools.javac.util.List;
import com.sun.tools.javac.util.ListBuffer;
import com.sun.tools.javac.util.Name;
import com.sun.tools.javac.util.Names;

import java.util.Collections;
import java.util.Set;

import javax.annotation.processing.AbstractProcessor;
import javax.annotation.processing.ProcessingEnvironment;
import javax.annotation.processing.Processor;
import javax.annotation.processing.RoundEnvironment;
import javax.lang.model.SourceVersion;
import javax.lang.model.element.Element;
import javax.lang.model.element.Modifier;
import javax.lang.model.element.TypeElement;

@AutoService(Processor.class)
public final class ParcelizeProcessor extends AbstractProcessor {
    private static final String GET = "get";
    private static final String SET = "set";
    private static final String THIS = "this";

    private JavacTrees trees;
    private TreeMaker maker;
    private Names names;

    @Override
    public Set<String> getSupportedAnnotationTypes() {
        return Collections.singleton(Parcelize.class.getCanonicalName());
    }

    @Override
    public SourceVersion getSupportedSourceVersion() {
        return SourceVersion.latestSupported();
    }

    @Override
    public synchronized void init(ProcessingEnvironment processingEnv) {
        super.init(processingEnv);
        this.trees = JavacTrees.instance(processingEnv);
        Context context = ((JavacProcessingEnvironment) processingEnv).getContext();
        this.maker = TreeMaker.instance(context);
        this.names = Names.instance(context);
    }

    @Override
    public boolean process(Set<? extends TypeElement> set, RoundEnvironment roundEnvironment) {
        // 查找源码中使用了 Parcelize 注解的类
        Set<? extends Element> elements = roundEnvironment.getElementsAnnotatedWith(Parcelize.class);
        for (Element element : elements) {
            JCTree jcTree = trees.getTree(element);
            jcTree.accept(new TreeTranslator() {
                @Override
                public void visitClassDef(JCTree.JCClassDecl jcClassDecl) {
                    super.visitClassDef(jcClassDecl);

                    // 创建成员变量列表
                    List<JCTree.JCVariableDecl> jcVariableDeclList = List.nil();

                    for (JCTree tree : jcClassDecl.defs) {
                        // 找出成员变量
                        if (tree.getKind().equals(Tree.Kind.VARIABLE)) {
                            JCTree.JCVariableDecl jcVariableDecl = (JCTree.JCVariableDecl) tree;

                            // 更新成员变量列表
                            jcVariableDeclList = jcVariableDeclList.append(jcVariableDecl);
                        }
                    }

                    for (JCTree.JCVariableDecl jcVariableDecl : jcVariableDeclList) {

                        // 生成 Getter 方法
                        jcClassDecl.defs = jcClassDecl.defs.append(generateGetterMethodDecl(jcVariableDecl));

                        // 如果成员变量不是 final 修饰符，生成 Setter 方法
                        if (!jcVariableDecl.getModifiers().getFlags().contains(Modifier.FINAL)) {
                            jcClassDecl.defs = jcClassDecl.defs.append(generateSetterMethodDecl(jcVariableDecl));
                        }
                    }
                }
            });
        }
        return true;
    }

    /**
     * 生成 Getter 方法
     * @param jcVariableDecl 成员变量
     * @return 成员变量的 Getter 方法
     */
    private JCTree.JCMethodDecl generateGetterMethodDecl(JCTree.JCVariableDecl jcVariableDecl) {
        ListBuffer<JCTree.JCStatement> statements = new ListBuffer<>();

        // 生成方法体 (`return this.xxx;`)
        statements.append(maker.Return(maker.Select(maker.Ident(names.fromString(THIS)), jcVariableDecl.getName())));

        // 生成花括号 (`{ return this.xxx; }`)
        JCTree.JCBlock body = maker.Block(0, statements.toList());

        // 生成完整 Getter 方法, ObjectType 为成员变量实际类型
        // public ObjectType getXxx() {
        //     return this.xxx;
        // }
        return maker.MethodDef(maker.Modifiers(Flags.PUBLIC), generateMethodName(GET, jcVariableDecl.getName()), jcVariableDecl.vartype, List.nil(), List.nil(), List.nil(), body, null);
    }

    /**
     * 生成 Setter 方法
     * @param jcVariableDecl 成员变量
     * @return 成员变量的 Setter 方法
     */
    private JCTree.JCMethodDecl generateSetterMethodDecl(JCTree.JCVariableDecl jcVariableDecl) {
        ListBuffer<JCTree.JCStatement> statements = new ListBuffer<>();

        // 生成方法体 (`this.xxx = xxx;`)
        statements.append(maker.Exec(maker.Assign(maker.Select(maker.Ident(names.fromString(THIS)), jcVariableDecl.getName()), maker.Ident(jcVariableDecl.getName()))));

        // 生成花括号 (`{ this.xxx = xxx; }`)
        JCTree.JCBlock block = maker.Block(0, statements.toList());

        // 解决 TreeMaker AssertionError: Value of x -1
        // (1) 如果是从已经存在变量生成新的JCMethodDecl
        //
        // param.pos = jCVariableDecl.pos
        //
        // (2) 如果是新定义变量JCMethodDecl
        //
        // maker.at(jcClassDecl.pos);
        maker.pos = jcVariableDecl.pos;

        // 生成 Setter 方法入参 (`ObjectType xxx`, ObjectType 为成员变量实际类型)
        List<JCTree.JCVariableDecl> parameters = List.of(maker.VarDef(maker.Modifiers(Flags.PARAMETER), jcVariableDecl.getName(), jcVariableDecl.vartype, null));

        // 生成完整 Setter 方法, ObjectType 为成员变量实际类型
        // public void setXxx(ObjectType xxx) {
        //     this.xxx = xxx;
        // }
        return maker.MethodDef(maker.Modifiers(Flags.PUBLIC), generateMethodName(SET, jcVariableDecl.getName()), maker.Type(new Type.JCVoidType()), List.nil(), parameters, List.nil(), block, null);
    }

    /**
     * 生成方法名，驼峰命名法
     * @param type Getter 方法或 Setter 方法
     * @param name 成员变量名
     * @return 方法名
     */
    private Name generateMethodName(String type, Name name) {
        String string = name.toString();

        // getXxx / setXxx
        return names.fromString(type + string.substring(0, 1).toUpperCase() + string.substring(1, name.length()));
    }
}
