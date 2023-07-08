//
//  FRConfigurator.h
//  Reference-iOS-ObjC
//
//  Created by Fay on 2023/7/8.
//  Copyright © 2023 Fay. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@protocol FRConfigurator <NSObject>

+ (instancetype)configurator;

- (UIViewController *)makeViewController;

@end

NS_ASSUME_NONNULL_END
