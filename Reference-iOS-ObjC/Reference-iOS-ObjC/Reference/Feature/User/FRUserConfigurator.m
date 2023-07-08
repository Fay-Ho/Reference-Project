//
//  FRUserConfigurator.m
//  Reference-iOS-ObjC
//
//  Created by Fay on 2023/7/7.
//  Copyright © 2023 Fay. All rights reserved.
//

#import "FRUserConfigurator.h"
#import "FRUserInteractor.h"
#import "FRUserPresenter.h"
#import "FRUserViewController.h"

@implementation FRUserConfigurator

+ (instancetype)configurator {
    return [[self alloc] init];
}

- (UIViewController *)makeViewControllerWithData:(id)data {
    FRUserInteractor *interactor = [FRUserInteractor new];
    FRUserPresenter *presenter = [FRUserPresenter new];
    FRUserViewController *viewController = [FRUserViewController new];
    
    interactor.presenter = presenter;
    presenter.viewController = viewController;
    viewController.interactor = interactor;
    
    return viewController;
}

@end
