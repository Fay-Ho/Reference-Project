package xyz.fay.reference.networking.response

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

import android.os.Parcelable
import com.google.gson.annotations.SerializedName
import kotlinx.parcelize.Parcelize

@Parcelize
data class WeatherResponse(
    val city: WeatherCityResponse,
    val cnt: Int,
    val cod: String,
    val list: Array<WeatherListResponse>,
    val message: Int
) : Parcelable

@Parcelize
data class WeatherCityResponse(
    val coord: WeatherCityCoordResponse,
    val country: String,
    val id: Int,
    val name: String,
    val population: Int,
    val sunrise: Int,
    val sunset: Int,
    val timezone: Int
) : Parcelable

@Parcelize
data class WeatherCityCoordResponse(
    val lat: Double,
    val lon: Double
) : Parcelable

@Parcelize
data class WeatherListResponse(
    val clouds: WeatherListCloudsResponse,
    val dt: Int,
    val dt_txt: String,
    val main: WeatherListMainResponse,
    val pop: Double,
    val rain: WeatherListRainResponse?,
    val sys: WeatherListSysResponse,
    val visibility: Int,
    val weather: Array<WeatherListWeatherResponse>,
    val wind: WeatherListWindResponse
) : Parcelable

@Parcelize
data class WeatherListCloudsResponse(
    val all: Int
) : Parcelable

@Parcelize
data class WeatherListMainResponse(
    val feels_like: Double,
    val grnd_level: Int,
    val humidity: Int,
    val pressure: Int,
    val sea_level: Int,
    val temp: Double,
    val temp_kf: Double,
    val temp_max: Double,
    val temp_min: Double
) : Parcelable

@Parcelize
data class WeatherListRainResponse(
    @SerializedName("3h")
    val h: Double
) : Parcelable

@Parcelize
data class WeatherListSysResponse(
    val pod: String
) : Parcelable

@Parcelize
data class WeatherListWeatherResponse(
    val description: String,
    val icon: String,
    val id: Int,
    val main: String
) : Parcelable

@Parcelize
data class WeatherListWindResponse(
    val deg: Int,
    val gust: Double,
    val speed: Double
) : Parcelable
