package xyz.fay.reference.networking.response;

import xyz.fay.parcel.Parcelable;
import xyz.fay.parcel.Parcelize;

@Parcelize
public final class CityListResponse extends Parcelable {
    private final String name;

    public CityListResponse(String name) {
        this.name = name;
    }
}
