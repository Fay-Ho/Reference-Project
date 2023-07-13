package xyz.fay.reference.feature.home;

import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;

import androidx.annotation.NonNull;
import androidx.lifecycle.Observer;
import androidx.navigation.NavController;
import androidx.navigation.fragment.NavHostFragment;

import xyz.fay.reference.common.BaseFragment;
import xyz.fay.reference.databinding.HomeFragmentBinding;
import xyz.fay.reference.networking.response.GetCityResponse;
import xyz.fay.reference.networking.response.GetWeatherResponse;

public final class HomeFragment extends BaseFragment<HomeFragmentBinding, HomeViewModel> {
    @NonNull
    @Override
    protected HomeFragmentBinding createViewBinding(LayoutInflater inflater, ViewGroup container) {
        return HomeFragmentBinding.inflate(inflater, container, false);
    }

    @NonNull
    @Override
    protected Class<HomeViewModel> createViewModel() {
        return HomeViewModel.class;
    }

    @Override
    protected void onCreateView() {
        setupSubviews();
        observeCityResponse();
        observeWeatherResponse();
    }

    private void setupSubviews() {
        binding.button.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                viewModel.fetchCityData(requireContext());
            }
        });
//        binding.button.setOnClickListener(v -> {
//            viewModel.fetchCityData(requireContext());
//        });
    }

    private void observeCityResponse() {
        viewModel.getCityResponse().observe(getViewLifecycleOwner(), new Observer<GetCityResponse>() {
            @Override
            public void onChanged(GetCityResponse getCityResponse) {
                NavController navController = NavHostFragment.findNavController(HomeFragment.this);
                navController.navigate(HomeFragmentDirections.actionHomeFragmentToCityFragment(getCityResponse.getCities()));
            }
        });
//        viewModel.getCityResponse().observe(getViewLifecycleOwner(), response -> {
//            NavController navController = NavHostFragment.findNavController(this);
//            navController.navigate(HomeFragmentDirections.actionHomeFragmentToCityFragment(response.getCities()));
//        });
    }

    private void observeWeatherResponse() {
        viewModel.getWeatherResponse().observe(getViewLifecycleOwner(), new Observer<GetWeatherResponse>() {
            @Override
            public void onChanged(GetWeatherResponse getWeatherResponse) {}
        });
//        viewModel.getWeatherResponse().observe(getViewLifecycleOwner(), response -> {});
        viewModel.fetchWeatherData(requireContext());
    }
}
