package xyz.fay.reference.feature.city

import android.content.Context
import androidx.lifecycle.MutableLiveData
import androidx.lifecycle.ViewModel
import xyz.fay.reference.networking.NetworkManager
import xyz.fay.reference.networking.response.CityResponse

class CityViewModel : ViewModel() {
    private val _cityResponse = MutableLiveData<CityResponse>()
    val cityResponse: MutableLiveData<CityResponse>
        get() = _cityResponse

    fun fetchData(context: Context) {
        val manager = NetworkManager()
        manager.getCity(context) {
            _cityResponse.value = it
        }
//        manager.getCity(context, _cityResponse::setValue)
    }
}
