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
#import "FRHomeConfigurator.h"
#import "UIColor+FRTheme.h"

@interface FRNavigator ()

@property (nonatomic, strong) NSDictionary<FRDestination, id<FRFeatureConfigurator>> *configurators;

@end

@implementation FRNavigator

NSString * const FRDestinationCity = @"FRCityConfigurator";
NSString * const FRDestinationHome = @"FRHomeConfigurator";
NSString * const FRDestinationSettings = @"FRSettingsConfigurator";
NSString * const FRDestinationUser = @"FRUserConfigurator";

- (NSDictionary<FRDestination, id<FRFeatureConfigurator>> *)configurators {
    if (!_configurators) {
        _configurators = @{
            FRDestinationCity: [FRCityConfigurator configurator],
            FRDestinationHome: [FRHomeConfigurator configurator],
            FRDestinationSettings: [FRSettingsConfigurator configurator],
            FRDestinationUser: [FRUserConfigurator configurator]
        };
    }
    return _configurators;
}

- (UINavigationController *)makeNavigationControllerWithDestination:(FRDestination)destination {
    id<FRFeatureConfigurator> configurator = self.configurators[destination];
    UINavigationController *navigationController = [[UINavigationController alloc] initWithRootViewController:[configurator makeViewControllerWithData:nil]];
    navigationController.navigationBar.barTintColor = UIColor.themeColor;
    return navigationController;
}

- (void)navigateTo:(FRDestination)destination navigationController:(UINavigationController *)navigationController data:(id)data {
    id<FRFeatureConfigurator> configurator = self.configurators[destination];
    UIViewController *viewController = [configurator makeViewControllerWithData:data];
    
    if ([navigationController.viewControllers containsObject:viewController]) {
        [navigationController popToViewController:viewController animated:YES];
    } else {
        [navigationController pushViewController:viewController animated:YES];
    }
}

@end
