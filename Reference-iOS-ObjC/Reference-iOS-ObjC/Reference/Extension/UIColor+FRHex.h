//
//  UIColor+FRHex.h
//  Reference-iOS-ObjC
//
//  Created by Fay on 2023/7/8.
//  Copyright © 2023 Fay. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIColor (FRHex)

+ (UIColor *)colorWithHex:(NSString *)hex;

@end

NS_ASSUME_NONNULL_END
