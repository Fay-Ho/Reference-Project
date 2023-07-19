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

import android.content.Context
import androidx.lifecycle.MutableLiveData
import androidx.lifecycle.ViewModel
import xyz.fay.reference.networking.NetworkManager
import xyz.fay.reference.networking.response.GetCityResponse
import xyz.fay.reference.networking.response.GetWeatherResponse

class WeatherViewModel : ViewModel() {
    private val _dashboardItemDataModel = MutableLiveData<WeatherDashboardItemDataModel?>()
    val dashboardItemDataModel: MutableLiveData<WeatherDashboardItemDataModel?>
        get() = _dashboardItemDataModel

    private val _getCityResponse = MutableLiveData<GetCityResponse?>()
    val getCityResponse: MutableLiveData<GetCityResponse?>
        get() = _getCityResponse

    fun viewIsReady(context: Context) {
        val manager = NetworkManager()
        manager.getWeather(context) {
            it?.let {
                val dataModel = WeatherDashboardItemDataModel(
                    it.lives.first().temperature,
                    it.lives.first().weather,
                    it.lives.first().winddirection + it.lives.first().windpower
                )
                _dashboardItemDataModel.postValue(dataModel)
            }
        }
    }

    fun fetchCityData(context: Context) {
        val manager = NetworkManager()
        manager.getCity(context) {
            it?.let {
                _getCityResponse.postValue(it)
            }
        }
    }
}

//fun fetchCityData(context: Context) {
//    val manager = NetworkManager()
//    manager.getCity(context) {
//        it?.let {
//            // setValue() 只能在主线程中调用，postValue() 可以在任何线程中调用
//            _getCityResponse::setValue
//            _getCityResponse::postValue
//
//            // setValue() 只能在主线程中调用，postValue() 可以在任何线程中调用
//            _getCityResponse.value = it
//            _getCityResponse.postValue(it)
//        }
//    }
//    // setValue() 只能在主线程中调用，postValue() 可以在任何线程中调用
//    manager.getCity(context, _getCityResponse::setValue)
//    manager.getCity(context, _getCityResponse::postValue)
//}
