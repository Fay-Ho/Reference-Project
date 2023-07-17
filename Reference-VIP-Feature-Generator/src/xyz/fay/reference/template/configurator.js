'use strict';

const oi = `%LICENSE%

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@protocol %PREFIX%FeatureConfigurator <NSObject>

+ (instancetype)configurator;

- (UIViewController *)makeViewControllerWithDataModel:(id _Nullable)model;

@end

NS_ASSUME_NONNULL_END
`;

const h = `%LICENSE%

#import <Foundation/Foundation.h>
#import "%PREFIX%FeatureConfigurator.h"

NS_ASSUME_NONNULL_BEGIN

@interface %PREFIX%%NAME%Configurator : NSObject <%PREFIX%FeatureConfigurator>

@end

NS_ASSUME_NONNULL_END
`;

const m = `%LICENSE%

#import "%PREFIX%%NAME%Configurator.h"
#import "%PREFIX%%NAME%Interactor.h"
#import "%PREFIX%%NAME%Presenter.h"
#import "%PREFIX%%NAME%ViewController.h"

@implementation %PREFIX%%NAME%Configurator

+ (instancetype)configurator {
    return [[self alloc] init];
}

- (UIViewController *)makeViewControllerWithDataModel:(id)model {
    %PREFIX%%NAME%Interactor *interactor = [[%PREFIX%%NAME%Interactor alloc] init];
    %PREFIX%%NAME%Presenter *presenter = [[%PREFIX%%NAME%Presenter alloc] init];
    %PREFIX%%NAME%ViewController *viewController = [[%PREFIX%%NAME%ViewController alloc] init];
    
    interactor.presenter = presenter;
    presenter.viewController = viewController;
    viewController.interactor = interactor;
    
    return viewController;
}

@end
`;

const si =`%LICENSE%

import UIKit

protocol FeatureConfigurator {
    func makeViewController(dataModel model: Codable?) -> UIViewController
}
`;

const s = `%LICENSE%

import UIKit

class %NAME%Configurator : FeatureConfigurator {
    func makeViewController(dataModel model: Codable?) -> UIViewController {
        let interactor = %NAME%Interactor()
        let presenter = %NAME%Presenter()
        let viewController = %NAME%ViewController()
        
        interactor.presenter = presenter
        presenter.viewController = viewController
        viewController.interactor = interactor
        
        return viewController
    }
}
`;

function createObjcInterface(flagLicense, targetLicense, flagPrefix, targetPrefix) {
    return oi.replace(flagLicense, targetLicense)
        .replace(flagPrefix, targetPrefix);
}

function createHeader(flagLicense, targetLicense, flagPrefix, targetPrefix, flagName, targetName) {
    return h.replace(flagLicense, targetLicense)
        .replace(flagPrefix, targetPrefix)
        .replace(flagName, targetName);
}

function createMessage(flagLicense, targetLicense, flagPrefix, targetPrefix, flagName, targetName) {
    return m.replace(flagLicense, targetLicense)
        .replace(flagPrefix, targetPrefix)
        .replace(flagName, targetName);
}

function createSwiftInterface(flagLicense, targetLicense) {
    return si.replace(flagLicense, targetLicense);
}

function createSwift(flagLicense, targetLicense, flagName, targetName) {
    return s.replace(flagLicense, targetLicense)
        .replace(flagName, targetName);
}

module.exports = {
    createObjcInterface,
    createHeader,
    createMessage,
    createSwiftInterface,
    createSwift
};
