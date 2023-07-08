//
//  FRSettingsPresenter.h
//  Reference-iOS-ObjC
//
//  Created by Fay on 2023/7/7.
//  Copyright © 2023 Fay. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "FRSettingsInterface.h"

NS_ASSUME_NONNULL_BEGIN

@interface FRSettingsPresenter : NSObject <FRSettingsPresenterInterface>

@property (nonatomic, weak) id<FRSettingsViewControllerInterface> viewController;

@end

NS_ASSUME_NONNULL_END
