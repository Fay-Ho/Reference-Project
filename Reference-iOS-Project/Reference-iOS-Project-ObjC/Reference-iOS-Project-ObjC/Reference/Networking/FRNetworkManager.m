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
#import "FRGetCityResponse.h"
#import "FRGetWeatherResponse.h"
#import "NSObject+JSONModel.h"

@implementation FRNetworkManager

typedef NSString *FRMockFile NS_STRING_ENUM;
FRMockFile const GET_CITY = @"get_city";
FRMockFile const GET_WEATHER = @"get_weather";

NSString * const MOCK_BUNDLE = @"Mock.bundle";
NSString * const JSON_FILE = @"json";

+ (instancetype)manager {
    return [[self alloc] init];
}

- (void)sendRequest:(Class)response fileName:(FRMockFile)fileName completion:(FRCompletion)completion {
    FRBundleProvider *provider = [FRBundleProvider provider];
    NSString *filePath = [NSString stringWithFormat:@"%@/%@", MOCK_BUNDLE, fileName];
    id JSON = [provider loadFile:filePath ofType:JSON_FILE];
    completion([response modelWithJSON:JSON]);
}

- (void)getCity:(FRCompletion)completion {
    [self sendRequest:[FRGetCityResponse class] fileName:GET_CITY completion:completion];
}

- (void)getWeather:(FRCompletion)completion {
    [self sendRequest:[FRGetWeatherResponse class] fileName:GET_WEATHER completion:completion];
}

@end
