//
//  FRNavigator.m
//  Reference-iOS-ObjC
//
//  Created by Fay on 2023/7/7.
//  Copyright © 2023 Fay. All rights reserved.
//

#import "FRNavigator.h"
#import "FRCityConfigurator.h"
#import "FRSettingsConfigurator.h"
#import "FRUserConfigurator.h"
#import "FRWeatherConfigurator.h"

@interface FRNavigator ()

@property (nonatomic, strong) NSDictionary<FRDestination, id<FRConfigurator>> *configurators;

@end

@implementation FRNavigator

NSString * const FRDestinationCity = @"FRCityConfigurator";
NSString * const FRDestinationSettings = @"FRSettingsConfigurator";
NSString * const FRDestinationUser = @"FRUserConfigurator";
NSString * const FRDestinationWeather = @"FRWeatherConfigurator";

- (NSDictionary<FRDestination, id<FRConfigurator>> *)configurators {
    if (!_configurators) {
        _configurators = @{
            FRDestinationCity: [FRCityConfigurator configurator],
            FRDestinationSettings: [FRSettingsConfigurator configurator],
            FRDestinationUser: [FRUserConfigurator configurator],
            FRDestinationWeather: [FRWeatherConfigurator configurator]
        };
    }
    return _configurators;
}

- (void)navigateTo:(FRDestination)destination navigationController:(UINavigationController *)navigationController params:(id)params {
    id<FRConfigurator> configurator = self.configurators[destination];
    UIViewController *viewController = [configurator makeViewController];
    [navigationController pushViewController:viewController animated:YES];
}

@end
