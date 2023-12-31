package xyz.fay.reference;

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

import com.intellij.lang.java.JavaLanguage;
import com.intellij.openapi.util.Key;
import com.intellij.psi.*;

import java.util.List;

public class ParcelizeAnnotationProcessor {
    private static final Key<PsiMethod> GETTER_KEY = Key.create("ANNOTATION_GETTER_KEY");
    private static final String PACKAGE_NAME = "xyz.fay.parcel.Parcelize";
    private static final String GETTER = "get";
    private static final String SETTER = "set";
    private static final String THIS = "this";
    private static final String RETURN_THIS = "return this;";

    public <Psi extends PsiElement> void process(List<Psi> result, PsiClass psiClass, Class<Psi> type) {
        PsiField[] fields = psiClass.getFields();
        PsiAnnotation[] annotations = psiClass.getAnnotations();
        for (PsiAnnotation annotation : annotations) {
            if (PACKAGE_NAME.equals(annotation.getQualifiedName())) {
                for (PsiField psiField : fields) {
                    addGetter(result, psiField, type);
                    if (!psiField.hasModifierProperty(PsiModifier.FINAL)) {
                        addSetter(result, psiField, type);
                    }
                }
            }
        }
    }

    private <Psi extends PsiElement> void addGetter(List<Psi> result, PsiField psiField, Class<Psi> type) {
        result.add((Psi) generateGetterMethod(psiField));
    }

    private PsiMethod generateGetterMethod(PsiField psiField) {
        if (psiField.getUserData(GETTER_KEY) != null) {
            return psiField.getUserData(GETTER_KEY);
        }

        String fieldName = psiField.getName();
        String methodName = fieldName.substring(0, 1).toUpperCase() + fieldName.substring(1);
        String getterName = GETTER + methodName;
        com.intellij.psi.impl.light.LightMethodBuilder methodBuilder = new com.intellij.psi.impl.light.LightMethodBuilder(psiField.getManager(), JavaLanguage.INSTANCE, getterName);
        methodBuilder.addModifier(PsiModifier.PUBLIC);
        methodBuilder.setMethodReturnType(psiField.getType());
        methodBuilder.setNavigationElement(psiField);
        methodBuilder.setContainingClass(psiField.getContainingClass());
        boolean isStatic = psiField.hasModifierProperty(PsiModifier.STATIC);
        if (isStatic) {
            methodBuilder.addModifier(PsiModifier.STATIC);
        }
        psiField.putUserData(GETTER_KEY, methodBuilder);
        return methodBuilder;
    }

    private <Psi extends PsiElement> void addSetter(List<Psi> result, PsiField psiField, Class<Psi> type) {
        result.add((Psi) generateSetterMethod(psiField));
    }

    private PsiMethod generateSetterMethod(PsiField psiField) {
        String fieldName = psiField.getName();
        String methodName = fieldName.substring(0, 1).toUpperCase() + fieldName.substring(1, fieldName.length());
        String setterName = SETTER + methodName;
        PsiType returnType = PsiType.VOID;
        ParcelizeLightMethodBuilder methodBuilder = new ParcelizeLightMethodBuilder(psiField.getManager(), setterName)
                .withMethodReturnType(returnType)
                .withContainingClass(psiField.getContainingClass())
                .withParameter(fieldName, psiField.getType())
                .withNavigationElement(psiField);
        methodBuilder.withModifier(PsiModifier.PUBLIC);
        boolean isStatic = psiField.hasModifierProperty(PsiModifier.STATIC);
        if (isStatic) {
            methodBuilder.withModifier(PsiModifier.STATIC);
        }
        PsiParameter methodParameter = methodBuilder.getParameterList().getParameters()[0];
        final String thisOrClass = isStatic ? psiField.getContainingClass().getName() : THIS;
        String codeBlockText = String.format("%s.%s = %s; ", thisOrClass, psiField.getName(), methodParameter.getName());
        if (!isStatic && !PsiType.VOID.equals(returnType)) {
            codeBlockText += RETURN_THIS;
        }
        PsiCodeBlock codeBlockFromText = createCodeBlockFromText(codeBlockText, psiField);
        methodBuilder.withBody(codeBlockFromText);
        return methodBuilder;
    }

    private PsiCodeBlock createCodeBlockFromText(String blockText, PsiElement psiElement) {
        final PsiElementFactory elementFactory = JavaPsiFacade.getElementFactory(psiElement.getProject());
        return elementFactory.createCodeBlockFromText("{" + blockText + "}", psiElement);
    }
}
