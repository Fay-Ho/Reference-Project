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

import android.os.Parcelable
import com.android.volley.toolbox.StringRequest
import com.android.volley.toolbox.Volley
import com.google.gson.Gson
import xyz.fay.reference.MainApplication
import xyz.fay.reference.networking.request.RequestHandler
import xyz.fay.reference.networking.request.WeatherRequest
import xyz.fay.reference.networking.response.*
import xyz.fay.reference.utils.AssetProvider
import kotlin.reflect.KClass

class NetworkManager {
    private enum class MockFile(val rawValue: String) {
        GET_CITY("city.json"),
        GET_WEATHER("weather.json"),
        MOCK_ASSET("mock/")
    }

    //region

    private fun <R: Parcelable> loadFile(classOfR: KClass<R>, fileName: MockFile, completion: ((response: R?) -> Unit)?) {
        val jsonString = AssetProvider.loadFile(MockFile.MOCK_ASSET.rawValue + fileName.rawValue)
        completion?.invoke(Gson().fromJson(jsonString, classOfR.java))
    }

    private fun <R: Parcelable> sendRequest(requestHandler: RequestHandler, classOfR: KClass<R>, completion: ((result: Result<R>) -> Unit)?) {
        val queue = Volley.newRequestQueue(MainApplication.appContext);
        val httpRequest = requestHandler.makeRequest()
        val stringRequest = StringRequest(httpRequest.method, httpRequest.url, {
            completion?.invoke(Result.success(Gson().fromJson(it, classOfR.java)))
        }, {
            completion?.invoke(Result.failure(it))
        })
        queue.add(stringRequest)
    }

    //endregion

    //region

    fun getCity(completion: ((response: CityResponse?) -> Unit)?) =
        loadFile(CityResponse::class, MockFile.GET_CITY, completion)

    fun getWeather(completion: ((result: Result<WeatherResponse>) -> Unit)?) =
        sendRequest(WeatherRequest(), WeatherResponse::class, completion)

    //endregion
}
