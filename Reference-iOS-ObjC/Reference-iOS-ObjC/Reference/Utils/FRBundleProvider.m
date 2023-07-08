//
//  FRBundleProvider.m
//  Reference-iOS-ObjC
//
//  Created by Fay on 2023/7/7.
//  Copyright © 2023 Fay. All rights reserved.
//

#import "FRBundleProvider.h"

@implementation FRBundleProvider

NSString * const mock = @"Mock.bundle";

+ (instancetype)provider {
    return [[self alloc] init];
}

- (id)loadJsonFile:(NSString *)fileName {
    NSString *filePath = [NSString stringWithFormat:@"%@/%@", mock, fileName];
    NSString *path = [[NSBundle mainBundle] pathForResource:filePath ofType:@"json"];
    NSData *data = [[NSData alloc] initWithContentsOfFile:path];
    return [NSJSONSerialization JSONObjectWithData:data options:0 error:nil];
}

@end
