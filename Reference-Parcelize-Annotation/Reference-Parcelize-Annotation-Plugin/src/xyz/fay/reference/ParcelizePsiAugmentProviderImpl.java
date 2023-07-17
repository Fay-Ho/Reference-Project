package xyz.fay.reference;

import com.intellij.psi.*;
import com.intellij.psi.augment.PsiAugmentProvider;
import com.intellij.psi.impl.source.PsiExtensibleClass;

import org.jetbrains.annotations.NotNull;
import org.jetbrains.annotations.Nullable;

import java.util.ArrayList;
import java.util.Collections;
import java.util.List;
import java.util.Set;

public class ParcelizePsiAugmentProviderImpl extends PsiAugmentProvider {
    public ParcelizePsiAugmentProviderImpl() {
        super();
    }

    @NotNull
    @Override
    protected <Psi extends PsiElement> List<Psi> getAugments(@NotNull PsiElement element, @NotNull Class<Psi> type) {
        final List<Psi> emptyResult = Collections.emptyList();
        final List<Psi> result = new ArrayList<>();

        if ((type != PsiClass.class && type != PsiField.class && type != PsiMethod.class) || !(element instanceof PsiExtensibleClass)) {
            return emptyResult;
        }

        PsiClass psiClass = (PsiClass) element;

        boolean isMethod = type.isAssignableFrom(PsiMethod.class);
        if (isMethod) {
            new ParcelizeAnnotationProcessor().process(result, psiClass, type);
        }

        return result;
    }

    @Nullable
    @Override
    protected PsiType inferType(@NotNull PsiTypeElement typeElement) {
        return super.inferType(typeElement);
    }

    @NotNull
    @Override
    protected Set<String> transformModifiers(@NotNull PsiModifierList modifierList, @NotNull Set<String> modifiers) {
        return super.transformModifiers(modifierList, modifiers);
    }
}
