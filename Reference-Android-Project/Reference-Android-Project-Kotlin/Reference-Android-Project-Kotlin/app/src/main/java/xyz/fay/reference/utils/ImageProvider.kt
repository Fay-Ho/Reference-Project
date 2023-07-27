package xyz.fay.reference.utils

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
import android.graphics.drawable.Drawable
import xyz.fay.reference.R

enum class ImageProvider(val rawValue: String) {
    CLOUDY("阴天"),
    FOGGY("大雾"),
    HAIL("冰雹"),
    LOCATION("定位"),
    MOON("夜间"),
    MOON_CLOUDY("夜间多云"),
    RAINY("雨天"),
    SNOWY("雪天"),
    SUN("晴朗"),
    SUN_CLOUDY("晴朗多云"),
    THUNDERSTORMS("雷暴"),
    TORNADO("龙卷风"),
    TYPHOON("台风");

    companion object {
        fun rawValue(rawValue: String) = values().firstOrNull { it.rawValue == rawValue }
    }

    fun loadImage(context: Context): Drawable? {
        return when(this) {
            CLOUDY -> context.getDrawable(R.drawable.img_cloudy)
            FOGGY -> context.getDrawable(R.drawable.img_foggy)
            HAIL -> context.getDrawable(R.drawable.img_hail)
            LOCATION -> context.getDrawable(R.drawable.img_location)
            MOON -> context.getDrawable(R.drawable.img_moon)
            MOON_CLOUDY -> context.getDrawable(R.drawable.img_moon_cloudy)
            RAINY -> context.getDrawable(R.drawable.img_rainy)
            SNOWY -> context.getDrawable(R.drawable.img_snowy)
            SUN -> context.getDrawable(R.drawable.img_sun)
            SUN_CLOUDY -> context.getDrawable(R.drawable.img_sun_cloudy)
            THUNDERSTORMS -> context.getDrawable(R.drawable.img_thunderstorms)
            TORNADO -> context.getDrawable(R.drawable.img_tornado)
            TYPHOON -> context.getDrawable(R.drawable.img_typhoon)
        }
    }
}
