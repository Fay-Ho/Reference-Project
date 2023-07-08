//
//  FRWeatherViewController.h
//  Reference-iOS-ObjC
//
//  Created by Fay on 2023/7/7.
//  Copyright © 2023 Fay. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "FRWeatherInterface.h"

NS_ASSUME_NONNULL_BEGIN

@interface FRWeatherViewController : UIViewController <FRWeatherViewControllerInterface>

@property (nonatomic, strong) id<FRWeatherInteractorInterface> interactor;

@end

NS_ASSUME_NONNULL_END
