package xyz.fay.reference.feature.city;

import android.content.Context;

import androidx.lifecycle.MutableLiveData;
import androidx.lifecycle.ViewModel;

import xyz.fay.reference.networking.NetworkManager;
import xyz.fay.reference.networking.RequestHandler;
import xyz.fay.reference.networking.response.CityResponse;

public class CityViewModel extends ViewModel {
    private final MutableLiveData<CityResponse> cityResponse = new MutableLiveData<>();

    public void fetchData(Context context) {
        NetworkManager manager = new NetworkManager();
        manager.getCity(context, new RequestHandler<CityResponse>() {
            @Override
            public void completion(CityResponse response) {
                cityResponse.setValue(response);
            }
        });
//        manager.getCity(context, response -> {
//            cityResponse.setValue(response);
//        });
//        manager.getCity(context, cityResponse::setValue);
    }

    public MutableLiveData<CityResponse> getCityResponse() {
        return cityResponse;
    }
}
