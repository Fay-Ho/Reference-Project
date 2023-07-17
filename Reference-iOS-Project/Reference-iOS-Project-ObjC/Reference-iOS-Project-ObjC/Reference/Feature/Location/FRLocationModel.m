//
//  FRLocationModel.m
//  Reference-iOS-Project-ObjC
//
//  Created by Fay on 2023/7/16.
//  Copyright © 2023 Fay. All rights reserved.
//

#import "FRLocationModel.h"
#import "NSObject+JSONModel.h"

@implementation FRLocationTableViewModel

- (NSDictionary<NSString *, NSString *> *)codingKeys {
    return @{@"cities": @"rows"};
}

- (NSDictionary<NSString *,NSString *> *)unkeyedContainer {
    return @{@"rows": @"FRLocationTableViewRowModel"};
}

@end

@implementation FRLocationTableViewRowModel

@end
