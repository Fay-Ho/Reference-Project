//
//  FRHomePresenter.h
//  Reference-iOS-ObjC
//
//  Created by Fay on 2023/7/7.
//  Copyright © 2023 Fay. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "FRHomeInterface.h"

NS_ASSUME_NONNULL_BEGIN

@interface FRHomePresenter : NSObject <FRHomePresenterInterface>

@property (nonatomic, weak) id<FRHomeViewControllerInterface> viewController;

@end

NS_ASSUME_NONNULL_END
