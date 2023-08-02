package xyz.fay.reference.networking.response;

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

import androidx.annotation.NonNull;

import xyz.fay.parcel.Parcelable;
import xyz.fay.parcel.Parcelize;

@Parcelize
public final class WeatherCityResponse extends Parcelable {
    @NonNull private final WeatherCityCoordResponse coord;
    @NonNull private final String country;
    @NonNull private final Integer id;
    @NonNull private final String name;
    @NonNull private final Integer population;
    @NonNull private final Integer sunrise;
    @NonNull private final Integer sunset;
    @NonNull private final Integer timezone;

    public WeatherCityResponse(
            @NonNull WeatherCityCoordResponse coord,
            @NonNull String country,
            @NonNull Integer id,
            @NonNull String name,
            @NonNull Integer population,
            @NonNull Integer sunrise,
            @NonNull Integer sunset,
            @NonNull Integer timezone
    ) {
        this.coord = coord;
        this.country = country;
        this.id = id;
        this.name = name;
        this.population = population;
        this.sunrise = sunrise;
        this.sunset = sunset;
        this.timezone = timezone;
    }
}
