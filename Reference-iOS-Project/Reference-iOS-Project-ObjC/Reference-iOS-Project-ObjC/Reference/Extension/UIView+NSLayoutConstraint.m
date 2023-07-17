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

#import "UIView+NSLayoutConstraint.h"

@implementation UIView (NSLayoutConstraint)

- (void)topEqualToAnchor:(NSLayoutYAxisAnchor *)anchor {
    [self topEqualToAnchor:anchor constant:0];
}

- (void)topEqualToAnchor:(NSLayoutYAxisAnchor *)anchor constant:(CGFloat)constant {
    NSLayoutConstraint *constraint = [self.topAnchor constraintEqualToAnchor:anchor constant:constant];
    constraint.active = YES;
}

- (void)bottomEqualToAnchor:(NSLayoutYAxisAnchor *)anchor {
    [self bottomEqualToAnchor:anchor constant:0];
}

- (void)bottomEqualToAnchor:(NSLayoutYAxisAnchor *)anchor constant:(CGFloat)constant {
    NSLayoutConstraint *constraint = [self.bottomAnchor constraintEqualToAnchor:anchor constant:constant];
    constraint.active = YES;
}

- (void)leadingEqualToAnchor:(NSLayoutXAxisAnchor *)anchor {
    [self leadingEqualToAnchor:anchor constant:0];
}

- (void)leadingEqualToAnchor:(NSLayoutXAxisAnchor *)anchor constant:(CGFloat)constant {
    NSLayoutConstraint *constraint = [self.leadingAnchor constraintEqualToAnchor:anchor constant:constant];
    constraint.active = YES;
}

- (void)trailingEqualToAnchor:(NSLayoutXAxisAnchor *)anchor {
    [self trailingEqualToAnchor:anchor constant:0];
}

- (void)trailingEqualToAnchor:(NSLayoutXAxisAnchor *)anchor constant:(CGFloat)constant {
    NSLayoutConstraint *constraint = [self.trailingAnchor constraintEqualToAnchor:anchor constant:constant];
    constraint.active = YES;
}

- (void)verticalEqualToView:(UIView *)view {
    [self topEqualToAnchor:view.topAnchor constant:0];
    [self bottomEqualToAnchor:view.bottomAnchor constant:0];
}

- (void)verticalEqualToView:(UIView *)view constant:(CGFloat)constant {
    [self topEqualToAnchor:view.topAnchor constant:fabs(constant)];
    [self bottomEqualToAnchor:view.bottomAnchor constant:-fabs(constant)];
}

- (void)horizontalEqualToView:(UIView *)view {
    [self leadingEqualToAnchor:view.leadingAnchor constant:0];
    [self trailingEqualToAnchor:view.trailingAnchor constant:0];
}

- (void)horizontalEqualToView:(UIView *)view constant:(CGFloat)constant {
    [self leadingEqualToAnchor:view.leadingAnchor constant:fabs(constant)];
    [self trailingEqualToAnchor:view.trailingAnchor constant:-fabs(constant)];
}

- (void)centerXEqualToAnchor:(NSLayoutXAxisAnchor *)anchor {
    [self centerXEqualToAnchor:anchor constant:0];
}

- (void)centerXEqualToAnchor:(NSLayoutXAxisAnchor *)anchor constant:(CGFloat)constant {
    NSLayoutConstraint *constraint = [self.centerXAnchor constraintEqualToAnchor:anchor constant:constant];
    constraint.active = YES;
}

- (void)centerYEqualToAnchor:(NSLayoutYAxisAnchor *)anchor {
    [self centerYEqualToAnchor:anchor constant:0];
}

- (void)centerYEqualToAnchor:(NSLayoutYAxisAnchor *)anchor constant:(CGFloat)constant {
    NSLayoutConstraint *constraint = [self.centerYAnchor constraintEqualToAnchor:anchor constant:constant];
    constraint.active = YES;
}

- (void)centerEqualToView:(UIView *)view {
    [self centerXEqualToAnchor:view.centerXAnchor constant:0];
    [self centerYEqualToAnchor:view.centerYAnchor constant:0];
}

- (void)widthEqualToAnchor:(NSLayoutDimension *)anchor {
    [self widthEqualToAnchor:anchor multiplier:1 constant:0];
}

- (void)widthEqualToAnchor:(NSLayoutDimension *)anchor multiplier:(CGFloat)multiplier {
    [self widthEqualToAnchor:anchor multiplier:multiplier constant:0];
}

- (void)widthEqualToAnchor:(NSLayoutDimension *)anchor multiplier:(CGFloat)multiplier constant:(CGFloat)constant {
    NSLayoutConstraint *constraint = [self.widthAnchor constraintEqualToAnchor:anchor multiplier:multiplier constant:constant];
    constraint.active = YES;
}

- (void)widthEqualToConstant:(CGFloat)constant {
    NSLayoutConstraint *constraint = [self.widthAnchor constraintEqualToConstant:constant];
    constraint.active = YES;
}

- (void)heightEqualToAnchor:(NSLayoutDimension *)anchor {
    [self heightEqualToAnchor:anchor multiplier:1 constant:0];
}

- (void)heightEqualToAnchor:(NSLayoutDimension *)anchor multiplier:(CGFloat)multiplier {
    [self heightEqualToAnchor:anchor multiplier:multiplier constant:0];
}

- (void)heightEqualToAnchor:(NSLayoutDimension *)anchor multiplier:(CGFloat)multiplier constant:(CGFloat)constant {
    NSLayoutConstraint *constraint = [self.heightAnchor constraintEqualToAnchor:anchor multiplier:multiplier constant:constant];
    constraint.active = YES;
}

- (void)heightEqualToConstant:(CGFloat)constant {
    NSLayoutConstraint *constraint = [self.heightAnchor constraintEqualToConstant:constant];
    constraint.active = YES;
}

- (void)sizeEqualToConstant:(CGFloat)constant {
    [self widthEqualToConstant:constant];
    [self heightEqualToConstant:constant];
}

- (void)edgeEqualToView:(UIView *)view {
    [self edgeEqualToView:view constant:0];
}

- (void)edgeEqualToView:(UIView *)view constant:(CGFloat)constant {
    [self topEqualToAnchor:view.topAnchor constant:fabs(constant)];
    [self bottomEqualToAnchor:view.bottomAnchor constant:-fabs(constant)];
    [self leadingEqualToAnchor:view.leadingAnchor constant:fabs(constant)];
    [self trailingEqualToAnchor:view.trailingAnchor constant:-fabs(constant)];
}

@end
