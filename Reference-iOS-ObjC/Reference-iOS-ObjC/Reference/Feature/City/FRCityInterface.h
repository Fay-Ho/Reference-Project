//
//  FRCityInterface.h
//  Reference-iOS-ObjC
//
//  Created by Fay on 2023/7/7.
//  Copyright © 2023 Fay. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "FRCityResponse.h"

NS_ASSUME_NONNULL_BEGIN

@protocol FRCityInteractorInterface <NSObject>

- (void)fetchData;

@end

@protocol FRCityPresenterInterface <NSObject>

- (void)handleResponse:(FRCityResponse * _Nonnull)response;

@end

@protocol FRCityViewControllerInterface <NSObject>

- (void)updateSubviewsWithResponse:(FRCityResponse * _Nonnull)response;

@end

NS_ASSUME_NONNULL_END
