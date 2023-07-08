package xyz.fay.reference.networking.response

import android.os.Parcelable
import kotlinx.parcelize.Parcelize

@Parcelize
data class WeatherResponse(
        val lives: Array<WeatherLiveResponse>,
        val status: String
) : Parcelable

@Parcelize
data class WeatherLiveResponse(
        val city: String,
        val province: String
) : Parcelable
