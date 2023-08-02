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

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@class FRWeatherCityResponse, FRWeatherCityCoordResponse, FRWeatherListResponse, FRWeatherListCloudsResponse, FRWeatherListMainResponse, FRWeatherListRainResponse, FRWeatherListSysResponse, FRWeatherListWeatherResponse, FRWeatherListWindResponse;

@interface FRWeatherResponse : NSObject

@property (nonatomic, strong, readonly) FRWeatherCityResponse *city;
@property (nonatomic, assign, readonly) int cnt;
@property (nonatomic, strong, readonly) NSString *cod;
@property (nonatomic, strong, readonly) NSArray<FRWeatherListResponse *> *list;
@property (nonatomic, assign, readonly) int message;

@end

@interface FRWeatherCityResponse : NSObject

@property (nonatomic, strong, readonly) FRWeatherCityCoordResponse *coord;
@property (nonatomic, strong, readonly) NSString *country;
@property (nonatomic, assign, readonly) int wid;
@property (nonatomic, strong, readonly) NSString *name;
@property (nonatomic, assign, readonly) int population;
@property (nonatomic, assign, readonly) int sunrise;
@property (nonatomic, assign, readonly) int sunset;
@property (nonatomic, assign, readonly) int timezone;

@end

@interface FRWeatherCityCoordResponse : NSObject

@property (nonatomic, assign, readonly) double lat;
@property (nonatomic, assign, readonly) double lon;

@end

@interface FRWeatherListResponse : NSObject

@property (nonatomic, strong, readonly) FRWeatherListCloudsResponse *clouds;
@property (nonatomic, assign, readonly) int dt;
@property (nonatomic, strong, readonly) NSString *dt_txt;
@property (nonatomic, strong, readonly) FRWeatherListMainResponse *main;
@property (nonatomic, assign, readonly) double pop;
@property (nonatomic, strong, readonly, nullable) FRWeatherListRainResponse *rain;
@property (nonatomic, strong, readonly) FRWeatherListSysResponse *sys;
@property (nonatomic, assign, readonly) int visibility;
@property (nonatomic, strong, readonly) NSArray<FRWeatherListWeatherResponse *> *weather;
@property (nonatomic, strong, readonly) FRWeatherListWindResponse *wind;

@end

@interface FRWeatherListCloudsResponse : NSObject

@property (nonatomic, assign, readonly) int all;

@end

@interface FRWeatherListMainResponse : NSObject

@property (nonatomic, assign, readonly) double feels_like;
@property (nonatomic, assign, readonly) int grnd_level;
@property (nonatomic, assign, readonly) int humidity;
@property (nonatomic, assign, readonly) int pressure;
@property (nonatomic, assign, readonly) int sea_level;
@property (nonatomic, assign, readonly) double temp;
@property (nonatomic, assign, readonly) double temp_kf;
@property (nonatomic, assign, readonly) double temp_max;
@property (nonatomic, assign, readonly) double temp_min;

@end

@interface FRWeatherListRainResponse : NSObject

@property (nonatomic, assign, readonly) double h;

@end

@interface FRWeatherListSysResponse : NSObject

@property (nonatomic, strong, readonly) NSString *pod;

@end

@interface FRWeatherListWeatherResponse : NSObject

@property (nonatomic, strong, readonly) NSString *w_description;
@property (nonatomic, strong, readonly) NSString *icon;
@property (nonatomic, assign, readonly) int w_id;
@property (nonatomic, strong, readonly) NSString *main;

@end

@interface FRWeatherListWindResponse : NSObject

@property (nonatomic, assign, readonly) int deg;
@property (nonatomic, assign, readonly) double gust;
@property (nonatomic, assign, readonly) double speed;

@end

NS_ASSUME_NONNULL_END
