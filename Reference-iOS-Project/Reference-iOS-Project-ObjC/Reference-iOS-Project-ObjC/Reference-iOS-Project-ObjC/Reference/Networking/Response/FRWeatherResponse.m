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

#import "FRWeatherResponse.h"
#import "YYModel.h"

NS_ASSUME_NONNULL_BEGIN

@interface FRWeatherResponse () <JSONModel>

@property (nonatomic, strong, readwrite) FRWeatherCityResponse *city;
@property (nonatomic, assign, readwrite) int cnt;
@property (nonatomic, strong, readwrite) NSString *cod;
@property (nonatomic, strong, readwrite) NSArray<FRWeatherListResponse *> *list;
@property (nonatomic, assign, readwrite) int message;

@end

@implementation FRWeatherResponse

+ (NSDictionary<NSString *,id> *)unkeyedContainer {
    return @{
        @"city": @"FRWeatherCityResponse",
        @"list": @"FRWeatherListResponse"
    };
}

@end

@interface FRWeatherCityResponse () <JSONModel>

@property (nonatomic, strong, readwrite) FRWeatherCityCoordResponse *coord;
@property (nonatomic, strong, readwrite) NSString *country;
@property (nonatomic, assign, readwrite) int w_id;
@property (nonatomic, strong, readwrite) NSString *name;
@property (nonatomic, assign, readwrite) int population;
@property (nonatomic, assign, readwrite) int sunrise;
@property (nonatomic, assign, readwrite) int sunset;
@property (nonatomic, assign, readwrite) int timezone;

@end

@implementation FRWeatherCityResponse

+ (NSDictionary<NSString *,id> *)unkeyedContainer {
    return @{
        @"coord": @"FRWeatherCityCoordResponse"
    };
}

+ (NSDictionary<NSString *, id> *)codingKeys {
    return @{
        @"id": @"w_id"
    };
}

@end

@interface FRWeatherCityCoordResponse () <JSONModel>

@property (nonatomic, assign, readwrite) double lat;
@property (nonatomic, assign, readwrite) double lon;

@end

@implementation FRWeatherCityCoordResponse

@end

@interface FRWeatherListResponse () <JSONModel>

@property (nonatomic, strong, readwrite) FRWeatherListCloudsResponse *clouds;
@property (nonatomic, assign, readwrite) int dt;
@property (nonatomic, strong, readwrite) NSString *dt_txt;
@property (nonatomic, strong, readwrite) FRWeatherListMainResponse *main;
@property (nonatomic, assign, readwrite) double pop;
@property (nonatomic, strong, readwrite, nullable) FRWeatherListRainResponse *rain;
@property (nonatomic, strong, readwrite) FRWeatherListSysResponse *sys;
@property (nonatomic, assign, readwrite) int visibility;
@property (nonatomic, strong, readwrite) NSArray<FRWeatherListWeatherResponse *> *weather;
@property (nonatomic, strong, readwrite) FRWeatherListWindResponse *wind;

@end

@implementation FRWeatherListResponse

+ (NSDictionary<NSString *,id> *)unkeyedContainer {
    return @{
        @"clouds": @"FRWeatherListCloudsResponse",
        @"main": @"FRWeatherListMainResponse",
        @"rain": @"FRWeatherListRainResponse",
        @"sys": @"FRWeatherListSysResponse",
        @"weather": @"FRWeatherListWeatherResponse",
        @"wind": @"FRWeatherListWindResponse"
    };
}

@end

@interface FRWeatherListCloudsResponse () <JSONModel>

@property (nonatomic, assign, readwrite) int all;

@end

@implementation FRWeatherListCloudsResponse

@end

@interface FRWeatherListMainResponse () <JSONModel>

@property (nonatomic, assign, readwrite) double feels_like;
@property (nonatomic, assign, readwrite) int grnd_level;
@property (nonatomic, assign, readwrite) int humidity;
@property (nonatomic, assign, readwrite) int pressure;
@property (nonatomic, assign, readwrite) int sea_level;
@property (nonatomic, assign, readwrite) double temp;
@property (nonatomic, assign, readwrite) double temp_kf;
@property (nonatomic, assign, readwrite) double temp_max;
@property (nonatomic, assign, readwrite) double temp_min;

@end

@implementation FRWeatherListMainResponse

@end

@interface FRWeatherListRainResponse () <JSONModel>

@property (nonatomic, assign, readwrite) double h;

@end

@implementation FRWeatherListRainResponse

+ (NSDictionary<NSString *, id> *)codingKeys {
    return @{
        @"3h": @"h"
    };
}

@end

@interface FRWeatherListSysResponse () <JSONModel>

@property (nonatomic, strong, readwrite) NSString *pod;

@end

@implementation FRWeatherListSysResponse

@end

@interface FRWeatherListWeatherResponse () <JSONModel>

@property (nonatomic, strong, readwrite) NSString *w_description;
@property (nonatomic, strong, readwrite) NSString *icon;
@property (nonatomic, assign, readwrite) int w_id;
@property (nonatomic, strong, readwrite) NSString *main;

@end

@implementation FRWeatherListWeatherResponse

+ (NSDictionary<NSString *, id> *)codingKeys {
    return @{
        @"id": @"w_id"
    };
}

@end

@interface FRWeatherListWindResponse ()

@property (nonatomic, assign, readwrite) int deg;
@property (nonatomic, assign, readwrite) double gust;
@property (nonatomic, assign, readwrite) double speed;

@end

@implementation FRWeatherListWindResponse

@end

NS_ASSUME_NONNULL_END
