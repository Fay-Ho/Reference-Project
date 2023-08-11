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
#import "Foundation+FRExtension.h"

@interface FRImageProvider ()

@property (nonatomic, strong, nullable) FRImageEnum imageEnum;

@end

@implementation FRImageProvider

FRImageEnum const FRImageEnumClouds = @"Clouds";
FRImageEnum const FRImageEnumFoggy = @"大雾";
FRImageEnum const FRImageEnumHail = @"冰雹";
FRImageEnum const FRImageEnumLocation = @"Location";
FRImageEnum const FRImageEnumMoon = @"夜间";
FRImageEnum const FRImageEnumMoonCloudy = @"夜间多云";
FRImageEnum const FRImageEnumRain = @"Rain";
FRImageEnum const FRImageEnumSnowy = @"雪天";
FRImageEnum const FRImageEnumSun = @"Clear";
FRImageEnum const FRImageEnumSunCloudy = @"晴朗多云";
FRImageEnum const FRImageEnumThunderstorms = @"雷暴";
FRImageEnum const FRImageEnumTornado = @"龙卷风";
FRImageEnum const FRImageEnumTyphoon = @"台风";

+ (instancetype)rawValue:(NSString *)rawValue {
    FRImageEnum imageEnum = [rawValue switchOf:@{
        FRImageEnumClouds: ^FRImageEnum{ return FRImageEnumClouds; },
        FRImageEnumFoggy: ^FRImageEnum{ return FRImageEnumFoggy; },
        FRImageEnumHail: ^FRImageEnum{ return FRImageEnumHail; },
        FRImageEnumLocation: ^FRImageEnum{ return FRImageEnumLocation; },
        FRImageEnumMoon: ^FRImageEnum{ return FRImageEnumMoon; },
        FRImageEnumMoonCloudy: ^FRImageEnum{ return FRImageEnumMoonCloudy; },
        FRImageEnumRain: ^FRImageEnum{ return FRImageEnumRain; },
        FRImageEnumSnowy: ^FRImageEnum{ return FRImageEnumSnowy; },
        FRImageEnumSun: ^FRImageEnum{ return FRImageEnumSun; },
        FRImageEnumSunCloudy: ^FRImageEnum{ return FRImageEnumSunCloudy; },
        FRImageEnumThunderstorms: ^FRImageEnum{ return FRImageEnumThunderstorms; },
        FRImageEnumTornado: ^FRImageEnum{ return FRImageEnumTornado; },
        FRImageEnumTyphoon: ^FRImageEnum{ return FRImageEnumTyphoon; }
    }];
    
    FRImageProvider *imageProvider = [[super alloc] init];
    imageProvider.imageEnum = imageEnum;
    return imageProvider;
}

- (UIImage *)loadImage {
    return [self.imageEnum switchOf:@{
        FRImageEnumClouds: ^UIImage *{ return [UIImage imageNamed:@"ImgCloudy"]; },
        FRImageEnumFoggy: ^UIImage *{ return [UIImage imageNamed:@"ImgFoggy"]; },
        FRImageEnumHail: ^UIImage *{ return [UIImage imageNamed:@"ImgHail"]; },
        FRImageEnumLocation: ^UIImage *{ return [UIImage imageNamed:@"ImgLocation"]; },
        FRImageEnumMoon: ^UIImage *{ return [UIImage imageNamed:@"ImgMoon"]; },
        FRImageEnumMoonCloudy: ^UIImage *{ return [UIImage imageNamed:@"ImgMoonCloudy"]; },
        FRImageEnumRain: ^UIImage *{ return [UIImage imageNamed:@"ImgRainy"]; },
        FRImageEnumSnowy: ^UIImage *{ return [UIImage imageNamed:@"ImgSnowy"]; },
        FRImageEnumSun: ^UIImage *{ return [UIImage imageNamed:@"ImgSun"]; },
        FRImageEnumSunCloudy: ^UIImage *{ return [UIImage imageNamed:@"ImgSunCloudy"]; },
        FRImageEnumThunderstorms: ^UIImage *{ return [UIImage imageNamed:@"ImgThunderstorms"]; },
        FRImageEnumTornado: ^UIImage *{ return [UIImage imageNamed:@"ImgTornado"]; },
        FRImageEnumTyphoon: ^UIImage *{ return [UIImage imageNamed:@"ImgTyphoon"]; }
    }];
}

@end
