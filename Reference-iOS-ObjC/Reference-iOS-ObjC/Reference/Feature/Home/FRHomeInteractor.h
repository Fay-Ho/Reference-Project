//
//  FRHomeInteractor.h
//  Reference-iOS-ObjC
//
//  Created by Fay on 2023/7/7.
//  Copyright © 2023 Fay. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "FRHomeInterface.h"

NS_ASSUME_NONNULL_BEGIN

@interface FRHomeInteractor : NSObject <FRHomeInteractorInterface>

@property (nonatomic, strong) id<FRHomePresenterInterface> presenter;

@end

NS_ASSUME_NONNULL_END
