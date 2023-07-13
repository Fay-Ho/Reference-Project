//
//  UIStackView+FRExtension.h
//  Reference-iOS-ObjC
//
//  Created by Fay on 2023/7/13.
//  Copyright © 2023 Fay. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIStackView (FRExtension)

+ (instancetype)stackViewWithSpacing:(CGFloat)spacing;

+ (instancetype)stackViewWithSpacing:(CGFloat)spacing axis:(UILayoutConstraintAxis)axis;

@end

NS_ASSUME_NONNULL_END
