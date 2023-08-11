//
//  NSObject+FRExtension.m
//  Reference-iOS-Project-ObjC
//
//  Created by Fay on 2023/8/10.
//  Copyright © 2023 Fay. All rights reserved.
//

#import "NSObject+FRExtension.h"

@implementation NSObject (FRExtension)

- (id)switchOf:(NSDictionary<id<NSCopying>, FRDefinedCase> *)cases {
    return [self switchOf:cases defaultReturn:nil];
}

- (id)switchOf:(NSDictionary<id<NSCopying>, FRDefinedCase> *)cases defaultOf:(FRDefaultCase)defaultCase {
    return [self switchOf:cases defaultReturn:^id _Nullable{
        if (defaultCase) {
            defaultCase();
        }
        return nil;
    }];
}

- (id)switchOf:(NSDictionary<id<NSCopying>, FRDefinedCase> *)cases defaultReturn:(FRDefaultReturnCase)defaultReturnCase {
    NSAssert([self conformsToProtocol:@protocol(NSCopying)], @"Must confirm to <NSCopying>");
    
    FRDefinedCase definedCase = nil;
    
    if ([self isKindOfClass:[NSNumber class]]) {
        NSNumber *number = [self findEquivalentNumber:(NSNumber *)self inDictionary:cases];
        if (number) {
            definedCase = cases[number];
        }
    } else {
        definedCase = cases[(id<NSCopying>)self];
    }
    
    if (definedCase) {
        return definedCase();
    } else if (defaultReturnCase) {
        return defaultReturnCase();
    }
    
    return nil;
}

- (NSNumber *)findEquivalentNumber:(NSNumber *)number inDictionary:(NSDictionary *)dictionary {
    for (NSNumber *newNumber in dictionary.allKeys) {
        if ([newNumber isKindOfClass:[NSNumber class]]) {
            if (fabs([newNumber doubleValue] - [number doubleValue]) < 1e-8) {
                return newNumber;
            }
        }
    }
    return nil;
}

@end
