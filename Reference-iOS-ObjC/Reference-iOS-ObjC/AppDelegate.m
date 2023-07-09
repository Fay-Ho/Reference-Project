//
//  AppDelegate.m
//  Reference-iOS-ObjC
//
//  Created by Fay on 2023/7/7.
//  Copyright © 2023 Fay. All rights reserved.
//

#import "AppDelegate.h"
#import "FRHelper.h"

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    self.window = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
    self.window.rootViewController = [FRHelper.sharedInstance.navigator makeNavigationControllerWithDestination:FRDestinationHome];
    [self.window makeKeyAndVisible];
    return YES;
}

@end
