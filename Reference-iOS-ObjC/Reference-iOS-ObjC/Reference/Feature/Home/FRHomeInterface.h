//
//  FRHomeInterface.h
//  Reference-iOS-ObjC
//
//  Created by Fay on 2023/7/7.
//  Copyright © 2023 Fay. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "FRCityResponse.h"
#import "FRWeatherResponse.h"

NS_ASSUME_NONNULL_BEGIN

@protocol FRHomeInteractorInterface <NSObject>

- (void)fetchCityData;

- (void)fetchWeatherData;

@end

@protocol FRHomePresenterInterface <NSObject>

- (void)handleCityResponse:(FRCityResponse * _Nonnull)response;

- (void)handleWeatherResponse:(FRWeatherResponse * _Nonnull)response;

@end

@protocol FRHomeViewControllerInterface <NSObject>

- (void)showCityPageWithResponse:(FRCityResponse * _Nonnull)response;

- (void)updateSubviewsWithResponse:(FRWeatherResponse * _Nonnull)response;

@end

NS_ASSUME_NONNULL_END
