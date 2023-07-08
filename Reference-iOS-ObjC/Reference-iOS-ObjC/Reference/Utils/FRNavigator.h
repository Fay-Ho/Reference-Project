//
//  FRNavigator.h
//  Reference-iOS-ObjC
//
//  Created by Fay on 2023/7/7.
//  Copyright © 2023 Fay. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

typedef NSString *FRDestination NS_STRING_ENUM;
FOUNDATION_EXPORT FRDestination const FRDestinationCity;
FOUNDATION_EXPORT FRDestination const FRDestinationHome;
FOUNDATION_EXPORT FRDestination const FRDestinationSettings;
FOUNDATION_EXPORT FRDestination const FRDestinationUser;

@interface FRNavigator : NSObject

- (UINavigationController *)makeNavigationControllerWithDestination:(FRDestination)destination;

- (void)navigateTo:(FRDestination _Nonnull)destination navigationController:(UINavigationController * _Nonnull)navigationController data:(id _Nullable)data;

@end

NS_ASSUME_NONNULL_END
