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

import com.intellij.lang.Language;
import com.intellij.openapi.util.TextRange;
import com.intellij.psi.*;
import com.intellij.psi.impl.light.LightModifierList;
import com.intellij.util.IncorrectOperationException;
import org.jetbrains.annotations.NonNls;
import org.jetbrains.annotations.NotNull;

import java.util.*;

public class ParcelizeLightModifierList extends LightModifierList implements SyntheticElement {
    private static final Set<String> ALL_MODIFIERS = new HashSet<>(Arrays.asList(PsiModifier.MODIFIERS));

    private final Map<String, PsiAnnotation> myAnnotations;
    private final Set<String> myImplicitModifiers;

    public ParcelizeLightModifierList(PsiManager manager, final Language language, Collection<String> implicitModifiers, String... modifiers) {
        super(manager, language, modifiers);
        this.myAnnotations = new HashMap<>();
        this.myImplicitModifiers = new HashSet<>(implicitModifiers);
    }

    @Override
    public boolean hasModifierProperty(@NotNull String name) {
        return myImplicitModifiers.contains(name) || super.hasModifierProperty(name);
    }

    public void addImplicitModifierProperty(@PsiModifier.ModifierConstant @NotNull @NonNls String implicitModifier) {
        myImplicitModifiers.add(implicitModifier);
    }

    @Override
    public void setModifierProperty(@PsiModifier.ModifierConstant @NotNull @NonNls String name, boolean value) throws IncorrectOperationException {
        if (value) {
            addModifier(name);
        } else {
            if (hasModifierProperty(name)) {
                removeModifier(name);
            }
        }
    }

    private void removeModifier(@PsiModifier.ModifierConstant @NotNull @NonNls String name) {
        final Collection<String> myModifiers = collectAllModifiers();
        myModifiers.remove(name);

        clearModifiers();

        for (String modifier : myModifiers) {
            addModifier(modifier);
        }
    }

    private Collection<String> collectAllModifiers() {
        Collection<String> result = new HashSet<>();
        for (@PsiModifier.ModifierConstant String modifier : ALL_MODIFIERS) {
            if (hasExplicitModifier(modifier)) {
                result.add(modifier);
            }
        }
        return result;
    }

    @Override
    public void checkSetModifierProperty(@PsiModifier.ModifierConstant @NotNull @NonNls String name, boolean value) throws IncorrectOperationException {
        throw new IncorrectOperationException();
    }

    @Override
    @NotNull
    public PsiAnnotation addAnnotation(@NotNull @NonNls String qualifiedName) {
        final PsiElementFactory elementFactory = JavaPsiFacade.getElementFactory(getProject());
        final PsiAnnotation psiAnnotation = elementFactory.createAnnotationFromText('@' + qualifiedName, null);
        myAnnotations.put(qualifiedName, psiAnnotation);
        return psiAnnotation;
    }

    @Override
    public PsiAnnotation findAnnotation(@NotNull String qualifiedName) {
        return myAnnotations.get(qualifiedName);
    }

    @Override
    @NotNull
    public PsiAnnotation[] getAnnotations() {
        PsiAnnotation[] result = PsiAnnotation.EMPTY_ARRAY;
        if (!myAnnotations.isEmpty()) {
            Collection<PsiAnnotation> annotations = myAnnotations.values();
            result = annotations.toArray(PsiAnnotation.EMPTY_ARRAY);
        }
        return result;
    }

    @Override
    public TextRange getTextRange() {
        TextRange r = super.getTextRange();
        return r == null ? TextRange.EMPTY_RANGE : r;
    }

    public String toString() {
        return "ParcelizeLightModifierList";
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) {
            return true;
        }
        if (o == null || getClass() != o.getClass()) {
            return false;
        }

        ParcelizeLightModifierList that = (ParcelizeLightModifierList) o;

        return myAnnotations.equals(that.myAnnotations);
    }

    @Override
    public int hashCode() {
        return myAnnotations.hashCode();
    }
}
