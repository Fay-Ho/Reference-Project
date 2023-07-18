//
//  NSArray+FRExtension.h
//  Reference-iOS-Project-ObjC
//
//  Created by Fay on 2023/7/19.
//  Copyright © 2023 Fay. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSArray<T> (FRExtension)

/*!
 */
- (NSArray *)map:(id (^)(T element))transform;

/*!
 */
- (NSArray *)flatMap:(T (^)(T element))transform;

/*!
 */
- (NSArray *)compactMap:(BOOL (^)(T element))transform;

@end

NS_ASSUME_NONNULL_END
