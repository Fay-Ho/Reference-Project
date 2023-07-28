'use strict';

/*
  MIT License

  Copyright (c) 2023 Fay-Ho

  Permission is hereby granted, free of charge, to any person obtaining a copy
  of this software and associated documentation files (the "Software"), to deal
  in the Software without restriction, including without limitation the rights
  to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
  copies of the Software, and to permit persons to whom the Software is
  furnished to do so, subject to the following conditions:

  The above copyright notice and this permission notice shall be included in all
  copies or substantial portions of the Software.

  THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
  IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
  FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
  AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
  LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
  OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
  SOFTWARE.
*/

const oi = `%LICENSE%

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@protocol %PREFIX%FeatureConfigurator <NSObject>

+ (instancetype)configurator;

- (UIViewController *)makeViewControllerWithDataModel:(id _Nullable)dataModel;

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

- (UIViewController *)makeViewControllerWithDataModel:(id)dataModel {
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
    func makeViewController(dataModel: Codable?) -> UIViewController
}
`;

const s = `%LICENSE%

import UIKit

class %NAME%Configurator : FeatureConfigurator {
    func makeViewController(dataModel: Codable?) -> UIViewController {
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
