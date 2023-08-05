package xyz.fay.reference.vendor.utils

import android.content.Context
import com.android.volley.toolbox.StringRequest
import com.android.volley.toolbox.Volley

class Networking(private val context: Context) {
    fun sendRequest(httpRequest: HTTPRequest, success: (resultData: String) -> Unit, failure: (throwable: Throwable) -> Unit) {
        val stringRequest = StringRequest(httpRequest.requestMethod.rawValue, httpRequest.requestURL, success, failure)
        Volley.newRequestQueue(context).add(stringRequest)
    }
}
