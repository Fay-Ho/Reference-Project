//
//  FRHomeViewController.h
//  Reference-iOS-ObjC
//
//  Created by Fay on 2023/7/7.
//  Copyright © 2023 Fay. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "FRHomeInterface.h"

NS_ASSUME_NONNULL_BEGIN

@interface FRHomeViewController : UIViewController <FRHomeViewControllerInterface>

@property (nonatomic, strong) id<FRHomeInteractorInterface> interactor;

@end

NS_ASSUME_NONNULL_END
