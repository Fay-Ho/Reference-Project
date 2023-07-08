package xyz.fay.reference.networking.response;

import xyz.fay.parcel.Parcelable;
import xyz.fay.parcel.Parcelize;

@Parcelize
public final class WeatherLiveResponse extends Parcelable {
    private final String city;
    private final String province;

    public WeatherLiveResponse(String city, String province) {
        this.city = city;
        this.province = province;
    }
}
