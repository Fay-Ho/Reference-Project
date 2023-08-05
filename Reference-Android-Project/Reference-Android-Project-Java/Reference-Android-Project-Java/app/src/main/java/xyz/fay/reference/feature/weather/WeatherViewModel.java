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
import androidx.lifecycle.MutableLiveData;
import androidx.lifecycle.ViewModel;

import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.Arrays;

import xyz.fay.reference.networking.NetworkManager;
import xyz.fay.reference.networking.response.CityResponse;
import xyz.fay.reference.networking.response.WeatherListResponse;
import xyz.fay.reference.networking.response.WeatherListWeatherResponse;
import xyz.fay.reference.networking.response.WeatherResponse;
import xyz.fay.reference.vendor.Arrays2;

public final class WeatherViewModel extends ViewModel {
    private final MutableLiveData<WeatherDataModel> weatherDataModel = new MutableLiveData<>();
    public MutableLiveData<WeatherDataModel> getWeatherDataModel() {
        return weatherDataModel;
    }

    private final MutableLiveData<CityResponse> cityResponse = new MutableLiveData<>();
    public MutableLiveData<CityResponse> getCityResponse() {
        return cityResponse;
    }

    public void viewIsReady() {
        new NetworkManager().getWeather(result -> {
            result.onSuccess(this::handleWeatherResponse);
            result.onFailure(System.out::println);
        });
    }

    public void fetchCityList() {
        // `setValue()` can only run in main thread, `postValue()` can run in all thread.
        new NetworkManager().getCity(cityResponse::postValue);
    }

    private void handleWeatherResponse(@NonNull WeatherResponse response) {
        WeatherListResponse listResponse = Arrays2.firstOrNull(Arrays.asList(response.getList()));
        if (listResponse == null) { return; }

        WeatherListWeatherResponse weatherResponse = Arrays2.firstOrNull(Arrays.asList(listResponse.getWeather()));
        if (weatherResponse == null) { return; }

        weatherDataModel.postValue(
            new WeatherDataModel(
                formatDouble(listResponse.getMain().getTemp()),
                weatherResponse.getMain(),
                listResponse.getWind().getDeg().toString(),
                makeListItems(response)
            )
        );
    }

    @NonNull
    private WeatherListItemDataModel[] makeListItems(@NonNull WeatherResponse response) {
        return Arrays
            .stream(response.getList())
            .map(this::makeListItem)
            .toArray(WeatherListItemDataModel[]::new);
    }

    @NonNull
    private WeatherListItemDataModel makeListItem(@NonNull WeatherListResponse response) {
        return new WeatherListItemDataModel(
            formatDate(response.getDt_txt()),
            formatImage(Arrays2.firstOrNull(Arrays.asList(response.getWeather()))),
            formatDouble(response.getMain().getTemp())
        );
    }

    @NonNull
    private String formatDate(@NonNull String string) {
        DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss");
        LocalDateTime date = LocalDateTime.parse(string, formatter);
        formatter = DateTimeFormatter.ofPattern("HH:mm");
        return date.format(formatter);
    }

    @NonNull
    private String formatDouble(@NonNull Double value) {
        return String.valueOf((int) Math.ceil(value));
    }

    @NonNull
    private String formatImage(@Nullable WeatherListWeatherResponse response) {
        return response != null ? response.getMain() : "";
    }
}
