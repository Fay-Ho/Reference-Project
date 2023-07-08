package xyz.fay.reference.feature.weather

import android.content.Context
import androidx.lifecycle.MutableLiveData
import androidx.lifecycle.ViewModel
import xyz.fay.reference.networking.NetworkManager
import xyz.fay.reference.networking.response.WeatherResponse

class WeatherViewModel : ViewModel() {
    private val _weatherResponse = MutableLiveData<WeatherResponse>()
    val weatherResponse: MutableLiveData<WeatherResponse>
        get() = _weatherResponse

    fun fetchData(context: Context) {
        val manager = NetworkManager()
        manager.getWeather(context) {
            _weatherResponse.value = it
        }
//        manager.getWeather(context, _weatherResponse::setValue)
    }
}
