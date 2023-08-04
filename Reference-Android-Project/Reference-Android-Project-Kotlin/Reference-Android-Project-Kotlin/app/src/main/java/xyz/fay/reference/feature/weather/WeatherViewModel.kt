package xyz.fay.reference.feature.weather

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

import androidx.lifecycle.MutableLiveData
import androidx.lifecycle.ViewModel
import xyz.fay.reference.networking.NetworkManager
import xyz.fay.reference.networking.response.CityResponse
import xyz.fay.reference.networking.response.WeatherResponse
import java.time.LocalDateTime
import java.time.format.DateTimeFormatter
import kotlin.math.ceil

class WeatherViewModel : ViewModel() {
    private val _weatherDataModel = MutableLiveData<WeatherDataModel>()
    val weatherDataModel: MutableLiveData<WeatherDataModel> get() = _weatherDataModel

    private val _cityResponse = MutableLiveData<CityResponse>()
    val cityResponse: MutableLiveData<CityResponse> get() = _cityResponse

    fun viewIsReady() {
        NetworkManager().getWeather {
            it.onSuccess(::handleWeatherResponse)
            it.onFailure(::println)
        }
    }

    fun fetchCityList() {
        // `setValue()` can only run in main thread, `postValue()` can run in all thread.
        NetworkManager().getCity(_cityResponse::postValue)
    }

    private fun handleWeatherResponse(response: WeatherResponse) {
        response.list.firstOrNull()?.let { listResponse ->
            listResponse.weather.firstOrNull()?.let { weatherResponse ->
                _weatherDataModel.postValue(
                    WeatherDataModel(
                        formatDouble(listResponse.main.temp),
                        weatherResponse.main,
                        listResponse.wind.deg.toString(),
                        makeListItems(response)
                    )
                )
            }
        }
    }

    private fun makeListItems(response: WeatherResponse): Array<WeatherListItemDataModel> {
        return response.list.map {
            WeatherListItemDataModel(
                formatDate(it.dt_txt),
                it.weather.firstOrNull()?.main ?: "",
                formatDouble(it.main.temp)
            )
        }.toTypedArray()
    }

    private fun formatDate(string: String): String {
        var formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss")
        val date = LocalDateTime.parse(string, formatter)
        formatter = DateTimeFormatter.ofPattern("HH:mm")
        return date.format(formatter)
    }

    private fun formatDouble(value: Double) =
        ceil(value).toInt().toString()
}
