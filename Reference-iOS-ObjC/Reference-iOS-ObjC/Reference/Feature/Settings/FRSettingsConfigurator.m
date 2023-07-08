//
//  FRSettingsConfigurator.m
//  Reference-iOS-ObjC
//
//  Created by Fay on 2023/7/7.
//  Copyright © 2023 Fay. All rights reserved.
//

#import "FRSettingsConfigurator.h"
#import "FRSettingsInteractor.h"
#import "FRSettingsPresenter.h"
#import "FRSettingsViewController.h"

@implementation FRSettingsConfigurator

+ (instancetype)configurator {
    return [[self alloc] init];
}

- (UIViewController *)makeViewController {
    FRSettingsInteractor *interactor = [FRSettingsInteractor new];
    FRSettingsPresenter *presenter = [FRSettingsPresenter new];
    FRSettingsViewController *viewController = [FRSettingsViewController new];
    
    interactor.presenter = presenter;
    presenter.viewController = viewController;
    viewController.interactor = interactor;
    
    return viewController;
}

@end
