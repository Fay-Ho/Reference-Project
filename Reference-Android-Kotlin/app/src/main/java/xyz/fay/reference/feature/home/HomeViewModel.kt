package xyz.fay.reference.feature.home

import android.content.Context
import androidx.lifecycle.MutableLiveData
import androidx.lifecycle.ViewModel
import xyz.fay.reference.networking.NetworkManager
import xyz.fay.reference.networking.response.GetCityResponse
import xyz.fay.reference.networking.response.GetWeatherResponse

class HomeViewModel : ViewModel() {
    private val _cityResponse = MutableLiveData<GetCityResponse?>()
    val cityResponse: MutableLiveData<GetCityResponse?>
        get() = _cityResponse

    private val _weatherResponse = MutableLiveData<GetWeatherResponse?>()
    val weatherResponse: MutableLiveData<GetWeatherResponse?>
        get() = _weatherResponse

    fun fetchCityData(context: Context) {
        val manager = NetworkManager()
        manager.getCity(context) {
            _cityResponse.value = it
        }
//        manager.getCity(context, _cityResponse::setValue)
    }

    fun fetchWeatherData(context: Context) {
        val manager = NetworkManager()
        manager.getWeather(context) {
            _weatherResponse.value = it
        }
//        manager.getWeather(context, _weatherResponse::setValue)
    }
}
