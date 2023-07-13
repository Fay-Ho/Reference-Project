'use strict';

const i = `//
//  MIT License
//
//  Copyright (c) 2023 Fay-Ho
//
//  Permission is hereby granted, free of charge, to any person obtaining a copy
//  of this software and associated documentation files (the "Software"), to deal
//  in the Software without restriction, including without limitation the rights
//  to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
//  copies of the Software, and to permit persons to whom the Software is
//  furnished to do so, subject to the following conditions:
//
//  The above copyright notice and this permission notice shall be included in all
//  copies or substantial portions of the Software.
//
//  THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
//  IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
//  FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
//  AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
//  LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
//  OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
//  SOFTWARE.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@protocol %PREFIX%FeatureConfigurator <NSObject>

+ (instancetype)configurator;

- (UIViewController *)makeViewControllerWithData:(id _Nullable)data;

@end

NS_ASSUME_NONNULL_END
`;

const h = `//
//  MIT License
//
//  Copyright (c) 2023 Fay-Ho
//
//  Permission is hereby granted, free of charge, to any person obtaining a copy
//  of this software and associated documentation files (the "Software"), to deal
//  in the Software without restriction, including without limitation the rights
//  to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
//  copies of the Software, and to permit persons to whom the Software is
//  furnished to do so, subject to the following conditions:
//
//  The above copyright notice and this permission notice shall be included in all
//  copies or substantial portions of the Software.
//
//  THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
//  IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
//  FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
//  AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
//  LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
//  OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
//  SOFTWARE.
//

#import <UIKit/UIKit.h>
#import "%PREFIX%FeatureConfigurator.h"

NS_ASSUME_NONNULL_BEGIN

@interface %PREFIX%%CLASS%Configurator : NSObject <%PREFIX%FeatureConfigurator>

@end

NS_ASSUME_NONNULL_END
`;

const m = `//
//  MIT License
//
//  Copyright (c) 2023 Fay-Ho
//
//  Permission is hereby granted, free of charge, to any person obtaining a copy
//  of this software and associated documentation files (the "Software"), to deal
//  in the Software without restriction, including without limitation the rights
//  to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
//  copies of the Software, and to permit persons to whom the Software is
//  furnished to do so, subject to the following conditions:
//
//  The above copyright notice and this permission notice shall be included in all
//  copies or substantial portions of the Software.
//
//  THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
//  IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
//  FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
//  AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
//  LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
//  OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
//  SOFTWARE.
//

#import "%PREFIX%%CLASS%Configurator.h"
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

@end
`;

function createFileI(flagPrefix, targetPrefix) {
    return i.replace(flagPrefix, targetPrefix);
}

function createFileH(flagPrefix, targetPrefix, flagClass, targetClass) {
    return h.replace(flagPrefix, targetPrefix)
        .replace(flagClass, targetClass);
}

function createFileM(flagPrefix, targetPrefix, flagClass, targetClass) {
    return m.replace(flagPrefix, targetPrefix)
        .replace(flagClass, targetClass);
}

module.exports = {
    createFileI,
    createFileH,
    createFileM
};
