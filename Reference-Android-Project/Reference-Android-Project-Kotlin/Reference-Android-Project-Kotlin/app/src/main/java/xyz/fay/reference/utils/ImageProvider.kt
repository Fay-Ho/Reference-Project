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

import xyz.fay.reference.MainApplication
import xyz.fay.reference.R

sealed class ImageProvider(val rawValue: String) {
    object Cloudy: ImageProvider("Clouds")
    object Foggy: ImageProvider("大雾")
    object Hail: ImageProvider("冰雹")
    object Location: ImageProvider("Location")
    object Moon: ImageProvider("夜间")
    object MoonCloudy: ImageProvider("夜间多云")
    object Rainy: ImageProvider("Rain")
    object Snowy: ImageProvider("雪天")
    object Sun: ImageProvider("Clear")
    object SunCloudy: ImageProvider("晴朗多云")
    object Thunderstorms: ImageProvider("雷暴")
    object Tornado: ImageProvider("龙卷风")
    object Typhoon: ImageProvider("台风")

    companion object {
        fun rawValue(value: String) =
            when(value) {
                Cloudy.rawValue -> Cloudy
                Foggy.rawValue -> Foggy
                Hail.rawValue -> Hail
                Location.rawValue -> Location
                Moon.rawValue -> Moon
                MoonCloudy.rawValue -> MoonCloudy
                Rainy.rawValue -> Rainy
                Snowy.rawValue -> Snowy
                Sun.rawValue -> Sun
                SunCloudy.rawValue -> SunCloudy
                Thunderstorms.rawValue -> Thunderstorms
                Tornado.rawValue -> Tornado
                Typhoon.rawValue -> Typhoon
                else -> null
            }
    }

//    val image: Drawable? get() =
//        MainApplication.appContext.getDrawable(
//            when(this) {
//                Cloudy -> R.drawable.img_cloudy
//                Foggy -> R.drawable.img_foggy
//                Hail -> R.drawable.img_hail
//                Location -> R.drawable.img_location
//                Moon -> R.drawable.img_moon
//                MoonCloudy -> R.drawable.img_moon_cloudy
//                Rainy -> R.drawable.img_rainy
//                Snowy -> R.drawable.img_snowy
//                Sun -> R.drawable.img_sun
//                SunCloudy -> R.drawable.img_sun_cloudy
//                Thunderstorms -> R.drawable.img_thunderstorms
//                Tornado -> R.drawable.img_tornado
//                Typhoon -> R.drawable.img_typhoon
//            }
//        )

    fun loadImage() =
        MainApplication.appContext.getDrawable(
            when(this) {
                Cloudy -> R.drawable.img_cloudy
                Foggy -> R.drawable.img_foggy
                Hail -> R.drawable.img_hail
                Location -> R.drawable.img_location
                Moon -> R.drawable.img_moon
                MoonCloudy -> R.drawable.img_moon_cloudy
                Rainy -> R.drawable.img_rainy
                Snowy -> R.drawable.img_snowy
                Sun -> R.drawable.img_sun
                SunCloudy -> R.drawable.img_sun_cloudy
                Thunderstorms -> R.drawable.img_thunderstorms
                Tornado -> R.drawable.img_tornado
                Typhoon -> R.drawable.img_typhoon
            }
        )
}
