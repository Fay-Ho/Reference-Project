//
//  FRWeatherInteractor.h
//  Reference-iOS-ObjC
//
//  Created by Fay on 2023/7/7.
//  Copyright © 2023 Fay. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "FRWeatherInterface.h"

NS_ASSUME_NONNULL_BEGIN

@interface FRWeatherInteractor : NSObject <FRWeatherInteractorInterface>

@property (nonatomic, strong) id<FRWeatherPresenterInterface> presenter;

@end

NS_ASSUME_NONNULL_END
