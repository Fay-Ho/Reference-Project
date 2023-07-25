package xyz.fay.reference.feature.weather

enum class WeatherImage(val rawValue: String) {
    CLOUDY("阴天"),
    FOGGY("大雾"),
    HAIL("冰雹"),
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
        fun of(rawValue: String) = values().firstOrNull { it.rawValue == rawValue }
    }

    val fileName: String get() {
        return when(this) {
            CLOUDY -> "img_cloudy"
            FOGGY -> "img_foggy"
            HAIL -> "img_hail"
            MOON -> "img_moon"
            MOON_CLOUDY -> "img_moon_cloudy"
            RAINY -> "img_rainy"
            SNOWY -> "img_snowy"
            SUN -> "img_sun"
            SUN_CLOUDY -> "img_sun_cloudy"
            THUNDERSTORMS -> "img_thunderstorms"
            TORNADO -> "img_tornado"
            TYPHOON -> "img_typhoon"
        }
    }

//    fun fileName(): String {
//        return when(this) {
//            CLOUDY -> "img_cloudy"
//            FOGGY -> "img_foggy"
//            HAIL -> "img_hail"
//            MOON -> "img_moon"
//            MOON_CLOUDY -> "img_moon_cloudy"
//            RAINY -> "img_rainy"
//            SNOWY -> "img_snowy"
//            SUN -> "img_sun"
//            SUN_CLOUDY -> "img_sun_cloudy"
//            THUNDERSTORMS -> "img_thunderstorms"
//            TORNADO -> "img_tornado"
//            TYPHOON -> "img_typhoon"
//        }
//    }
}
