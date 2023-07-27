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

#import "FRNetworkManager.h"
#import "FRBundleProvider.h"
#import "FRGetCityListResponse.h"
#import "FRGetForecastsWeatherResponse.h"
#import "FRGetLivesWeatherResponse.h"
#import "NSObject+JSONModel.h"

@implementation FRNetworkManager

typedef NSString *FRMockFile NS_STRING_ENUM;
FRMockFile const GET_CITY = @"get_city_list";
FRMockFile const GET_FORECASTS = @"get_forecasts_weather";
FRMockFile const GET_LIVES = @"get_lives_weather";
FRMockFile const MOCK_BUNDLE = @"Mock.bundle/";
FRMockFile const JSON_FILE = @"json";

#pragma mark -

+ (instancetype)manager {
    return [[super alloc] init];
}

#pragma mark -

- (void)sendRequest:(Class)response fileName:(FRMockFile)fileName completion:(FRCompletion)completion {
    FRBundleProvider *provider = [FRBundleProvider provider];
    NSString *filePath = [MOCK_BUNDLE stringByAppendingString:fileName];
    id JSON = [provider loadFile:filePath ofType:JSON_FILE];
    completion([response modelWithJSON:JSON]);
}

- (void)baseRequest {
    NSURL *url = [NSURL URLWithString:@"https://restapi.amap.com/v3/weather/weatherInfo?city=440106&key=13b60d45154a4e2670df67a585752ce1&extensions=all"];
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:url];
    request.HTTPMethod = @"GET";
    NSURLSession *session = [NSURLSession sharedSession];
    NSURLSessionDataTask *dataTask = [session dataTaskWithRequest:request completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        NSLog(@"%@", [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingAllowFragments error:&error]);
    }];
    [dataTask resume];
}

#pragma mark -

- (void)getCityList:(void (^)(id _Nullable))completion {
    [self sendRequest:[FRGetCityListResponse class] fileName:GET_CITY completion:completion];
}

- (void)getForecastsWeather:(void (^)(id _Nullable))completion {
    [self sendRequest:[FRGetForecastsWeatherResponse class] fileName:GET_FORECASTS completion:completion];
}

- (void)getLivesWeather:(void (^)(id _Nullable))completion {
    [self sendRequest:[FRGetLivesWeatherResponse class] fileName:GET_LIVES completion:completion];
}

@end
