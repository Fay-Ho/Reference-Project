package xyz.fay.reference.networking

import android.content.Context
import android.os.Parcelable
import com.google.gson.Gson
import xyz.fay.reference.networking.response.CityResponse
import xyz.fay.reference.networking.response.UserResponse
import xyz.fay.reference.networking.response.WeatherResponse
import xyz.fay.reference.utils.AssetProvider
import kotlin.reflect.KClass

class NetworkManager {
    private enum class MockFile(val value: String) {
        GET_CITY("get_city.json"),
        GET_WEATHER("get_weather.json"),
        POST_USER("post_user.json")
    }

    private fun <R: Parcelable> sendRequest(context: Context, parcelableResponse: KClass<R>, fileName: String, completion: ((response: R?) -> Unit)?) {
        val jsonString = AssetProvider.loadJsonFile(context, fileName)
        completion?.let {
            it(parseData(jsonString, parcelableResponse))
        }
    }

    private fun <R: Parcelable> parseData(data: String, response: KClass<R>): R =
        Gson().fromJson(data, response.java)

    fun getCity(context: Context, completion: ((response: CityResponse?) -> Unit)?) =
            sendRequest(context, CityResponse::class, MockFile.GET_CITY.value, completion)

    fun getWeather(context: Context, completion: ((response: WeatherResponse?) -> Unit)?) =
        sendRequest(context, WeatherResponse::class, MockFile.GET_WEATHER.value, completion)

    fun postUser(context: Context, completion: ((response: UserResponse?) -> Unit)?) =
        sendRequest(context, UserResponse::class, MockFile.POST_USER.value, completion)
}
