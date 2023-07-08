//
//  FRCityPresenter.h
//  Reference-iOS-ObjC
//
//  Created by Fay on 2023/7/7.
//  Copyright © 2023 Fay. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "FRCityInterface.h"

NS_ASSUME_NONNULL_BEGIN

@interface FRCityPresenter : NSObject <FRCityPresenterInterface>

@property (nonatomic, weak) id<FRCityViewControllerInterface> viewController;

@end

NS_ASSUME_NONNULL_END
