//
//  FRCityConfigurator.m
//  Reference-iOS-ObjC
//
//  Created by Fay on 2023/7/7.
//  Copyright © 2023 Fay. All rights reserved.
//

#import "FRCityConfigurator.h"
#import "FRCityInteractor.h"
#import "FRCityPresenter.h"
#import "FRCityViewController.h"
#import "FRGetCityResponse.h"

@implementation FRCityConfigurator

+ (instancetype)configurator {
    return [[self alloc] init];
}

- (UIViewController *)makeViewControllerWithData:(id)data {
    FRGetCityResponse *response = data;
    
    FRCityInteractor *interactor = [FRCityInteractor new];
    FRCityPresenter *presenter = [FRCityPresenter new];
    FRCityViewController *viewController = [FRCityViewController new];

    interactor.presenter = presenter;
    presenter.viewController = viewController;
    viewController.interactor = interactor;
    viewController.models = response.cities;
    
    return viewController;
}

@end
