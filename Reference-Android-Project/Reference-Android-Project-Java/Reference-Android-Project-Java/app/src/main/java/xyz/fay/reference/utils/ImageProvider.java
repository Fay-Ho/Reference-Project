package xyz.fay.reference.utils;

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

import android.graphics.drawable.Drawable;

import androidx.annotation.NonNull;
import androidx.annotation.Nullable;

import java.util.Arrays;

import xyz.fay.reference.MainApplication;
import xyz.fay.reference.R;

public enum ImageProvider {
    CLOUDY("Clouds"),
    FOGGY("大雾"),
    HAIL("冰雹"),
    LOCATION("定位"),
    MOON("夜间"),
    MOON_CLOUDY("夜间多云"),
    RAINY("Rain"),
    SNOWY("雪天"),
    SUN("Clear"),
    SUN_CLOUDY("晴朗多云"),
    THUNDERSTORMS("雷暴"),
    TORNADO("龙卷风"),
    TYPHOON("台风");

    private final String rawValue;

    ImageProvider(String rawValue) {
        this.rawValue = rawValue;
    }

    @Nullable
    public static ImageProvider rawValue(@NonNull String rawValue) {
        return Arrays.stream(values())
                .filter(imageProvider -> imageProvider.rawValue.equals(rawValue))
                .findFirst()
                .orElse(null);
    }

    @Nullable
    public Drawable loadImage() {
        return MainApplication.getAppContext().getDrawable(drawable());
    }

    @NonNull
    public String getRawValue() {
        return rawValue;
    }

    @NonNull
    private Integer drawable() {
        switch (this) {
            case CLOUDY: return R.drawable.img_cloudy;
            case FOGGY: return R.drawable.img_foggy;
            case HAIL: return R.drawable.img_hail;
            case LOCATION: return R.drawable.img_location;
            case MOON: return R.drawable.img_moon;
            case MOON_CLOUDY: return R.drawable.img_moon_cloudy;
            case RAINY: return R.drawable.img_rainy;
            case SNOWY: return R.drawable.img_snowy;
            case SUN: return R.drawable.img_sun;
            case SUN_CLOUDY: return R.drawable.img_sun_cloudy;
            case THUNDERSTORMS: return R.drawable.img_thunderstorms;
            case TORNADO: return R.drawable.img_tornado;
            case TYPHOON: return R.drawable.img_typhoon;
            default: return null;
        }
    }
}
