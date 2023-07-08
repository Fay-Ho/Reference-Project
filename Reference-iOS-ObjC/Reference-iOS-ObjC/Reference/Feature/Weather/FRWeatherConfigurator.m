//
//  FRWeatherConfigurator.m
//  Reference-iOS-ObjC
//
//  Created by Fay on 2023/7/7.
//  Copyright © 2023 Fay. All rights reserved.
//

#import "FRWeatherConfigurator.h"
#import "FRWeatherInteractor.h"
#import "FRWeatherPresenter.h"
#import "FRWeatherViewController.h"

@implementation FRWeatherConfigurator

+ (instancetype)configurator {
    return [[self alloc] init];
}

- (UIViewController *)makeViewController {
    FRWeatherInteractor *interactor = [FRWeatherInteractor new];
    FRWeatherPresenter *presenter = [FRWeatherPresenter new];
    FRWeatherViewController *viewController = [FRWeatherViewController new];
    
    interactor.presenter = presenter;
    presenter.viewController = viewController;
    viewController.interactor = interactor;
    
    return viewController;
}

@end
