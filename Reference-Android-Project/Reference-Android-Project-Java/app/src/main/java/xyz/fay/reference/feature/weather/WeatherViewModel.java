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

import android.content.Context;

import androidx.annotation.Nullable;
import androidx.lifecycle.MutableLiveData;
import androidx.lifecycle.ViewModel;

import xyz.fay.reference.networking.NetworkManager;
import xyz.fay.reference.networking.RequestHandler;
import xyz.fay.reference.networking.response.GetCityResponse;
import xyz.fay.reference.networking.response.GetWeatherResponse;

public class WeatherViewModel extends ViewModel {
    private final MutableLiveData<WeatherDashboardItemDataModel> dashboardItemDataModel = new MutableLiveData<>();
    private final MutableLiveData<GetCityResponse> getCityResponse = new MutableLiveData<>();

    public MutableLiveData<WeatherDashboardItemDataModel> getDashboardItemDataModel() {
        return dashboardItemDataModel;
    }

    public MutableLiveData<GetCityResponse> getGetCityResponse() {
        return getCityResponse;
    }

    public void viewIsReady(Context context) {
        NetworkManager manager = new NetworkManager();
        manager.getWeather(context, new RequestHandler<GetWeatherResponse>() {
            @Override
            public void completion(@Nullable GetWeatherResponse response) {
                if (response != null) {
                    WeatherDashboardItemDataModel dataModel = new WeatherDashboardItemDataModel(
                            response.getLives()[0].getTemperature(),
                            response.getLives()[0].getWeather(),
                            response.getLives()[0].getWinddirection() + response.getLives()[0].getWindpower()
                    );
                    dashboardItemDataModel.postValue(dataModel);
                }
            }
        });
    }

    public void fetchCityData(Context context) {
        NetworkManager manager = new NetworkManager();
        manager.getCity(context, new RequestHandler<GetCityResponse>() {
            @Override
            public void completion(@Nullable GetCityResponse response) {
                if (response != null) {
                    getCityResponse.postValue(response);
                }
            }
        });
    }
}

//    public void fetchCityData(Context context) {
//        NetworkManager manager = new NetworkManager();
//        manager.getCity(context, new RequestHandler<GetCityResponse>() {
//            @Override
//            public void completion(@Nullable GetCityResponse response) {
//                if (response != null) {
//                    // setValue() 只能在主线程中调用，postValue() 可以在任何线程中调用
//                    getCityResponse.setValue(response);
//                    getCityResponse.postValue(response);
//                }
//            }
//        });
//        manager.getCity(context, response -> {
//            // setValue() 只能在主线程中调用，postValue() 可以在任何线程中调用
//            getCityResponse.setValue(response);
//            getCityResponse.postValue(response);
//        });
//        // setValue() 只能在主线程中调用，postValue() 可以在任何线程中调用
//        manager.getCity(context, getCityResponse::setValue);
//        manager.getCity(context, getCityResponse::postValue);
//    }
