"use strict";

const global_prefix = /%PREFIX%/g;

const global_class = /%CLASS%/g;

const configurator_i = `#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@protocol %PREFIX%FeatureConfigurator <NSObject>

+ (instancetype)configurator;

- (UIViewController *)makeViewControllerWithData:(id _Nullable)data;

@end

NS_ASSUME_NONNULL_END
`;

const configurator_h = `#import <UIKit/UIKit.h>
#import "%PREFIX%FeatureConfigurator.h"

NS_ASSUME_NONNULL_BEGIN

@interface %PREFIX%%CLASS%Configurator : NSObject <%PREFIX%FeatureConfigurator>

@end

NS_ASSUME_NONNULL_END
`;

const configurator_m = `#import "%PREFIX%%CLASS%Configurator.h"
#import "%PREFIX%%CLASS%Interactor.h"
#import "%PREFIX%%CLASS%Presenter.h"
#import "%PREFIX%%CLASS%ViewController.h"

@implementation %PREFIX%%CLASS%Configurator

+ (instancetype)configurator {
    return [[self alloc] init];
}

- (UIViewController *)makeViewControllerWithData:(id)data {
    %PREFIX%%CLASS%Interactor *interactor = [[%PREFIX%%CLASS%Interactor alloc] init];
    %PREFIX%%CLASS%Presenter *presenter = [[%PREFIX%%CLASS%Presenter alloc] init];
    %PREFIX%%CLASS%ViewController *viewController = [[%PREFIX%%CLASS%ViewController alloc] init];
    
    interactor.presenter = presenter;
    presenter.viewController = viewController;
    viewController.interactor = interactor;
    
    return viewController;
}

@end`;

let configurator_i_s = configurator_i.replace(global_prefix, "FR");
configurator_i_s = configurator_i_s.replace(global_class, "Person");
console.log(configurator_i_s);

let configurator_h_s = configurator_h.replace(global_prefix, "FR");
configurator_h_s = configurator_h_s.replace(global_class, "Person");
console.log(configurator_h_s);

let configurator_m_s = configurator_m.replace(global_prefix, "FR");
configurator_m_s = configurator_m_s.replace(global_class, "Person");
console.log(configurator_m_s);
