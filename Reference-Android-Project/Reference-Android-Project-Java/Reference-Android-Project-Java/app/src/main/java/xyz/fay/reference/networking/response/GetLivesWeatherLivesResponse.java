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
public final class GetLivesWeatherLivesResponse extends Parcelable {
    @NonNull private final String adcode;
    @NonNull private final String city;
    @NonNull private final String humidity;
    @NonNull private final String humidity_float;
    @NonNull private final String province;
    @NonNull private final String reporttime;
    @NonNull private final String temperature;
    @NonNull private final String temperature_float;
    @NonNull private final String weather;
    @NonNull private final String winddirection;
    @NonNull private final String windpower;

    public GetLivesWeatherLivesResponse(
            @NonNull String adcode,
            @NonNull String city,
            @NonNull String humidity,
            @NonNull String humidity_float,
            @NonNull String province,
            @NonNull String reporttime,
            @NonNull String temperature,
            @NonNull String temperature_float,
            @NonNull String weather,
            @NonNull String winddirection,
            @NonNull String windpower
    ) {
        this.adcode = adcode;
        this.city = city;
        this.humidity = humidity;
        this.humidity_float = humidity_float;
        this.province = province;
        this.reporttime = reporttime;
        this.temperature = temperature;
        this.temperature_float = temperature_float;
        this.weather = weather;
        this.winddirection = winddirection;
        this.windpower = windpower;
    }
}
