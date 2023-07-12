package xyz.fay.reference.networking

import android.content.Context
import android.os.Parcelable
import com.google.gson.Gson
import xyz.fay.reference.networking.response.*
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

    fun getCity(context: Context, completion: ((response: GetCityResponse?) -> Unit)?) =
            sendRequest(context, GetCityResponse::class, MockFile.GET_CITY.value, completion)

    fun getWeather(context: Context, completion: ((response: GetWeatherResponse?) -> Unit)?) =
        sendRequest(context, GetWeatherResponse::class, MockFile.GET_WEATHER.value, completion)

    fun postUser(context: Context, completion: ((response: PostUserResponse?) -> Unit)?) =
        sendRequest(context, PostUserResponse::class, MockFile.POST_USER.value, completion)
}
