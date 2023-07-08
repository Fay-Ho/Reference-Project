//
//  FRCityResponse.m
//  Reference-iOS-ObjC
//
//  Created by Fay on 2023/7/7.
//  Copyright © 2023 Fay. All rights reserved.
//

#import "FRCityResponse.h"
#import "NSObject+JSONModel.h"

@implementation FRCityListResponse

@end

@implementation FRCityResponse

- (NSDictionary<NSString *,NSString *> *)unkeyedContainer {
    return @{@"cities": @"FRCityListResponse"};
}

@end
