package xyz.fay.reference.feature.user;

import androidx.lifecycle.ViewModelProvider;

import android.os.Bundle;

import androidx.annotation.NonNull;
import androidx.annotation.Nullable;
import androidx.fragment.app.Fragment;

import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;

import xyz.fay.reference.databinding.UserFragmentBinding;

public class UserFragment extends Fragment {
    @Override
    public View onCreateView(@NonNull LayoutInflater inflater, @Nullable ViewGroup container, @Nullable Bundle savedInstanceState) {
        UserFragmentBinding binding = UserFragmentBinding.inflate(inflater, container, false);
        observeViewModel();
        return binding.getRoot();
    }

    private void observeViewModel() {
        UserViewModel viewModel = new ViewModelProvider(this).get(UserViewModel.class);
    }
}
