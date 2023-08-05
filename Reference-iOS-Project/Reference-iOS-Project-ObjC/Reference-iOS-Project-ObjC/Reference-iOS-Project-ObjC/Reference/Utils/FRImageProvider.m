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

#import "FRImageProvider.h"

@implementation FRImageProvider

NSString * const FRImageEnumClouds = @"Clouds";
NSString * const FRImageEnumFoggy = @"大雾";
NSString * const FRImageEnumHail = @"冰雹";
NSString * const FRImageEnumLocation = @"Location";
NSString * const FRImageEnumMoon = @"夜间";
NSString * const FRImageEnumMoonCloudy = @"夜间多云";
NSString * const FRImageEnumRain = @"Rain";
NSString * const FRImageEnumSnowy = @"雪天";
NSString * const FRImageEnumSun = @"Clear";
NSString * const FRImageEnumSunCloudy = @"晴朗多云";
NSString * const FRImageEnumThunderstorms = @"雷暴";
NSString * const FRImageEnumTornado = @"龙卷风";
NSString * const FRImageEnumTyphoon = @"台风";

+ (UIImage *)loadImageWithRawValue:(NSString *)rawValue {
    if ([rawValue isEqualToString:FRImageEnumClouds]) {
        return [UIImage imageNamed:@"ImgCloudy"];
    } else if ([rawValue isEqualToString:FRImageEnumFoggy]) {
        return [UIImage imageNamed:@"ImgFoggy"];
    } else if ([rawValue isEqualToString:FRImageEnumHail]) {
        return [UIImage imageNamed:@"ImgHail"];
    } else if ([rawValue isEqualToString:FRImageEnumLocation]) {
        return [UIImage imageNamed:@"ImgLocation"];
    } else if ([rawValue isEqualToString:FRImageEnumMoon]) {
        return [UIImage imageNamed:@"ImgMoon"];
    } else if ([rawValue isEqualToString:FRImageEnumMoonCloudy]) {
        return [UIImage imageNamed:@"ImgMoonCloudy"];
    } else if ([rawValue isEqualToString:FRImageEnumRain]) {
        return [UIImage imageNamed:@"ImgRainy"];
    } else if ([rawValue isEqualToString:FRImageEnumSnowy]) {
        return [UIImage imageNamed:@"ImgSnowy"];
    } else if ([rawValue isEqualToString:FRImageEnumSun]) {
        return [UIImage imageNamed:@"ImgSun"];
    } else if ([rawValue isEqualToString:FRImageEnumSunCloudy]) {
        return [UIImage imageNamed:@"ImgSunCloudy"];
    } else if ([rawValue isEqualToString:FRImageEnumThunderstorms]) {
        return [UIImage imageNamed:@"ImgThunderstorms"];
    } else if ([rawValue isEqualToString:FRImageEnumTornado]) {
        return [UIImage imageNamed:@"ImgTornado"];
    } else if ([rawValue isEqualToString:FRImageEnumTyphoon]) {
        return [UIImage imageNamed:@"ImgTyphoon"];
    }
    return nil;
}

@end
