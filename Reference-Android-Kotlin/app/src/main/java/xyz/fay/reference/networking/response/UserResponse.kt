package xyz.fay.reference.networking.response

import android.os.Parcelable
import kotlinx.parcelize.Parcelize

@Parcelize
data class UserResponse(
        val age: String,
        val name: String,
        val sex: String
) : Parcelable
