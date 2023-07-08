//
//  FRFeatureConfigurator.h
//  Reference-iOS-ObjC
//
//  Created by Fay on 2023/7/8.
//  Copyright © 2023 Fay. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@protocol FRFeatureConfigurator <NSObject>

+ (instancetype)configurator;

- (UIViewController *)makeViewControllerWithData:(id _Nullable)data;

@end

NS_ASSUME_NONNULL_END
