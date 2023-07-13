//
//  UIStackView+FRExtension.m
//  Reference-iOS-ObjC
//
//  Created by Fay on 2023/7/13.
//  Copyright © 2023 Fay. All rights reserved.
//

#import "UIStackView+FRExtension.h"

@implementation UIStackView (FRExtension)

+ (instancetype)stackViewWithSpacing:(CGFloat)spacing {
    return [self stackViewWithSpacing:spacing axis:UILayoutConstraintAxisVertical];
}

+ (instancetype)stackViewWithSpacing:(CGFloat)spacing axis:(UILayoutConstraintAxis)axis {
    UIStackView *stackView = [[UIStackView alloc] init];
    stackView.translatesAutoresizingMaskIntoConstraints = NO;
    stackView.distribution = UIStackViewDistributionFill;
    stackView.alignment = UIStackViewAlignmentFill;
    stackView.spacing = spacing;
    stackView.axis = axis;
    return stackView;
}

@end
