//
//  FRHomeInterface.h
//  Reference-iOS-ObjC
//
//  Created by Fay on 2023/7/7.
//  Copyright © 2023 Fay. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "FRGetCityResponse.h"
#import "FRGetWeatherResponse.h"

NS_ASSUME_NONNULL_BEGIN

@protocol FRHomeInteractorInterface <NSObject>

- (void)fetchCityData;

- (void)fetchWeatherData;

@end

@protocol FRHomePresenterInterface <NSObject>

- (void)handleCityResponse:(FRGetCityResponse * _Nonnull)response;

- (void)handleWeatherResponse:(FRGetWeatherResponse * _Nonnull)response;

@end

@protocol FRHomeViewControllerInterface <NSObject>

- (void)showCityPageWithResponse:(FRGetCityResponse * _Nonnull)response;

- (void)updateSubviewsWithResponse:(FRGetWeatherResponse * _Nonnull)response;

@end

NS_ASSUME_NONNULL_END
