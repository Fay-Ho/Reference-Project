package xyz.fay.reference.networking.response;

import java.util.List;

import xyz.fay.parcel.Parcelable;
import xyz.fay.parcel.Parcelize;

@Parcelize
public final class WeatherResponse extends Parcelable {
    private final List<WeatherLiveResponse> lives;
    private final String status;

    public WeatherResponse(List<WeatherLiveResponse> lives, String status) {
        this.lives = lives;
        this.status = status;
    }
}
