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

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIView (NSLayoutConstraint)

/*!
 Align the top anchor of current view and target view.
 
 @code
 // example:
 [view1 topEqualToAnchor:view2.topAnchor];
 @endcode
 
 @param anchor The target view top anchor
 */
- (void)topEqualToAnchor:(NSLayoutYAxisAnchor *)anchor;

/*!
 Align the top anchor of current view and target view.
 
 @code
 // example:
 [view1 topEqualToAnchor:view2.topAnchor constant:16];
 @endcode
 
 @param anchor The target view top anchor
 @param constant The distance from the target view
 */
- (void)topEqualToAnchor:(NSLayoutYAxisAnchor *)anchor constant:(CGFloat)constant;

/*!
 Align the bottom anchor of current view and target view.
 
 @code
 // example:
 [view1 bottomEqualToAnchor:view2.bottomAnchor];
 @endcode
 
 @param anchor The target view bottom anchor
 */
- (void)bottomEqualToAnchor:(NSLayoutYAxisAnchor *)anchor;

/*!
 Align the bottom anchor of current view and target view.
 
 @code
 // example:
 [view1 bottomEqualToAnchor:view2.bottomAnchor constant:-16];
 @endcode
 
 @param anchor The target view bottom anchor
 @param constant The distance from the target view
 */
- (void)bottomEqualToAnchor:(NSLayoutYAxisAnchor *)anchor constant:(CGFloat)constant;

/*!
 Align the leading anchor of current view and target view.

 @code
 // example:
 [view1 leadingEqualToAnchor:view2.leadingAnchor];
 @endcode

 @param anchor The target view leading anchor
 */
- (void)leadingEqualToAnchor:(NSLayoutXAxisAnchor *)anchor;

/*!
 Align the leading anchor of current view and target view.

 @code
 // example:
 [view1 leadingEqualToAnchor:view2.leadingAnchor constant:16];
 @endcode

 @param anchor The target view leading anchor
 @param constant The distance from the target view
 */
- (void)leadingEqualToAnchor:(NSLayoutXAxisAnchor *)anchor constant:(CGFloat)constant;

/*!
 Align the trailing anchor of current view and target view.

 @code
 // example:
 [view1 trailingEqualToAnchor:view2.bottomAnchor];
 @endcode

 @param anchor The target view trailing anchor
 */
- (void)trailingEqualToAnchor:(NSLayoutXAxisAnchor *)anchor;

/*!
 Align the trailing anchor of current view and target view.

 @code
 // example:
 [view1 trailingEqualToAnchor:view2.bottomAnchor constant:-16];
 @endcode

 @param anchor The target view trailing anchor
 @param constant The distance from the target view
 */
- (void)trailingEqualToAnchor:(NSLayoutXAxisAnchor *)anchor constant:(CGFloat)constant;

/*!
 Align the top anchor and  bottom anchor of current view and target view.

 @code
 // example:
 [view1 verticalEqualToView:view2];
 @endcode

 @param view The target view
 */
- (void)verticalEqualToView:(UIView *)view;

/*!
 Align the top anchor and  bottom anchor of current view and target view.

 @code
 // example:
 [view1 verticalEqualToView:view2 constant:16];
 @endcode

 @param view The target view
 @param constant The distance from the target view
 */
- (void)verticalEqualToView:(UIView *)view constant:(CGFloat)constant;

/*!
 Align the leading anchor and trailing anchor of current view and target view.

 @code
 // example:
 [view1 horizontalEqualToView:view2];
 @endcode

 @param view The target view
 */
- (void)horizontalEqualToView:(UIView *)view;

/*!
 Align the leading anchor and trailing anchor of current view and target view.

 @code
 // example:
 [view1 horizontalEqualToView:view2 constant:16];
 @endcode

 @param view The target view
 @param constant The distance from the target view
 */
- (void)horizontalEqualToView:(UIView *)view constant:(CGFloat)constant;

/*!
 Align the center x anchor of current view and target view.

 @code
 // example:
 [view1 centerXEqualToAnchor:view2.centerXAnchor];
 @endcode

 @param anchor The target view center x anchor
 */
- (void)centerXEqualToAnchor:(NSLayoutXAxisAnchor *)anchor;

/*!
 Align the center x anchor of current view and target view.

 @code
 // example:
 [view1 centerXEqualToAnchor:view2.centerXAnchor constant:16];
 @endcode

 @param anchor The target view center x anchor
 @param constant The distance from the target view
 */
- (void)centerXEqualToAnchor:(NSLayoutXAxisAnchor *)anchor constant:(CGFloat)constant;

/*!
 Align the center y anchor of current view and target view.

 @code
 // example:
 [view1 centerYEqualToAnchor:view2.centerYAnchor];
 @endcode

 @param anchor The target view center y anchor
 */
- (void)centerYEqualToAnchor:(NSLayoutYAxisAnchor *)anchor;

/*!
 Align the center y anchor of current view and target view.

 @code
 // example:
 [view1 centerYEqualToAnchor:view2.centerYAnchor constant:16];
 @endcode

 @param anchor The target view center y anchor
 @param constant The distance from the target view
 */
- (void)centerYEqualToAnchor:(NSLayoutYAxisAnchor *)anchor constant:(CGFloat)constant;

/*!
 Align the center x anchor and center y anchor of current view and target view.
 
 @code
 // example:
 [view1 centerEqualToView:view2];
 @endcode
 
 @param view The target view
 */
- (void)centerEqualToView:(UIView *)view;

/*!
 Set the width anchor for current view.
 
 The method set an inactive constraint of the form thisAnchor = otherAnchor * multiplier + constant.

 @code
 // example:
 [view1 widthEqualToAnchor:view2.widthAnchor];
 @endcode

 @param anchor The target view width anchor
 */
- (void)widthEqualToAnchor:(NSLayoutDimension *)anchor;

/*!
 Set the width anchor for current view.
 
 The method set an inactive constraint of the form thisAnchor = otherAnchor * multiplier + constant.

 @code
 // example:
 [view1 widthEqualToAnchor:view2.widthAnchor multiplier:2];
 @endcode

 @param anchor The target view width anchor
 @param multiplier The multiplier of distance from the target view
 */
- (void)widthEqualToAnchor:(NSLayoutDimension *)anchor multiplier:(CGFloat)multiplier;

/*!
 Set the width anchor for current view.
 
 The method set an inactive constraint of the form thisAnchor = otherAnchor * multiplier + constant.

 @code
 // example:
 [view1 widthEqualToAnchor:view2.widthAnchor multiplier:2 constant:16];
 @endcode

 @param anchor The target view width anchor
 @param multiplier The multiplier of distance from the target view
 @param constant The distance from the target view
 */
- (void)widthEqualToAnchor:(NSLayoutDimension *)anchor multiplier:(CGFloat)multiplier constant:(CGFloat)constant;

/*!
 Set the width anchor for current view.
 
 @code
 // example:
 [view widthEqualToConstant:16];
 @endcode
 
 @param constant The width of the current view
 */
- (void)widthEqualToConstant:(CGFloat)constant;

/*!
 Set the height anchor for current view.
 
 The method set an inactive constraint of the form thisAnchor = otherAnchor * multiplier + constant.

 @code
 // example:
 [view1 heightEqualToAnchor:view2.widthAnchor];
 @endcode

 @param anchor The target view height anchor
 */
- (void)heightEqualToAnchor:(NSLayoutDimension *)anchor;

/*!
 Set the height anchor for current view.
 
 The method set an inactive constraint of the form thisAnchor = otherAnchor * multiplier + constant.

 @code
 // example:
 [view1 heightEqualToAnchor:view2.widthAnchor multiplier:2];
 @endcode

 @param anchor The target view height anchor
 @param multiplier The multiplier of distance from the target view
 */
- (void)heightEqualToAnchor:(NSLayoutDimension *)anchor multiplier:(CGFloat)multiplier;

/*!
 Set the height anchor for current view.
 
 The method set an inactive constraint of the form thisAnchor = otherAnchor * multiplier + constant.

 @code
 // example:
 [view1 heightEqualToAnchor:view2.widthAnchor multiplier:2 constant:16];
 @endcode

 @param anchor The target view height anchor
 @param multiplier The multiplier of distance from the target view
 @param constant The distance from the target view
 */
- (void)heightEqualToAnchor:(NSLayoutDimension *)anchor multiplier:(CGFloat)multiplier constant:(CGFloat)constant;

/*!
 Set the height anchor for current view.
 
 @code
 // example:
 [view heightEqualToConstant:16];
 @endcode
 
 @param constant The height of the current view
 */
- (void)heightEqualToConstant:(CGFloat)constant;

/*!
 Set the width anchor and height anchor for current view.
 
 @code
 // example:
 [view sizeEqualToConstant:16];
 @endcode
 
 @param constant The size of the current view
 */
- (void)sizeEqualToConstant:(CGFloat)constant;

/*!
 Align the top anchor, bottom anchor, leading anchor and trailing anchor of current view and target view.

 @code
 // example:
 [view1 edgeEqualToView:view2];
 @endcode

 @param view The target view
 */
- (void)edgeEqualToView:(UIView *)view;

/*!
 Align the top anchor, bottom anchor, leading anchor and trailing anchor of current view and target view.

 @code
 // example:
 [view1 edgeEqualToView:view2 constant:16];
 @endcode

 @param view The target view
 @param constant The distance from the target view
 */
- (void)edgeEqualToView:(UIView *)view constant:(CGFloat)constant;

@end

NS_ASSUME_NONNULL_END
