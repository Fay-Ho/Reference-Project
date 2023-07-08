package xyz.fay.reference.feature.city;

import androidx.lifecycle.Observer;
import androidx.lifecycle.ViewModelProvider;

import android.os.Bundle;

import androidx.annotation.NonNull;
import androidx.annotation.Nullable;
import androidx.fragment.app.Fragment;
import androidx.recyclerview.widget.LinearLayoutManager;

import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;

import xyz.fay.reference.databinding.CityFragmentBinding;
import xyz.fay.reference.networking.response.CityResponse;

public class CityFragment extends Fragment {
    @Override
    public View onCreateView(@NonNull LayoutInflater inflater, @Nullable ViewGroup container, @Nullable Bundle savedInstanceState) {
        CityViewModel viewModel = new ViewModelProvider(this).get(CityViewModel.class);
        CityFragmentBinding binding = CityFragmentBinding.inflate(inflater, container, false);
        observeCityResponse(viewModel, binding);
        return binding.getRoot();
    }

    private void observeCityResponse(CityViewModel viewModel, CityFragmentBinding binding) {
        viewModel.getCityResponse().observe(getViewLifecycleOwner(), new Observer<CityResponse>() {
            @Override
            public void onChanged(CityResponse response) {
                binding.recyclerView.setLayoutManager(new LinearLayoutManager(requireContext()));
                binding.recyclerView.setAdapter(new CityAdapter(response.getCities(), new CityAdapter.OnClickListener() {
                    @Override
                    public void onClick() {
                    }
                }));
            }
        });
        viewModel.getCityResponse().observe(getViewLifecycleOwner(), response -> {
            binding.recyclerView.setLayoutManager(new LinearLayoutManager(requireContext()));
            binding.recyclerView.setAdapter(new CityAdapter(response.getCities(), () -> {
            }));
        });
        viewModel.fetchData(requireContext());
    }
}
