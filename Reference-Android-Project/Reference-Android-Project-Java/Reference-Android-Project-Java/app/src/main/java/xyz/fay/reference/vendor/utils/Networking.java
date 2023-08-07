package xyz.fay.reference.vendor.utils;

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

import androidx.annotation.NonNull;

import com.android.volley.toolbox.StringRequest;
import com.android.volley.toolbox.Volley;

public final class Networking {
    private final Context context;

    public Networking(Context context) {
        this.context = context;
    }

    public void sendRequest(@NonNull HTTPRequest httpRequest, @NonNull RequestListener requestListener) {
        StringRequest request = new StringRequest(httpRequest.getRequestMethod().getRawValue(), httpRequest.getRequestURL(), requestListener::onSuccess, requestListener::onFailure);
        Volley.newRequestQueue(context).add(request);
    }

    public interface RequestListener {
        void onSuccess(String resultData);
        void onFailure(Throwable throwable);
    }
}
