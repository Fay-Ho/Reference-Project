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
import androidx.annotation.Nullable;

import xyz.fay.parcel.Parcelable;
import xyz.fay.parcel.Parcelize;

@Parcelize
public final class WeatherListResponse extends Parcelable {
    @NonNull private final WeatherListCloudsResponse clouds;
    @NonNull private final Integer dt;
    @NonNull private final String dt_txt;
    @NonNull private final WeatherListMainResponse main;
    @NonNull private final Double pop;
    @Nullable private final WeatherListRainResponse rain;
    @NonNull private final WeatherListSysResponse sys;
    @NonNull private final Integer visibility;
    @NonNull private final WeatherListWeatherResponse[] weather;
    @NonNull private final WeatherListWindResponse wind;

    public WeatherListResponse(
            @NonNull WeatherListCloudsResponse clouds,
            @NonNull Integer dt,
            @NonNull String dt_txt,
            @NonNull WeatherListMainResponse main,
            @NonNull Double pop,
            @Nullable WeatherListRainResponse rain,
            @NonNull WeatherListSysResponse sys,
            @NonNull Integer visibility,
            @NonNull WeatherListWeatherResponse[] weather,
            @NonNull WeatherListWindResponse wind
    ) {
        this.clouds = clouds;
        this.dt = dt;
        this.dt_txt = dt_txt;
        this.main = main;
        this.pop = pop;
        this.rain = rain;
        this.sys = sys;
        this.visibility = visibility;
        this.weather = weather;
        this.wind = wind;
    }
}
