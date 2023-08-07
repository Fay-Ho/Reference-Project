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
import com.google.gson.Gson
import com.google.gson.JsonSyntaxException
import xyz.fay.reference.MainApplication
import xyz.fay.reference.networking.request.RequestHandler
import xyz.fay.reference.networking.request.WeatherRequest
import xyz.fay.reference.networking.response.*
import xyz.fay.reference.utils.AssetProvider
import xyz.fay.reference.vendor.utils.Networking
import kotlin.reflect.KClass

class NetworkManager {
    private sealed class File(val rawValue: String) {
        object City: File("city.json")
        object Weather: File("weather.json")
        object Mock: File("mock/")
    }

    //region

    private fun <R: Parcelable> loadFile(fileName: File, classOfR: KClass<R>, completion: ((result: Result<R>) -> Unit)?) {
        val data = AssetProvider.loadFile(File.Mock.rawValue + fileName.rawValue)
        data?.let { parseData(it, classOfR, completion) }
    }

    private fun <R: Parcelable> sendRequest(requestHandler: RequestHandler, classOfR: KClass<R>, completion: ((result: Result<R>) -> Unit)?) {
        val networking = Networking(MainApplication.appContext)
        networking.sendRequest(requestHandler.makeRequest(), {
            parseData(it, classOfR, completion)
        }, {
            completion?.invoke(Result.failure(it))
        })
    }

    private fun <R: Parcelable> parseData(data: String, classOfR: KClass<R>, completion: ((result: Result<R>) -> Unit)?) {
        try {
            completion?.invoke(Result.success(Gson().fromJson(data, classOfR.java)))
        } catch (exception: JsonSyntaxException) {
            completion?.invoke(Result.failure(exception))
        }
    }

    //endregion

    //region

    fun getCity(completion: ((response: Result<CityResponse>) -> Unit)?) =
        loadFile(File.City, CityResponse::class, completion)

    fun getWeather(completion: ((result: Result<WeatherResponse>) -> Unit)?) =
        sendRequest(WeatherRequest(), WeatherResponse::class, completion)

    //endregion
}
