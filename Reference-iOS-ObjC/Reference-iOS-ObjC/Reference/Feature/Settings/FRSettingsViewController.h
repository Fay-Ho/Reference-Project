//
//  FRSettingsViewController.h
//  Reference-iOS-ObjC
//
//  Created by Fay on 2023/7/7.
//  Copyright © 2023 Fay. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "FRSettingsInterface.h"

NS_ASSUME_NONNULL_BEGIN

@interface FRSettingsViewController : UIViewController <FRSettingsViewControllerInterface>

@property (nonatomic, strong) id<FRSettingsInteractorInterface> interactor;

@end

NS_ASSUME_NONNULL_END
