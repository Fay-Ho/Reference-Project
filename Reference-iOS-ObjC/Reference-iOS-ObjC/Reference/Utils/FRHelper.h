//
//  FRHelper.h
//  Reference-iOS-ObjC
//
//  Created by Fay on 2023/7/8.
//  Copyright © 2023 Fay. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "FRNavigator.h"

NS_ASSUME_NONNULL_BEGIN

@interface FRHelper : NSObject

@property (nonatomic, strong) FRNavigator *navigator;

+ (instancetype)sharedInstance;

@end

NS_ASSUME_NONNULL_END
