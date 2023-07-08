//
//  FRUserInteractor.h
//  Reference-iOS-ObjC
//
//  Created by Fay on 2023/7/7.
//  Copyright © 2023 Fay. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "FRUserInterface.h"

NS_ASSUME_NONNULL_BEGIN

@interface FRUserInteractor : NSObject <FRUserInteractorInterface>

@property (nonatomic, strong) id<FRUserPresenterInterface> presenter;

@end

NS_ASSUME_NONNULL_END
