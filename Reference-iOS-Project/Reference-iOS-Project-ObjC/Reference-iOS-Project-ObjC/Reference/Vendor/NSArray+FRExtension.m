//
//  NSArray+FRExtension.m
//  Reference-iOS-Project-ObjC
//
//  Created by Fay on 2023/7/19.
//  Copyright © 2023 Fay. All rights reserved.
//

#import "NSArray+FRExtension.h"

@implementation NSArray (FRExtension)

- (NSArray *)map:(id _Nonnull (^)(id _Nonnull))transform {
    NSMutableArray *array = [NSMutableArray array];
    [self enumerateObjectsUsingBlock:^(id _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        [array addObject:transform(obj)];
    }];
    return array;
}

- (NSArray *)flatMap:(id _Nonnull (^)(id _Nonnull))transform {
    NSMutableArray *array = [NSMutableArray array];
    [self enumerateObjectsUsingBlock:^(id _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        [array addObjectsFromArray:transform(obj)];
    }];
    return array;
}

- (NSArray *)compactMap:(BOOL (^)(id _Nonnull))transform {
    NSMutableArray *array = [NSMutableArray array];
    [self enumerateObjectsUsingBlock:^(id _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        if (transform(obj)) {
            [array addObject:obj];
        }
    }];
    return array;
}

@end
