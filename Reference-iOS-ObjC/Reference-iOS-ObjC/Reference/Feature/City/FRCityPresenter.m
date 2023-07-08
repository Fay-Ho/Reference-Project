//
//  FRCityPresenter.m
//  Reference-iOS-ObjC
//
//  Created by Fay on 2023/7/7.
//  Copyright © 2023 Fay. All rights reserved.
//

#import "FRCityPresenter.h"

@implementation FRCityPresenter

- (void)handleResponse:(FRCityResponse *)response {
    [self.viewController updateSubviewsWithResponse:response];
}

@end
