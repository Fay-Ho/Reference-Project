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

import com.google.gson.Gson;

import java.lang.reflect.Type;

import xyz.fay.reference.networking.response.GetCityResponse;
import xyz.fay.reference.utils.AssetProvider;

public final class NetworkManager {
    private final static String MOCK = "mock/";

    private enum MockFile {
        GET_CITY("get_city.json");

        private final String rawValue;

        MockFile(String rawValue) {
            this.rawValue = rawValue;
        }

        public String getRawValue() {
            return rawValue;
        }
    }

    private <R extends Parcelable> void sendRequest(@NonNull Context context, @NonNull Class<R> parcelableResponse, MockFile fileName, @Nullable RequestHandler<R> requestHandler) {
        String jsonString = AssetProvider.loadFile(context, MOCK.concat(fileName.getRawValue()));
        if (requestHandler != null) {
            requestHandler.completion(parseData(jsonString, parcelableResponse));
        }
    }

    private <R extends Parcelable> R parseData(String data, Class<R> response) {
        Gson gson = new Gson();
        return gson.fromJson(data, (Type) response);
    }

    public final void getCity(@NonNull Context context, @Nullable RequestHandler<GetCityResponse> requestHandler) {
        sendRequest(context, GetCityResponse.class, MockFile.GET_CITY, requestHandler);
    }
}
