//
//  FRWeatherPresenter.h
//  Reference-iOS-ObjC
//
//  Created by Fay on 2023/7/7.
//  Copyright © 2023 Fay. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "FRWeatherInterface.h"

NS_ASSUME_NONNULL_BEGIN

@interface FRWeatherPresenter : NSObject <FRWeatherPresenterInterface>

@property (nonatomic, weak) id<FRWeatherViewControllerInterface> viewController;

@end

NS_ASSUME_NONNULL_END
