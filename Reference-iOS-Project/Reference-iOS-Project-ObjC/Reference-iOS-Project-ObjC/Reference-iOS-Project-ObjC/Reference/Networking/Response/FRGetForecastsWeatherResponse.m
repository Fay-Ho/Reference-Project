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

#import "FRGetForecastsWeatherResponse.h"

NS_ASSUME_NONNULL_BEGIN

@interface FRGetForecastsWeatherResponse ()

@property (nonatomic, strong, readwrite) NSString *count;
@property (nonatomic, strong, readwrite) NSArray<FRGetForecastsWeatherForecastsResponse *> *forecasts;
@property (nonatomic, strong, readwrite) NSString *info;
@property (nonatomic, strong, readwrite) NSString *infocode;
@property (nonatomic, strong, readwrite) NSString *status;

@end

@implementation FRGetForecastsWeatherResponse

- (NSDictionary<NSString *, NSString *> *)unkeyedContainer {
    return @{@"forecasts": @"FRGetForecastsWeatherForecastsResponse"};
}

@end

@interface FRGetForecastsWeatherForecastsResponse ()

@property (nonatomic, strong, readwrite) NSString *adcode;
@property (nonatomic, strong, readwrite) NSArray<FRGetForecastsWeatherForecastsCastsResponse *> *casts;
@property (nonatomic, strong, readwrite) NSString *city;
@property (nonatomic, strong, readwrite) NSString *province;
@property (nonatomic, strong, readwrite) NSString *reporttime;

@end

@implementation FRGetForecastsWeatherForecastsResponse

- (NSDictionary<NSString *, NSString *> *)unkeyedContainer {
    return @{@"casts": @"FRGetForecastsWeatherForecastsCastsResponse"};
}

@end

@interface FRGetForecastsWeatherForecastsCastsResponse ()

@property (nonatomic, strong, readwrite) NSString *date;
@property (nonatomic, strong, readwrite) NSString *daypower;
@property (nonatomic, strong, readwrite) NSString *daytemp;
@property (nonatomic, strong, readwrite) NSString *daytemp_float;
@property (nonatomic, strong, readwrite) NSString *dayweather;
@property (nonatomic, strong, readwrite) NSString *daywind;
@property (nonatomic, strong, readwrite) NSString *nightpower;
@property (nonatomic, strong, readwrite) NSString *nighttemp;
@property (nonatomic, strong, readwrite) NSString *nighttemp_float;
@property (nonatomic, strong, readwrite) NSString *nightweather;
@property (nonatomic, strong, readwrite) NSString *nightwind;
@property (nonatomic, strong, readwrite) NSString *week;

@end

@implementation FRGetForecastsWeatherForecastsCastsResponse

@end

NS_ASSUME_NONNULL_END
