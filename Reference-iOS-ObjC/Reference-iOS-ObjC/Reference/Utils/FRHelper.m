//
//  FRHelper.m
//  Reference-iOS-ObjC
//
//  Created by Fay on 2023/7/8.
//  Copyright © 2023 Fay. All rights reserved.
//

#import "FRHelper.h"

@implementation FRHelper

+ (instancetype)sharedInstance {
    static FRHelper *sharedInstance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedInstance = [[self alloc] init];
        sharedInstance.navigator = [[FRNavigator alloc] init];
    });
    return sharedInstance;
}

@end
