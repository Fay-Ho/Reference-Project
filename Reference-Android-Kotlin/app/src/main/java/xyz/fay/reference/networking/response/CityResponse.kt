package xyz.fay.reference.networking.response

import android.os.Parcelable
import kotlinx.parcelize.Parcelize

@Parcelize
data class CityResponse(
        val cities: Array<CityListResponse>
) : Parcelable

@Parcelize
data class CityListResponse(
        val name: String
) : Parcelable
