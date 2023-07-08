package xyz.fay.reference;

import com.intellij.lang.Language;
import com.intellij.openapi.util.TextRange;
import com.intellij.psi.*;
import com.intellij.psi.impl.light.LightModifierList;
import com.intellij.psi.impl.light.LightParameter;
import com.intellij.psi.impl.light.LightVariableBuilder;
import org.jetbrains.annotations.NotNull;

import java.util.Collections;

public class ReferenceLightParameter extends LightParameter implements SyntheticElement {
    private String myName;
    private final ReferenceLightIdentifier myNameIdentifier;

    public ReferenceLightParameter(@NotNull String name, @NotNull PsiType type, PsiElement declarationScope, Language language) {
        super(name, type, declarationScope, language);
        myName = name;
        PsiManager manager = declarationScope.getManager();
        myNameIdentifier = new ReferenceLightIdentifier(manager, name);
        ReferenceReflectionUtil.setFinalFieldPerReflection(LightVariableBuilder.class, this, LightModifierList.class,
                new ReferenceLightModifierList(manager, language, Collections.emptySet()));
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
    public ReferenceLightParameter setModifiers(String... modifiers) {
        ReferenceLightModifierList modifierList = new ReferenceLightModifierList(getManager(), getLanguage(), Collections.emptySet(), modifiers);
        ReferenceReflectionUtil.setFinalFieldPerReflection(LightVariableBuilder.class, this, LightModifierList.class, modifierList);
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

        ReferenceLightParameter that = (ReferenceLightParameter) o;

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
