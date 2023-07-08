//
//  FRUserViewController.h
//  Reference-iOS-ObjC
//
//  Created by Fay on 2023/7/7.
//  Copyright © 2023 Fay. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "FRUserInterface.h"

NS_ASSUME_NONNULL_BEGIN

@interface FRUserViewController : UIViewController <FRUserViewControllerInterface>

@property (nonatomic, strong) id<FRUserInteractorInterface> interactor;

@end

NS_ASSUME_NONNULL_END
