package xyz.fay.reference.feature.settings;

import android.os.Bundle;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;

import androidx.annotation.NonNull;
import androidx.annotation.Nullable;
import androidx.fragment.app.Fragment;
import androidx.lifecycle.ViewModelProvider;

import xyz.fay.reference.databinding.SettingsFragmentBinding;

public class SettingsFragment extends Fragment {
    @Override
    public View onCreateView(@NonNull LayoutInflater inflater, @Nullable ViewGroup container, @Nullable Bundle savedInstanceState) {
        SettingsFragmentBinding binding = SettingsFragmentBinding.inflate(inflater, container, false);
        observeViewModel();
        return binding.getRoot();
    }

    private void observeViewModel() {
        SettingsViewModel viewModel = new ViewModelProvider(this).get(SettingsViewModel.class);
    }
}
