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
public final class WeatherListMainResponse extends Parcelable {
    @NonNull private final Double feels_like;
    @NonNull private final Integer grnd_level;
    @NonNull private final Integer humidity;
    @NonNull private final Integer pressure;
    @NonNull private final Integer sea_level;
    @NonNull private final Double temp;
    @NonNull private final Double temp_kf;
    @NonNull private final Double temp_max;
    @NonNull private final Double temp_min;

    public WeatherListMainResponse(
            @NonNull Double feels_like,
            @NonNull Integer grnd_level,
            @NonNull Integer humidity,
            @NonNull Integer pressure,
            @NonNull Integer sea_level,
            @NonNull Double temp,
            @NonNull Double temp_kf,
            @NonNull Double temp_max,
            @NonNull Double temp_min
    ) {
        this.feels_like = feels_like;
        this.grnd_level = grnd_level;
        this.humidity = humidity;
        this.pressure = pressure;
        this.sea_level = sea_level;
        this.temp = temp;
        this.temp_kf = temp_kf;
        this.temp_max = temp_max;
        this.temp_min = temp_min;
    }
}
