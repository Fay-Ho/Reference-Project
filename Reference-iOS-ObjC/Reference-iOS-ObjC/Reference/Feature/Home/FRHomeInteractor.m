//
//  FRHomeInteractor.m
//  Reference-iOS-ObjC
//
//  Created by Fay on 2023/7/7.
//  Copyright © 2023 Fay. All rights reserved.
//

#import "FRHomeInteractor.h"
#import "FRNetworkManager.h"
#import "FRCityResponse.h"
#import "FRWeatherResponse.h"

@implementation FRHomeInteractor

- (void)fetchCityData {
    FRNetworkManager<FRCityResponse *> *manager = [FRNetworkManager manager];
    [manager getCity:^(FRCityResponse * _Nullable response) {
        [self.presenter handleCityResponse:response];
    }];
}

- (void)fetchWeatherData {
    FRNetworkManager<FRWeatherResponse *> *manager = [FRNetworkManager manager];
    [manager getWeather:^(FRWeatherResponse * _Nullable response) {
        [self.presenter handleWeatherResponse:response];
    }];
}

@end
