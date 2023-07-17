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

#import "FRNavigator.h"
#import "FRLocationConfigurator.h"
#import "FRWeatherConfigurator.h"
#import "UIColor+FRTheme.h"

@interface FRNavigator ()

@property (nonatomic, strong) NSDictionary<FRDestination, id<FRFeatureConfigurator>> *configurators;

@end

@implementation FRNavigator

NSString * const FRDestinationLocation = @"FRLocationConfigurator";
NSString * const FRDestinationWeather = @"FRWeatherConfigurator";

- (NSDictionary<FRDestination, id<FRFeatureConfigurator>> *)configurators {
    if (!_configurators) {
        _configurators = @{
            FRDestinationLocation: [FRLocationConfigurator configurator],
            FRDestinationWeather: [FRWeatherConfigurator configurator]
        };
    }
    return _configurators;
}

- (UINavigationController *)makeNavigationWithDestination:(FRDestination)destination {
    id<FRFeatureConfigurator> configurator = self.configurators[destination];
    UIViewController *viewController = [configurator makeViewControllerWithDataModel:nil];
    UINavigationController *navigation = [[UINavigationController alloc] initWithRootViewController:viewController];
    navigation.navigationBar.barTintColor = [UIColor clearColor];
    return navigation;
}

- (void)navigateTo:(FRDestination)destination from:(UINavigationController *)navigation dataModel:(id)model {
    id<FRFeatureConfigurator> configurator = self.configurators[destination];
    UIViewController *viewController = [configurator makeViewControllerWithDataModel:model];
    [navigation pushViewController:viewController animated:YES];
}

@end
