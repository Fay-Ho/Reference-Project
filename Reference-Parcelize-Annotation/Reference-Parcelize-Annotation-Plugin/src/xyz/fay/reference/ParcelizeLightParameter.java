package xyz.fay.reference;

import com.intellij.lang.Language;
import com.intellij.openapi.util.TextRange;
import com.intellij.psi.*;
import com.intellij.psi.impl.light.LightModifierList;
import com.intellij.psi.impl.light.LightParameter;
import com.intellij.psi.impl.light.LightVariableBuilder;
import org.jetbrains.annotations.NotNull;

import java.util.Collections;

public class ParcelizeLightParameter extends LightParameter implements SyntheticElement {
    private String myName;
    private final ParcelizeLightIdentifier myNameIdentifier;

    public ParcelizeLightParameter(@NotNull String name, @NotNull PsiType type, PsiElement declarationScope, Language language) {
        super(name, type, declarationScope, language);
        myName = name;
        PsiManager manager = declarationScope.getManager();
        myNameIdentifier = new ParcelizeLightIdentifier(manager, name);
        ParcelizeReflectionUtil.setFinalFieldPerReflection(LightVariableBuilder.class, this, LightModifierList.class,
                new ParcelizeLightModifierList(manager, language, Collections.emptySet()));
    }

    @NotNull
    @Override
    public String getName() {
        return myName;
    }

    @Override
    public PsiElement setName(@NotNull String name) {
        myName = name;
        myNameIdentifier.setText(name);
        return this;
    }

    @Override
    public PsiIdentifier getNameIdentifier() {
        return myNameIdentifier;
    }

    @Override
    public TextRange getTextRange() {
        TextRange r = super.getTextRange();
        return r == null ? TextRange.EMPTY_RANGE : r;
    }

    @Override
    public ParcelizeLightParameter setModifiers(String... modifiers) {
        ParcelizeLightModifierList modifierList = new ParcelizeLightModifierList(getManager(), getLanguage(), Collections.emptySet(), modifiers);
        ParcelizeReflectionUtil.setFinalFieldPerReflection(LightVariableBuilder.class, this, LightModifierList.class, modifierList);
        return this;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) {
            return true;
        }
        if (o == null || getClass() != o.getClass()) {
            return false;
        }

        ParcelizeLightParameter that = (ParcelizeLightParameter) o;

        final PsiType thisType = getType();
        final PsiType thatType = that.getType();
        if (thisType.isValid() != thatType.isValid()) {
            return false;
        }

        return thisType.getCanonicalText().equals(thatType.getCanonicalText());
    }

    @Override
    public int hashCode() {
        return getType().hashCode();
    }
}
