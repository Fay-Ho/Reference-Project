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
#import "FRWeatherRequest.h"
#import "FLNetworking.h"

@implementation FRNetworkManager

typedef NSString* FRFile NS_STRING_ENUM;
FRFile const CITY = @"city";
FRFile const WEATHER = @"weather";
FRFile const MOCK = @"Mock.bundle/";
FRFile const JSON = @"json";

#pragma mark -

+ (instancetype)manager {
    return [[super alloc] init];
}

#pragma mark -

- (void)loadFile:(FRFile)fileName response:(Class)response completion:(FRCompletion)completion {
    NSData *data = [FRBundleProvider loadFile:[MOCK stringByAppendingString:fileName] ofType:JSON];
    if (!data) { return; }
    [self parseData:data response:response completion:completion];
}

- (void)sendRequest:(id<FRRequestHandler>)requestHandler response:(Class)response completion:(FRCompletion)completion {
    FLNetworking *network = [FLNetworking networking];
    [network sendRequest:[requestHandler makeRequest] success:^(id _Nonnull resultData) {
        [self parseData:resultData response:response completion:completion];
    } failure:^(NSError * _Nonnull error) {
        completion([FLResult failure:error]);
    }];
}

- (void)parseData:(NSData *)data response:(Class)response completion:(FRCompletion)completion {
    completion([FLResult success:[response modelWithJSON:data]]);
}

#pragma mark -

- (void)getCity:(void (^)(FLResult<id<JSONModel>> * _Nullable))completion {
    [self loadFile:CITY response:[FRCityResponse class] completion:completion];
}

- (void)getWeather:(void (^)(FLResult<id<JSONModel>> * _Nullable))completion {
    [self sendRequest:[FRWeatherRequest new] response:[FRWeatherResponse class] completion:completion];
}

@end
