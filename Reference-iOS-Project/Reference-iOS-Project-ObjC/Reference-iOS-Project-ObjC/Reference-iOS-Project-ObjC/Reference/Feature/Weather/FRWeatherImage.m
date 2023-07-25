//
//  MIT License
//
//  Copyright (c) 2023 Fay-Ho
//
//  Permission is hereby granted, free of charge, to any person obtaining a copy
//  of this software and associated documentation files (the "Software"), to deal
//  in the Software without restriction, including without limitation the rights
//  to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
//  copies of the Software, and to permit persons to whom the Software is
//  furnished to do so, subject to the following conditions:
//
//  The above copyright notice and this permission notice shall be included in all
//  copies or substantial portions of the Software.
//
//  THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
//  IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
//  FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
//  AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
//  LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
//  OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
//  SOFTWARE.
//

#import "FRWeatherImage.h"

@implementation FRWeatherImage

NSString * const FRWeatherImageEnumCloudy = @"ImgCloudy";
NSString * const FRWeatherImageEnumFoggy = @"ImgFoggy";
NSString * const FRWeatherImageEnumHail = @"ImgHail";
NSString * const FRWeatherImageEnumMoon = @"ImgMoon";
NSString * const FRWeatherImageEnumMoonCloudy = @"ImgMoonCloudy";
NSString * const FRWeatherImageEnumRainy = @"ImgRainy";
NSString * const FRWeatherImageEnumSnowy = @"ImgSnowy";
NSString * const FRWeatherImageEnumSun = @"ImgSun";
NSString * const FRWeatherImageEnumSunCloudy = @"ImgSunCloudy";
NSString * const FRWeatherImageEnumThunderstorms = @"ImgThunderstorms";
NSString * const FRWeatherImageEnumTornado = @"ImgTornado";
NSString * const FRWeatherImageEnumTyphoon = @"ImgTyphoon";

+ (FRWeatherImageEnum)fileNameOf:(NSString *)string {
    if ([string isEqualToString:@"阴天"]) {
        return FRWeatherImageEnumCloudy;
    } else if ([string isEqualToString:@"大雾"]) {
        return FRWeatherImageEnumFoggy;
    } else if ([string isEqualToString:@"冰雹"]) {
        return FRWeatherImageEnumHail;
    } else if ([string isEqualToString:@"夜间"]) {
        return FRWeatherImageEnumMoon;
    } else if ([string isEqualToString:@"夜间多云"]) {
        return FRWeatherImageEnumMoonCloudy;
    } else if ([string isEqualToString:@"雨天"]) {
        return FRWeatherImageEnumRainy;
    } else if ([string isEqualToString:@"雪天"]) {
        return FRWeatherImageEnumSnowy;
    } else if ([string isEqualToString:@"晴朗"]) {
        return FRWeatherImageEnumSun;
    } else if ([string isEqualToString:@"晴朗多云"]) {
        return FRWeatherImageEnumSunCloudy;
    } else if ([string isEqualToString:@"雷暴"]) {
        return FRWeatherImageEnumThunderstorms;
    } else if ([string isEqualToString:@"龙卷风"]) {
        return FRWeatherImageEnumTornado;
    } else if ([string isEqualToString:@"台风"]) {
        return FRWeatherImageEnumTyphoon;
    }
    return @"";
}

@end
