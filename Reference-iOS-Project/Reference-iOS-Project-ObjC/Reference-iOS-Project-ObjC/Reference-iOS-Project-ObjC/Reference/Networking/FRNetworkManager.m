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
#import "FRCityResponse.h"
#import "FRWeatherResponse.h"
#import "NSObject+JSONModel.h"

@implementation FRNetworkManager

typedef NSString *FRMockFile NS_STRING_ENUM;
FRMockFile const GET_CITY = @"city";
FRMockFile const GET_WEATHER = @"weather";
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

//- (void)baseRequest {
////    NSURL *url = [NSURL URLWithString:@"https://restapi.amap.com/v3/weather/weatherInfo?city=440106&key=13b60d45154a4e2670df67a585752ce1&extensions=all"];
//    NSURL *url = [NSURL URLWithString:@"http://api.openweathermap.org/data/2.5/forecast?q=guangzhou&appid=9520804e734d81ed699abf203a13bd68&units=metric&lang=zh_cn"];
//    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:url];
//    request.HTTPMethod = @"GET";
//    NSURLSession *session = [NSURLSession sharedSession];
//    NSURLSessionDataTask *dataTask = [session dataTaskWithRequest:request completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
//        NSLog(@"%@", [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingAllowFragments error:&error]);
//    }];
//    [dataTask resume];
//}

#pragma mark -

- (void)getCity:(void (^)(id _Nullable))completion {
    [self sendRequest:[FRCityResponse class] fileName:GET_CITY completion:completion];
}

- (void)getWeather:(void (^)(id _Nullable))completion {
    [self sendRequest:[FRWeatherResponse class] fileName:GET_WEATHER completion:completion];
}

@end
