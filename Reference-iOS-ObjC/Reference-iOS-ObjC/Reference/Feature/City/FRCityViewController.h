//
//  FRCityViewController.h
//  Reference-iOS-ObjC
//
//  Created by Fay on 2023/7/7.
//  Copyright © 2023 Fay. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "FRCityInterface.h"
#import "FRCityResponse.h"

NS_ASSUME_NONNULL_BEGIN

@interface FRCityViewController : UITableViewController <FRCityViewControllerInterface>

@property (nonatomic, strong) id<FRCityInteractorInterface> interactor;
@property (nonatomic, strong) NSArray<FRCityListResponse *> *models;

@end

NS_ASSUME_NONNULL_END
