package xyz.fay.reference.feature.weather

import android.os.Parcelable
import kotlinx.parcelize.Parcelize

@Parcelize
data class WeatherListItemDataModel(
    val time: String,
    val weather: String
) : Parcelable
