//
//  FRCityInteractor.h
//  Reference-iOS-ObjC
//
//  Created by Fay on 2023/7/7.
//  Copyright © 2023 Fay. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "FRCityInterface.h"

NS_ASSUME_NONNULL_BEGIN

@interface FRCityInteractor : NSObject <FRCityInteractorInterface>

@property (nonatomic, strong) id<FRCityPresenterInterface> presenter;

@end

NS_ASSUME_NONNULL_END
