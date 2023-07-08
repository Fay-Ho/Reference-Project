package xyz.fay.reference.feature.home;

import androidx.lifecycle.Observer;

import androidx.annotation.NonNull;
import androidx.navigation.NavController;
import androidx.navigation.fragment.NavHostFragment;

import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;

import xyz.fay.reference.common.BaseFragment;
import xyz.fay.reference.databinding.WeatherFragmentBinding;
import xyz.fay.reference.networking.response.WeatherResponse;

public class HomeFragment extends BaseFragment<WeatherFragmentBinding, HomeViewModel> {
    @NonNull
    @Override
    protected WeatherFragmentBinding createViewBinding(LayoutInflater inflater, ViewGroup container) {
        return WeatherFragmentBinding.inflate(inflater, container, false);
    }

    @NonNull
    @Override
    protected Class<HomeViewModel> createViewModel() {
        return HomeViewModel.class;
    }

    @Override
    protected void onCreateView() {
        setupSubviews();
        observeWeatherResponse();
    }

    private void setupSubviews() {
        binding.button.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                NavController navController = NavHostFragment.findNavController(HomeFragment.this);
                navController.navigate(WeatherFragmentDirections.actionWeatherFragmentToCityFragment());
            }
        });
//        binding.button.setOnClickListener(v -> {
//            NavController navController = NavHostFragment.findNavController(this);
//            navController.navigate(WeatherFragmentDirections.actionWeatherFragmentToCityFragment());
//        });
    }

    private void observeWeatherResponse() {
        viewModel.getWeatherResponse().observe(getViewLifecycleOwner(), new Observer<WeatherResponse>() {
            @Override
            public void onChanged(WeatherResponse response) {
            }
        });
//        viewModel.getWeatherResponse().observe(getViewLifecycleOwner(), response -> {
//        });
        viewModel.fetchData(requireContext());
    }
}
