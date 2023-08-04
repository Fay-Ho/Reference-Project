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

import com.android.volley.RequestQueue;
import com.android.volley.toolbox.StringRequest;
import com.android.volley.toolbox.Volley;
import com.google.gson.Gson;
import com.google.gson.JsonSyntaxException;

import xyz.fay.reference.MainApplication;
import xyz.fay.reference.networking.request.RequestHandler;
import xyz.fay.reference.networking.request.WeatherRequest;
import xyz.fay.reference.networking.response.CityResponse;
import xyz.fay.reference.networking.response.WeatherResponse;
import xyz.fay.reference.utils.AssetProvider;
import xyz.fay.reference.vendor.Result;

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

    //region

    private <R extends Parcelable> void loadFile(@NonNull Class<R> response, @NonNull MockFile fileName, @Nullable LoadListener<R> loadListener) {
        String jsonString = AssetProvider.loadFile(MockFile.MOCK_ASSET.rawValue.concat(fileName.getRawValue()));
        if (loadListener != null) {
            loadListener.onCompletion(new Gson().fromJson(jsonString, response));
        }
    }

    private <R extends Parcelable> void sendRequest(@NonNull RequestHandler requestHandler, @NonNull Class<R> classOfR, @Nullable RequestListener<R> requestListener) {
        RequestQueue queue = Volley.newRequestQueue(MainApplication.getAppContext());
        HTTPRequest httpRequest = requestHandler.makeRequest();
        StringRequest stringRequest = new StringRequest(httpRequest.getMethod(), httpRequest.getUrl(), response -> {
            if (requestListener != null) {
                try {
                    requestListener.onCompletion(Result.success(new Gson().fromJson(response, classOfR)));
                } catch (JsonSyntaxException exception) {
                    requestListener.onCompletion(Result.failure(exception));
                }
            }
        }, error -> {
            if (requestListener != null) {
                requestListener.onCompletion(Result.failure(error));
            }
        });
        queue.add(stringRequest);
    }

    //endregion

    //region

    public final void getCity(@Nullable LoadListener<CityResponse> loadListener) {
        loadFile(CityResponse.class, MockFile.GET_CITY, loadListener);
    }

    public final void getWeather(@Nullable RequestListener<WeatherResponse> requestListener) {
        sendRequest(new WeatherRequest(), WeatherResponse.class, requestListener);
    }

    //endregion

    //region

    public interface LoadListener<R extends Parcelable> {
        void onCompletion(@Nullable R response);
    }

    public interface RequestListener<R extends Parcelable> {
        void onCompletion(@NonNull Result<R> result);
    }

    //endregion
}
