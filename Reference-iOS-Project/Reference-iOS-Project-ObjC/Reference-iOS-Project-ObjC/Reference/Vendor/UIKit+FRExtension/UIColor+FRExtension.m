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

#import "UIColor+FRExtension.h"

@implementation UIColor (FRExtension)

+ (UIColor *)colorWithHex:(NSString *)hex {
    NSString *string = [hex stringByReplacingOccurrencesOfString:@"#" withString:@""];
    if (string.length == 6) {
        string = [string stringByAppendingString:@"FF"];
    }
    NSScanner *scanner = [NSScanner scannerWithString:string];
    unsigned int number;
    [scanner scanHexInt:&number];
    
    CGFloat red = ((CGFloat)((number & 0xFF000000) >> 24)) / 255.f;
    CGFloat green = ((CGFloat)((number & 0x00FF0000) >> 16)) / 255.f;
    CGFloat blue = ((CGFloat)((number & 0x0000FF00) >> 8)) / 255.f;
    CGFloat alpha = ((CGFloat)((number & 0x000000FF) >> 0)) / 255.f;

    return [UIColor colorWithRed:red green:green blue:blue alpha:alpha];
}

@end
