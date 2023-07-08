package xyz.fay.reference.networking.response;

import xyz.fay.parcel.Parcelable;
import xyz.fay.parcel.Parcelize;

@Parcelize
public final class WeatherResponse extends Parcelable {
    private final WeatherLiveResponse[] lives;
    private final String status;

    public WeatherResponse(WeatherLiveResponse[] lives, String status) {
        this.lives = lives;
        this.status = status;
    }
}
