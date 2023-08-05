package xyz.fay.reference.vendor.utils;

import android.content.Context;

import androidx.annotation.NonNull;

import com.android.volley.toolbox.StringRequest;
import com.android.volley.toolbox.Volley;

public class Networking {
    private final Context context;

    public Networking(Context context) {
        this.context = context;
    }

    public void sendRequest(@NonNull HTTPRequest httpRequest, @NonNull RequestListener requestListener) {
        StringRequest stringRequest = new StringRequest(httpRequest.getRequestMethod().getRawValue(), httpRequest.getRequestURL(), requestListener::onSuccess, requestListener::onFailure);
        Volley.newRequestQueue(context).add(stringRequest);
    }

    public interface RequestListener {
        void onSuccess(String resultData);
        void onFailure(Throwable throwable);
    }
}
