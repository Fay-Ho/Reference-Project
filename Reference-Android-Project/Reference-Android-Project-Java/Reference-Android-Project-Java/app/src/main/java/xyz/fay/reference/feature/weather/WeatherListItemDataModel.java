package xyz.fay.reference.feature.weather;

import xyz.fay.parcel.Parcelable;
import xyz.fay.parcel.Parcelize;
import xyz.fay.reference.utils.ImageProvider;

@Parcelize
final class WeatherListItemDataModel extends Parcelable {
    private final String time;
    private final ImageProvider imageProvider;
    private final String weather;

    public WeatherListItemDataModel(String time, ImageProvider imageProvider, String weather) {
        this.time = time;
        this.imageProvider = imageProvider;
        this.weather = weather;
    }
}
