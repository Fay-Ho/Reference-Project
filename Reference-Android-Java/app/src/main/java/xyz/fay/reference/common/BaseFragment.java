package xyz.fay.reference.common;

import android.os.Bundle;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;

import androidx.annotation.NonNull;
import androidx.annotation.Nullable;
import androidx.fragment.app.Fragment;
import androidx.lifecycle.ViewModel;
import androidx.lifecycle.ViewModelProvider;
import androidx.viewbinding.ViewBinding;

public abstract class BaseFragment<VB extends ViewBinding, VM extends ViewModel> extends Fragment {
    protected VB binding;
    protected VM viewModel;

    @Nullable
    @Override
    public View onCreateView(@NonNull LayoutInflater inflater, @Nullable ViewGroup container, @Nullable Bundle savedInstanceState) {
        binding = createViewBinding(inflater, container);
        viewModel = new ViewModelProvider(this).get(createViewModel());
        onCreateView();
        return binding.getRoot();
    }

    @NonNull
    protected abstract VB createViewBinding(LayoutInflater inflater, ViewGroup container);

    @NonNull
    protected abstract Class<VM> createViewModel();

    protected abstract void onCreateView();
}
