package xyz.fay.reference.feature.home;

import android.content.Context;

import androidx.lifecycle.MutableLiveData;
import androidx.lifecycle.ViewModel;

import xyz.fay.reference.networking.NetworkManager;
import xyz.fay.reference.networking.RequestHandler;
import xyz.fay.reference.networking.response.CityResponse;
import xyz.fay.reference.networking.response.WeatherResponse;

public class HomeViewModel extends ViewModel {
    private final MutableLiveData<CityResponse> cityResponse = new MutableLiveData<>();
    private final MutableLiveData<WeatherResponse> weatherResponse = new MutableLiveData<>();

    public void fetchCityData(Context context) {
        NetworkManager manager = new NetworkManager();
        manager.getCity(context, new RequestHandler<CityResponse>() {
            @Override
            public void completion(CityResponse response) {
                cityResponse.setValue(response);
            }
        });
//        manager.getCity(context, response -> {
//            cityResponse.setValue(response);
//        });
//        manager.getCity(context, cityResponse::setValue);
    }

    public void fetchWeatherData(Context context) {
        NetworkManager manager = new NetworkManager();
        manager.getWeather(context, new RequestHandler<WeatherResponse>() {
            @Override
            public void completion(WeatherResponse response) {
                weatherResponse.setValue(response);
            }
        });
//        manager.getWeather(context, response -> {
//            weatherResponse.setValue(response);
//        });
//        manager.getWeather(context, weatherResponse::setValue);
    }

    public MutableLiveData<CityResponse> getCityResponse() {
        return cityResponse;
    }

    public MutableLiveData<WeatherResponse> getWeatherResponse() {
        return weatherResponse;
    }
}
