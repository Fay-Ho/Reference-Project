//
//  FRWeatherResponse.h
//  Reference-iOS-ObjC
//
//  Created by Fay on 2023/7/7.
//  Copyright © 2023 Fay. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface FRWeatherLiveResponse : NSObject

@property (nonatomic, strong) NSString *city;
@property (nonatomic, strong) NSString *province;

@end

@interface FRWeatherResponse : NSObject

@property (nonatomic, strong) NSArray<FRWeatherLiveResponse *> *lives;
@property (nonatomic, strong) NSString *status;

@end

NS_ASSUME_NONNULL_END
