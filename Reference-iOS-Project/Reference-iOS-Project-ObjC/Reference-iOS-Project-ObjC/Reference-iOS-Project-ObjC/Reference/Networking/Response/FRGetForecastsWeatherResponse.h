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

@class FRGetForecastsWeatherForecastsResponse, FRGetForecastsWeatherForecastsCastsResponse;

@interface FRGetForecastsWeatherResponse : NSObject

@property (nonatomic, strong, readonly) NSString *count;
@property (nonatomic, strong, readonly) NSArray<FRGetForecastsWeatherForecastsResponse *> *forecasts;
@property (nonatomic, strong, readonly) NSString *info;
@property (nonatomic, strong, readonly) NSString *infocode;
@property (nonatomic, strong, readonly) NSString *status;

@end

@interface FRGetForecastsWeatherForecastsResponse : NSObject

@property (nonatomic, strong, readonly) NSString *adcode;
@property (nonatomic, strong, readonly) NSArray<FRGetForecastsWeatherForecastsCastsResponse *> *casts;
@property (nonatomic, strong, readonly) NSString *city;
@property (nonatomic, strong, readonly) NSString *province;
@property (nonatomic, strong, readonly) NSString *reporttime;

@end

@interface FRGetForecastsWeatherForecastsCastsResponse : NSObject

@property (nonatomic, strong, readonly) NSString *date;
@property (nonatomic, strong, readonly) NSString *daypower;
@property (nonatomic, strong, readonly) NSString *daytemp;
@property (nonatomic, strong, readonly) NSString *daytemp_float;
@property (nonatomic, strong, readonly) NSString *dayweather;
@property (nonatomic, strong, readonly) NSString *daywind;
@property (nonatomic, strong, readonly) NSString *nightpower;
@property (nonatomic, strong, readonly) NSString *nighttemp;
@property (nonatomic, strong, readonly) NSString *nighttemp_float;
@property (nonatomic, strong, readonly) NSString *nightweather;
@property (nonatomic, strong, readonly) NSString *nightwind;
@property (nonatomic, strong, readonly) NSString *week;

@end

NS_ASSUME_NONNULL_END
