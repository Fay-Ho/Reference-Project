//
//  FRHomeInteractor.m
//  Reference-iOS-ObjC
//
//  Created by Fay on 2023/7/7.
//  Copyright © 2023 Fay. All rights reserved.
//

#import "FRHomeInteractor.h"
#import "FRNetworkManager.h"
#import "FRGetCityResponse.h"
#import "FRGetWeatherResponse.h"

@implementation FRHomeInteractor

- (void)fetchCityData {
    FRNetworkManager<FRGetCityResponse *> *manager = [FRNetworkManager manager];
    [manager getCity:^(FRGetCityResponse * _Nullable response) {
        [self.presenter handleCityResponse:response];
    }];
}

- (void)fetchWeatherData {
    FRNetworkManager<FRGetWeatherResponse *> *manager = [FRNetworkManager manager];
    [manager getWeather:^(FRGetWeatherResponse * _Nullable response) {
        [self.presenter handleWeatherResponse:response];
    }];
}

@end
