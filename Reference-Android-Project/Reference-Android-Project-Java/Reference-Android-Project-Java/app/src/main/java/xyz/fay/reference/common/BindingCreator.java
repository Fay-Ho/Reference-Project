package xyz.fay.reference.common;

import android.view.LayoutInflater;
import android.view.ViewGroup;

import androidx.annotation.NonNull;
import androidx.annotation.Nullable;

public interface BindingCreator<VB> {
    VB onCreate(@NonNull LayoutInflater layoutInflater, @Nullable ViewGroup viewGroup, @NonNull Boolean attachToParent);
}
