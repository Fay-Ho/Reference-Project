//
//  FRSettingsInteractor.h
//  Reference-iOS-ObjC
//
//  Created by Fay on 2023/7/7.
//  Copyright © 2023 Fay. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "FRSettingsInterface.h"

NS_ASSUME_NONNULL_BEGIN

@interface FRSettingsInteractor : NSObject <FRSettingsInteractorInterface>

@property (nonatomic, strong) id<FRSettingsPresenterInterface> presenter;

@end

NS_ASSUME_NONNULL_END
