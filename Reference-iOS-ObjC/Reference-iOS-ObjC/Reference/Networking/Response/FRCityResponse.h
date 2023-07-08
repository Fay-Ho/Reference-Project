//
//  FRCityResponse.h
//  Reference-iOS-ObjC
//
//  Created by Fay on 2023/7/7.
//  Copyright © 2023 Fay. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface FRCityListResponse : NSObject

@property (nonatomic, strong) NSString *name;

@end

@interface FRCityResponse : NSObject

@property (nonatomic, strong) NSArray<FRCityListResponse *> *cities;

@end

NS_ASSUME_NONNULL_END
