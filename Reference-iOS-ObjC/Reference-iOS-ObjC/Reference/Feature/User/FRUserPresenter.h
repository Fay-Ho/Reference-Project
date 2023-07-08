//
//  FRUserPresenter.h
//  Reference-iOS-ObjC
//
//  Created by Fay on 2023/7/7.
//  Copyright © 2023 Fay. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "FRUserInterface.h"

NS_ASSUME_NONNULL_BEGIN

@interface FRUserPresenter : NSObject <FRUserPresenterInterface>

@property (nonatomic, weak) id<FRUserViewControllerInterface> viewController;

@end

NS_ASSUME_NONNULL_END
