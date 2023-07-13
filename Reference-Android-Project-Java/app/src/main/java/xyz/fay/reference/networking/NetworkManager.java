package xyz.fay.reference.networking;

import android.content.Context;
import android.os.Parcelable;

import androidx.annotation.NonNull;
import androidx.annotation.Nullable;

import com.google.gson.Gson;

import java.lang.reflect.Type;

import xyz.fay.reference.networking.response.GetCityResponse;
import xyz.fay.reference.networking.response.GetWeatherResponse;
import xyz.fay.reference.networking.response.PostUserResponse;
import xyz.fay.reference.utils.AssetProvider;

public final class NetworkManager {
    private enum MockFile {
        GET_CITY("get_city.json"),
        GET_WEATHER("get_weather.json"),
        POST_USER("post_user.json");

        private final String value;

        MockFile(String value) {
            this.value = value;
        }

        public String getValue() {
            return value;
        }
    }

    private <R extends Parcelable> void sendRequest(@NonNull Context context, @NonNull Class<R> parcelableResponse, String fileName, @Nullable RequestHandler<R> requestHandler) {
        String jsonString = AssetProvider.loadJsonFile(context, fileName);
        if (requestHandler != null) {
            requestHandler.completion(parseData(jsonString, parcelableResponse));
        }
    }

    private <R extends Parcelable> R parseData(String data, Class<R> response) {
        Gson gson = new Gson();
        return gson.fromJson(data, (Type) response);
    }

    public final void getCity(@NonNull Context context, @Nullable RequestHandler<GetCityResponse> requestHandler) {
        sendRequest(context, GetCityResponse.class, MockFile.GET_CITY.getValue(), requestHandler);
    }

    public final void getWeather(@NonNull Context context, @Nullable RequestHandler<GetWeatherResponse> requestHandler) {
        sendRequest(context, GetWeatherResponse.class, MockFile.GET_WEATHER.getValue(), requestHandler);
    }

    public final void postUser(@NonNull Context context, @Nullable RequestHandler<PostUserResponse> requestHandler) {
        sendRequest(context, PostUserResponse.class, MockFile.POST_USER.getValue(), requestHandler);
    }
}
