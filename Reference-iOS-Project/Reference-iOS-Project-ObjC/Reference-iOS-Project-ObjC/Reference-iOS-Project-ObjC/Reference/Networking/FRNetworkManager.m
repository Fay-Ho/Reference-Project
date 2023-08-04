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
#import "YYModel.h"
#import "FRWeatherRequest.h"
#import "FLNetwork.h"

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

- (void)send:(void (^)(FLResult<NSString *> *result))completion {
    completion([FLResult success:@"aa"]);
}

- (void)run {
    [self send:^(FLResult<NSString *> *result) {
        [result success:^(NSString * _Nonnull data) {
            NSLog(@"%@", data);
        }];
    }];
}

- (void)sendRequest:(Class)response fileName:(FRMockFile)fileName completion:(FRLoadCompletion)completion {
    FRBundleProvider *provider = [FRBundleProvider provider];
    NSString *filePath = [MOCK_BUNDLE stringByAppendingString:fileName];
    id JSON = [provider loadFile:filePath ofType:JSON_FILE];
    completion([response modelWithJSON:JSON]);
}

- (void)sendRequest:(id<FRRequestHandler>)requestHandler response:(Class)response completion:(FRRequestCompletion)completion {
    FLNetwork *network = [FLNetwork network];
    [network sendRequest:[requestHandler makeRequest] success:^(id _Nonnull resultData) {
        completion([FLResult success:[response modelWithJSON:resultData]]);
    } failure:^(NSError * _Nonnull error) {
        completion([FLResult failure:error]);
    }];
}

#pragma mark -

- (void)getCity:(void (^)(id _Nullable))completion {
    [self sendRequest:[FRCityResponse class] fileName:GET_CITY completion:completion];
}

- (void)getWeather:(void (^)(FLResult<id> * _Nullable))completion {
    [self sendRequest:[FRWeatherRequest new] response:[FRWeatherResponse class] completion:completion];
}

@end
