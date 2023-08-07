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

#import "NSArray+FRExtension.h"

@implementation NSArray (FRExtension)

NSArray* zip(NSArray* array1, NSArray* array2) {
    return @[array1, array2];
};

- (void)forEach:(void (^)(id _Nonnull, id _Nonnull))body {
    NSEnumerator *enumerator = [self.lastObject objectEnumerator];
    [self.firstObject enumerateObjectsUsingBlock:^(id _Nonnull firstObject, NSUInteger idx, BOOL * _Nonnull stop) {
        id lastObject = [enumerator nextObject];
        if (firstObject && lastObject) {
            body(firstObject, lastObject);
        }
    }];
}

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

- (NSArray *)filter:(BOOL (^)(id _Nonnull))transform {
    NSMutableArray *array = [NSMutableArray array];
    [self enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        if (transform(obj) == YES) {
            [array addObject:obj];
        }
    }];
    return array;
}

- (id)reduce:(id)initial nextPartial:(id _Nonnull (^)(id _Nonnull, id _Nonnull))nextPartial {
    __block id obj = initial;
    [self enumerateObjectsUsingBlock:^(id _Nonnull _obj, NSUInteger idx, BOOL * _Nonnull stop) {
        obj = nextPartial(obj, _obj);
    }];
    return obj;
}

@end
