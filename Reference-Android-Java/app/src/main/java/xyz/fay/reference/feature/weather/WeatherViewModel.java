package xyz.fay.reference.feature.weather;

import android.content.Context;

import androidx.lifecycle.MutableLiveData;
import androidx.lifecycle.ViewModel;

import xyz.fay.reference.networking.NetworkManager;
import xyz.fay.reference.networking.RequestHandler;
import xyz.fay.reference.networking.response.WeatherResponse;

public class WeatherViewModel extends ViewModel {
    private final MutableLiveData<WeatherResponse> weatherResponse = new MutableLiveData<>();

    public void fetchData(Context context) {
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

    public MutableLiveData<WeatherResponse> getWeatherResponse() {
        return weatherResponse;
    }
}
