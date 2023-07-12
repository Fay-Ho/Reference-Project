package xyz.fay.reference.networking.response;

/**
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

import xyz.fay.parcel.Parcelable;
import xyz.fay.parcel.Parcelize;

@Parcelize
public final class GetWeatherLivesResponse extends Parcelable {
    private final String adcode;
    private final String city;
    private final String humidity;
    private final String humidity_float;
    private final String province;
    private final String reporttime;
    private final String temperature;
    private final String temperature_float;
    private final String weather;
    private final String winddirection;
    private final String windpower;

    public GetWeatherLivesResponse(String adcode, String city, String humidity, String humidity_float, String province, String reporttime, String temperature, String temperature_float, String weather, String winddirection, String windpower) {
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
