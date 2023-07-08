package xyz.fay.reference.networking.response;

import xyz.fay.parcel.Parcelable;
import xyz.fay.parcel.Parcelize;

@Parcelize
public final class CityResponse extends Parcelable {
    private final CityListResponse[] cities;

    public CityResponse(CityListResponse[] cities) {
        this.cities = cities;
    }
}
