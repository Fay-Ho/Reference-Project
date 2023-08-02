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

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface FRImageProvider : NSObject

typedef NSString* FRImageEnum NS_STRING_ENUM;
FOUNDATION_EXPORT FRImageEnum const FRImageEnumClouds;
FOUNDATION_EXPORT FRImageEnum const FRImageEnumFoggy;
FOUNDATION_EXPORT FRImageEnum const FRImageEnumHail;
FOUNDATION_EXPORT FRImageEnum const FRImageEnumLocation;
FOUNDATION_EXPORT FRImageEnum const FRImageEnumMoon;
FOUNDATION_EXPORT FRImageEnum const FRImageEnumMoonCloudy;
FOUNDATION_EXPORT FRImageEnum const FRImageEnumRain;
FOUNDATION_EXPORT FRImageEnum const FRImageEnumSnowy;
FOUNDATION_EXPORT FRImageEnum const FRImageEnumSun;
FOUNDATION_EXPORT FRImageEnum const FRImageEnumSunCloudy;
FOUNDATION_EXPORT FRImageEnum const FRImageEnumThunderstorms;
FOUNDATION_EXPORT FRImageEnum const FRImageEnumTornado;
FOUNDATION_EXPORT FRImageEnum const FRImageEnumTyphoon;

+ (nullable UIImage *)loadImageWithRawValue:(NSString *)rawValue;

@end

NS_ASSUME_NONNULL_END
