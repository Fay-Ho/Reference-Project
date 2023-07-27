package xyz.fay.reference.networking

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
import android.os.Parcelable
import com.android.volley.Request
import com.android.volley.toolbox.StringRequest
import com.android.volley.toolbox.Volley
import com.google.gson.Gson
import xyz.fay.reference.networking.response.*
import xyz.fay.reference.utils.AssetProvider
import kotlin.reflect.KClass

class NetworkManager {
    private enum class MockFile(val rawValue: String) {
        GET_CITY_LIST("get_city_list.json"),
        GET_FORECASTS_WEATHER("get_forecasts_weather.json"),
        GET_LIVES_WEATHER("get_lives_weather.json"),
        MOCK_ASSET("mock/")
    }

    private fun <R: Parcelable> sendRequest(context: Context, parcelableResponse: KClass<R>, fileName: MockFile, completion: ((response: R?) -> Unit)?) {
        val jsonString = AssetProvider.loadFile(context, MockFile.MOCK_ASSET.rawValue + fileName.rawValue)
        completion?.let {
            it(parseData(jsonString, parcelableResponse))
        }
    }

    private fun baseRequest(context: Context) {
        val queue = Volley.newRequestQueue(context);
        val url = "https://restapi.amap.com/v3/weather/weatherInfo?city=440106&key=13b60d45154a4e2670df67a585752ce1&extensions=all"
//        val stringRequest = StringRequest(Request.Method.GET, url, Response.Listener { response ->
//            println(response)
//        }, Response.ErrorListener { error ->
//            println(error)
//        })
        val stringRequest = StringRequest(Request.Method.GET, url, {
            println(it)
        }, {
            println(it)
        })
        queue.add(stringRequest)
    }

    private fun <R: Parcelable> parseData(data: String, response: KClass<R>): R =
        Gson().fromJson(data, response.java)

    fun getCityList(context: Context, completion: ((response: GetCityListResponse?) -> Unit)?) =
        sendRequest(context, GetCityListResponse::class, MockFile.GET_CITY_LIST, completion)

    fun getForecastsWeather(context: Context, completion: ((response: GetForecastsWeatherResponse?) -> Unit)?) =
        sendRequest(context, GetForecastsWeatherResponse::class, MockFile.GET_FORECASTS_WEATHER, completion)

    fun getLivesWeather(context: Context, completion: ((response: GetLivesWeatherResponse?) -> Unit)?) =
        sendRequest(context, GetLivesWeatherResponse::class, MockFile.GET_LIVES_WEATHER, completion)
}
