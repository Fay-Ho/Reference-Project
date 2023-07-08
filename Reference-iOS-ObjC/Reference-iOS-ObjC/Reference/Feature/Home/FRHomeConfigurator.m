//
//  FRHomeConfigurator.m
//  Reference-iOS-ObjC
//
//  Created by Fay on 2023/7/7.
//  Copyright © 2023 Fay. All rights reserved.
//

#import "FRHomeConfigurator.h"
#import "FRHomeInteractor.h"
#import "FRHomePresenter.h"
#import "FRHomeViewController.h"

@implementation FRHomeConfigurator

+ (instancetype)configurator {
    return [[self alloc] init];
}

- (UIViewController *)makeViewControllerWithData:(id)data {
    FRHomeInteractor *interactor = [FRHomeInteractor new];
    FRHomePresenter *presenter = [FRHomePresenter new];
    FRHomeViewController *viewController = [FRHomeViewController new];
    
    interactor.presenter = presenter;
    presenter.viewController = viewController;
    viewController.interactor = interactor;
    
    return viewController;
}

@end
