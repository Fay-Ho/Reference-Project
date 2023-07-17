'use strict';

const h = `%LICENSE%

#import <Foundation/Foundation.h>
#import "%PREFIX%%NAME%Interface.h"

NS_ASSUME_NONNULL_BEGIN

@interface %PREFIX%%NAME%Presenter : NSObject <%PREFIX%%NAME%PresenterInterface>

@property (nonatomic, weak) id<%PREFIX%%NAME%ViewControllerInterface> viewController;

@end

NS_ASSUME_NONNULL_END
`;

const m = `%LICENSE%

#import "%PREFIX%%NAME%Presenter.h"

@implementation %PREFIX%%NAME%Presenter

#pragma mark - %PREFIX%%NAME%PresenterInterface Implementation

@end
`;

const s = `%LICENSE%

class %NAME%Presenter {
    weak var viewController: %NAME%ViewControllerInterface?
}

extension %NAME%Presenter : %NAME%PresenterInterface {}
`;

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

function createSwift(flagLicense, targetLicense, flagName, targetName) {
    return s.replace(flagLicense, targetLicense)
        .replace(flagName, targetName);
}

module.exports = {
    createHeader,
    createMessage,
    createSwift
};
