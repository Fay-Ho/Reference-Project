package xyz.fay.reference.networking.response;

import java.util.List;

import xyz.fay.parcel.Parcelable;
import xyz.fay.parcel.Parcelize;

@Parcelize
public final class CityResponse extends Parcelable {
    private final List<CityListResponse> cities;

    public CityResponse(List<CityListResponse> cities) {
        this.cities = cities;
    }
}
