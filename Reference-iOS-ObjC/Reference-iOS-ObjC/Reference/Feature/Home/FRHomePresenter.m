//
//  FRHomePresenter.m
//  Reference-iOS-ObjC
//
//  Created by Fay on 2023/7/7.
//  Copyright © 2023 Fay. All rights reserved.
//

#import "FRHomePresenter.h"

@implementation FRHomePresenter

- (void)handleCityResponse:(FRGetCityResponse *)response {
    [self.viewController showCityPageWithResponse:response];
}

- (void)handleWeatherResponse:(FRGetWeatherResponse *)response {
    [self.viewController updateSubviewsWithResponse:response];
}

@end
