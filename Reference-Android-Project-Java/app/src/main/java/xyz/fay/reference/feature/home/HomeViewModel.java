package xyz.fay.reference.feature.home;

import android.content.Context;

import androidx.lifecycle.MutableLiveData;
import androidx.lifecycle.ViewModel;

import xyz.fay.reference.networking.NetworkManager;
import xyz.fay.reference.networking.RequestHandler;
import xyz.fay.reference.networking.response.GetCityResponse;
import xyz.fay.reference.networking.response.GetWeatherResponse;

public class HomeViewModel extends ViewModel {
    private final MutableLiveData<GetCityResponse> cityResponse = new MutableLiveData<>();
    private final MutableLiveData<GetWeatherResponse> weatherResponse = new MutableLiveData<>();

    public void fetchCityData(Context context) {
        NetworkManager manager = new NetworkManager();
        manager.getCity(context, new RequestHandler<GetCityResponse>() {
            @Override
            public void completion(GetCityResponse response) {
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
        manager.getWeather(context, new RequestHandler<GetWeatherResponse>() {
            @Override
            public void completion(GetWeatherResponse response) {
                weatherResponse.setValue(response);
            }
        });
//        manager.getWeather(context, response -> {
//            weatherResponse.setValue(response);
//        });
//        manager.getWeather(context, weatherResponse::setValue);
    }

    public MutableLiveData<GetCityResponse> getCityResponse() {
        return cityResponse;
    }

    public MutableLiveData<GetWeatherResponse> getWeatherResponse() {
        return weatherResponse;
    }
}
