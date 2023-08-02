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

import android.os.Parcelable;

import androidx.annotation.NonNull;
import androidx.annotation.Nullable;

import com.google.gson.Gson;

import java.lang.reflect.Type;

import xyz.fay.reference.networking.response.CityResponse;
import xyz.fay.reference.networking.response.WeatherResponse;
import xyz.fay.reference.utils.AssetProvider;

public final class NetworkManager {
    private enum MockFile {
        GET_CITY("city.json"),
        GET_WEATHER("weather.json"),
        MOCK_ASSET("mock/");

        private final String rawValue;

        MockFile(String rawValue) {
            this.rawValue = rawValue;
        }

        public String getRawValue() {
            return rawValue;
        }
    }

    private <R extends Parcelable> void sendRequest(@NonNull Class<R> parcelableResponse, @NonNull MockFile fileName, @Nullable RequestHandler<R> requestHandler) {
        String jsonString = AssetProvider.loadFile(MockFile.MOCK_ASSET.rawValue.concat(fileName.getRawValue()));
        if (requestHandler != null) {
            requestHandler.completion(parseData(jsonString, parcelableResponse));
        }
    }

//    private void baseRequest() {
//        RequestQueue queue = Volley.newRequestQueue(MainApplication.getAppContext());
////        String url = "https://restapi.amap.com/v3/weather/weatherInfo?city=440106&key=13b60d45154a4e2670df67a585752ce1&extensions=all";
//        String url = "https://api.openweathermap.org/data/2.5/forecast?q=guangzhou&appid=9520804e734d81ed699abf203a13bd68";
//        StringRequest stringRequest = new StringRequest(Request.Method.GET, url, new Response.Listener<String>() {
//            @Override
//            public void onResponse(String response) {
//                System.out.println("11111");
//                System.out.println(response);
//            }
//        }, new Response.ErrorListener() {
//            @Override
//            public void onErrorResponse(VolleyError error) {
//                System.out.println(error);
//            }
//        });
////        StringRequest stringRequest2 = new StringRequest(Request.Method.GET, url, response -> {
////            System.out.println(response);
////        }, error -> {
////            System.out.println(error);
////        });
//        queue.add(stringRequest);
//    }

    private <R extends Parcelable> R parseData(String data, Class<R> response) {
        Gson gson = new Gson();
        return gson.fromJson(data, (Type) response);
    }

    public final void getCity(@Nullable RequestHandler<CityResponse> requestHandler) {
        sendRequest(CityResponse.class, MockFile.GET_CITY, requestHandler);
    }
    public final void getWeather(@Nullable RequestHandler<WeatherResponse> requestHandler) {
        sendRequest(WeatherResponse.class, MockFile.GET_WEATHER, requestHandler);
    }
}
