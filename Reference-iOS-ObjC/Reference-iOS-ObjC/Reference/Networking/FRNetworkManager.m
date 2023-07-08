//
//  FRNetworkManager.m
//  Reference-iOS-ObjC
//
//  Created by Fay on 2023/7/7.
//  Copyright © 2023 Fay. All rights reserved.
//

#import "FRNetworkManager.h"
#import "FRBundleProvider.h"
#import "FRCityResponse.h"
#import "FRWeatherResponse.h"
#import "FRUserResponse.h"
#import "NSObject+JSONModel.h"

@interface FRNetworkManager ()

typedef NSString *FRMockFile NS_STRING_ENUM;
FOUNDATION_EXPORT FRMockFile const GET_CITY;
FOUNDATION_EXPORT FRMockFile const GET_WEATHER;
FOUNDATION_EXPORT FRMockFile const POST_USER;

@end

@implementation FRNetworkManager

NSString * const GET_CITY = @"get_city";
NSString * const GET_WEATHER = @"get_weather";
NSString * const POST_USER = @"post_user";

+ (instancetype)manager {
    return [[self alloc] init];
}

- (void)sendRequest:(Class)response fileName:(FRMockFile)fileName completion:(FRCompletion)completion {
    FRBundleProvider *provider = [FRBundleProvider provider];
    id JSON = [provider loadJsonFile:fileName];
    Class cls = [response modelWithJSON:JSON];
    completion(cls);
}

- (void)getCity:(FRCompletion)completion {
    [self sendRequest:[FRCityResponse class] fileName:GET_CITY completion:completion];
}

- (void)getWeather:(FRCompletion)completion {
    [self sendRequest:[FRWeatherResponse class] fileName:GET_WEATHER completion:completion];
}

- (void)postUser:(FRCompletion)completion {
    [self sendRequest:[FRUserResponse class] fileName:POST_USER completion:completion];
}

@end
