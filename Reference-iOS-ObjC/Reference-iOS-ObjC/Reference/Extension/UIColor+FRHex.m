//
//  UIColor+FRHex.m
//  Reference-iOS-ObjC
//
//  Created by Fay on 2023/7/8.
//  Copyright © 2023 Fay. All rights reserved.
//

#import "UIColor+FRHex.h"

@implementation UIColor (FRHex)

+ (UIColor *)colorWithHex:(NSString *)hex {
    NSCharacterSet *set = [NSCharacterSet whitespaceAndNewlineCharacterSet];
    NSString *string = [[hex stringByTrimmingCharactersInSet:set] uppercaseString];

    if (string.length < 6 || string.length > 8) {
        return UIColor.clearColor;
    }
    
    string = [string stringByReplacingOccurrencesOfString:@"0X" withString:@""];
    string = [string stringByReplacingOccurrencesOfString:@"#" withString:@""];

    NSString *red = [string substringWithRange:NSMakeRange(0, 2)];
    NSString *green = [string substringWithRange:NSMakeRange(2, 2)];
    NSString *blue = [string substringWithRange:NSMakeRange(4, 2)];

    unsigned int r, g, b;
    [[NSScanner scannerWithString:red] scanHexInt:&r];
    [[NSScanner scannerWithString:green] scanHexInt:&g];
    [[NSScanner scannerWithString:blue] scanHexInt:&b];

    return [UIColor colorWithRed:((float) r / 255.0f) green:((float) g / 255.0f) blue:((float) b / 255.0f) alpha:1.0f];
}

@end
