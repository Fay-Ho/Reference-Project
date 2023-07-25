package xyz.fay.reference.feature.weather;

/*
  MIT License

  Copyright (c) 2023 Fay-Ho

  Permission is hereby granted, free of charge, to any person obtaining a copy
  of this software and associated documentation files (the "Software"), to deal
  in the Software without restriction, including without limitation the rights
  to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
  copies of the Software, and to permit persons to whom the Software is
  furnished to do so, subject to the following conditions:

  The above copyright notice and this permission notice shall be included in all
  copies or substantial portions of the Software.

  THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
  IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
  FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
  AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
  LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
  OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
  SOFTWARE.
*/

import androidx.annotation.NonNull;
import androidx.annotation.Nullable;
import androidx.lifecycle.Observer;
import androidx.navigation.NavController;
import androidx.navigation.fragment.NavHostFragment;
import androidx.recyclerview.widget.LinearLayoutManager;
import androidx.recyclerview.widget.RecyclerView;

import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;

import xyz.fay.reference.common.BaseFragment;
import xyz.fay.reference.common.BindingCreator;
import xyz.fay.reference.databinding.WeatherFragmentBinding;
import xyz.fay.reference.networking.response.GetCityResponse;

public class WeatherFragment extends BaseFragment<WeatherFragmentBinding, WeatherViewModel> {
    //region --- Override Methods ---

//    WeatherFragment() {
//        super(new BindingCreator<WeatherFragmentBinding>() {
//            @Override
//            public WeatherFragmentBinding onCreate(@NonNull LayoutInflater layoutInflater, @Nullable ViewGroup viewGroup, @NonNull Boolean attachToParent) {
//                return WeatherFragmentBinding.inflate(layoutInflater, viewGroup, attachToParent);
//            }
//        });
//        super((layoutInflater, viewGroup, attachToParent) -> {
//            return WeatherFragmentBinding.inflate(layoutInflater, viewGroup, attachToParent);
//        });
//        super((layoutInflater, viewGroup, attachToParent) -> WeatherFragmentBinding.inflate(layoutInflater, viewGroup, attachToParent));
//        super(WeatherFragmentBinding::inflate);
//    }

    @NonNull
    @Override
    protected BindingCreator<WeatherFragmentBinding> getBindingCreator() {
        return new BindingCreator<WeatherFragmentBinding>() {
            @Override
            public WeatherFragmentBinding onCreate(@NonNull LayoutInflater layoutInflater, @Nullable ViewGroup viewGroup, @NonNull Boolean attachToParent) {
                return WeatherFragmentBinding.inflate(layoutInflater, viewGroup, attachToParent);
            }
        };
//        return (layoutInflater, viewGroup, attachToParent) -> {
//            return WeatherFragmentBinding.inflate(layoutInflater, viewGroup, attachToParent);
//        };
//        return (layoutInflater, viewGroup, attachToParent) -> WeatherFragmentBinding.inflate(layoutInflater, viewGroup, attachToParent);
//        return WeatherFragmentBinding::inflate;
    }
//    @NonNull
//    @Override
//    protected WeatherFragmentBinding createViewBinding(@NonNull LayoutInflater inflater, @Nullable ViewGroup container, @NonNull Boolean attachToParent) {
//        return WeatherFragmentBinding.inflate(inflater, container, attachToParent);
//    }

    @NonNull
    @Override
    protected Class<WeatherViewModel> createViewModel() {
        return WeatherViewModel.class;
    }

    //endregion

    //region --- View Lifecycle ---

    @Override
    public void onCreateView() {
        hideActionBar();
        setupSubviews();
        getViewModel().getWeatherDataModel().observe(getViewLifecycleOwner(), new Observer<WeatherDataModel>() {
            @Override
            public void onChanged(WeatherDataModel dataModel) {
                getBinding().temperatureView.setText(dataModel.getTemperature());
                getBinding().weatherView.setText(dataModel.getWeather());
                getBinding().windView.setText(dataModel.getWind());
                LinearLayoutManager linearLayoutManager = new LinearLayoutManager(requireContext());
                linearLayoutManager.setOrientation(RecyclerView.HORIZONTAL);
                getBinding().recyclerView.setLayoutManager(linearLayoutManager);
                getBinding().recyclerView.setAdapter(new WeatherAdapter());
            }
        });
//        getViewModel().getWeatherDataModel().observe(getViewLifecycleOwner(), dataModel -> {
//            getBinding().temperatureView.setText(dataModel.getTemperature());
//            getBinding().weatherView.setText(dataModel.getWeather());
//            getBinding().windView.setText(dataModel.getWeather());
//        });
        getViewModel().viewIsReady(requireContext());
    }

    @Override
    public void onDestroyView() {
        super.onDestroyView();
        showActionBar();
    }

    //endregion

    //region --- Subview Management ---

    private void setupSubviews() {
        setupImageView();
    }

    private void setupImageView() {
        getBinding().imageView.bringToFront();
        getBinding().imageView.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                getViewModel().getGetCityResponse().observe(getViewLifecycleOwner(), new Observer<GetCityResponse>() {
                    @Override
                    public void onChanged(GetCityResponse response) {
                        NavController navController = NavHostFragment.findNavController(WeatherFragment.this);
                        navController.navigate(WeatherFragmentDirections.actionWeatherFragmentToLocationFragment(response));
                    }
                });
                getViewModel().fetchCityData(requireContext());
            }
        });
//        getBinding().imageView.setOnClickListener(v -> {
//            getViewModel().getGetCityResponse().observe(getViewLifecycleOwner(), response -> {
//                NavController navController = NavHostFragment.findNavController(this);
//                navController.navigate(WeatherFragmentDirections.actionWeatherFragmentToLocationFragment(response));
//            });
//            getViewModel().fetchCityData(requireContext());
//        });
    }

    //endregion
}
