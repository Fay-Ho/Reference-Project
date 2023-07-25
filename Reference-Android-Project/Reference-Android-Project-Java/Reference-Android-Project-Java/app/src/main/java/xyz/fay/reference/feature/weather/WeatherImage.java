package xyz.fay.reference.feature.weather;

import androidx.annotation.NonNull;
import androidx.annotation.Nullable;

import java.util.Arrays;

import xyz.fay.reference.vendor.Arrays2;

public enum WeatherImage {
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

    @NonNull private final String rawValue;

    WeatherImage(@NonNull String rawValue) {
        this.rawValue = rawValue;
    }

    @Nullable
    static WeatherImage of(String rawValue) {
        WeatherImage weatherImage = Arrays2.firstOrNull(Arrays.asList(values()));
        if (weatherImage != null && weatherImage.rawValue.equals(rawValue)) {
            return weatherImage;
        }
        return null;
    }

    @NonNull
    String getFileName() {
        switch (this) {
            case CLOUDY:
                return "img_cloudy";
            case FOGGY:
                return "img_foggy";
            case HAIL:
                return "img_hail";
            case MOON:
                return "img_moon";
            case MOON_CLOUDY:
                return "img_moon_cloudy";
            case RAINY:
                return "img_rainy";
            case SNOWY:
                return "img_snowy";
            case SUN:
                return "img_sun";
            case SUN_CLOUDY:
                return "img_sun_cloudy";
            case THUNDERSTORMS:
                return "img_thunderstorms";
            case TORNADO:
                return "img_tornado";
            case TYPHOON:
                return "img_typhoon";
            default:
                return "";
        }
    }

    @NonNull
    String getRawValue() {
        return rawValue;
    }
}
