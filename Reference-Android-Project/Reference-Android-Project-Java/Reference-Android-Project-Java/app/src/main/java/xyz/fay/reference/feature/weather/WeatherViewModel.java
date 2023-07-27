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

import androidx.lifecycle.MutableLiveData;
import androidx.lifecycle.ViewModel;

import xyz.fay.reference.networking.NetworkManager;
import xyz.fay.reference.networking.response.GetCityListResponse;

public class WeatherViewModel extends ViewModel {
    private final MutableLiveData<WeatherDataModel> weatherDataModel = new MutableLiveData<>();
    private final MutableLiveData<GetCityListResponse> getCityListResponse = new MutableLiveData<>();

    public void viewIsReady(Context context) {
        NetworkManager manager = new NetworkManager();
        manager.getLivesWeather(context, response -> {
            if (response != null) {
                WeatherDataModel dataModel = new WeatherDataModel(
                        response.getLives()[0].getTemperature(),
                        response.getLives()[0].getWeather(),
                        response.getLives()[0].getWinddirection() + response.getLives()[0].getWindpower()
                );
                weatherDataModel.postValue(dataModel);
            }
        });
    }


    public void fetchCityList(Context context) {
        NetworkManager manager = new NetworkManager();

        // setValue() 只能在主线程中调用，postValue() 可以在任何线程中调用
        manager.getCityList(context, getCityListResponse::postValue);
    }

    public MutableLiveData<WeatherDataModel> getWeatherDataModel() {
        return weatherDataModel;
    }

    public MutableLiveData<GetCityListResponse> getGetCityListResponse() {
        return getCityListResponse;
    }
}
