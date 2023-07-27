package xyz.fay.reference.networking;

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
import android.os.Parcelable;

import androidx.annotation.NonNull;
import androidx.annotation.Nullable;

import com.android.volley.Request;
import com.android.volley.RequestQueue;
import com.android.volley.toolbox.StringRequest;
import com.android.volley.toolbox.Volley;
import com.google.gson.Gson;

import java.lang.reflect.Type;

import xyz.fay.reference.networking.response.GetCityListResponse;
import xyz.fay.reference.networking.response.GetForecastsWeatherResponse;
import xyz.fay.reference.networking.response.GetLivesWeatherResponse;
import xyz.fay.reference.utils.AssetProvider;

public final class NetworkManager {
    private enum MockFile {
        GET_CITY_LIST("get_city_list.json"),
        GET_FORECASTS_WEATHER("get_forecasts_weather.json"),
        GET_LIVES_WEATHER("get_lives_weather.json"),
        MOCK_ASSET("mock/");

        private final String rawValue;

        MockFile(String rawValue) {
            this.rawValue = rawValue;
        }

        public String getRawValue() {
            return rawValue;
        }
    }

    private <R extends Parcelable> void sendRequest(@NonNull Context context, @NonNull Class<R> parcelableResponse, @NonNull MockFile fileName, @Nullable RequestHandler<R> requestHandler) {
        String jsonString = AssetProvider.loadFile(context, MockFile.MOCK_ASSET.rawValue.concat(fileName.getRawValue()));
        if (requestHandler != null) {
            requestHandler.completion(parseData(jsonString, parcelableResponse));
        }
    }

    private void baseRequest(Context context) {
        RequestQueue queue = Volley.newRequestQueue(context);
        String url = "https://restapi.amap.com/v3/weather/weatherInfo?city=440106&key=13b60d45154a4e2670df67a585752ce1&extensions=all";
//        StringRequest stringRequest = new StringRequest(Request.Method.GET, url, new Response.Listener<String>() {
//            @Override
//            public void onResponse(String response) {
//                System.out.println(response);
//            }
//        }, new Response.ErrorListener() {
//            @Override
//            public void onErrorResponse(VolleyError error) {
//                System.out.println(error);
//            }
//        });
        StringRequest stringRequest = new StringRequest(Request.Method.GET, url, response -> {

        }, error -> {

        });
        queue.add(stringRequest);
    }

    private <R extends Parcelable> R parseData(String data, Class<R> response) {
        Gson gson = new Gson();
        return gson.fromJson(data, (Type) response);
    }

    public final void getCityList(@NonNull Context context, @Nullable RequestHandler<GetCityListResponse> requestHandler) {
        sendRequest(context, GetCityListResponse.class, MockFile.GET_CITY_LIST, requestHandler);
    }

    public final void getForecastsWeather(@NonNull Context context, @Nullable RequestHandler<GetForecastsWeatherResponse> requestHandler) {
        sendRequest(context, GetForecastsWeatherResponse.class, MockFile.GET_FORECASTS_WEATHER, requestHandler);
    }

    public final void getLivesWeather(@NonNull Context context, @Nullable RequestHandler<GetLivesWeatherResponse> requestHandler) {
        sendRequest(context, GetLivesWeatherResponse.class, MockFile.GET_LIVES_WEATHER, requestHandler);
    }
}
