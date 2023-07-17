'use strict';

const h = `%LICENSE%

#import <Foundation/Foundation.h>
#import "%PREFIX%%NAME%Interface.h"

NS_ASSUME_NONNULL_BEGIN

@interface %PREFIX%%NAME%Interactor : NSObject <%PREFIX%%NAME%InteractorInterface>

@property (nonatomic, strong) id<%PREFIX%%NAME%PresenterInterface> presenter;

@end

NS_ASSUME_NONNULL_END
`;

const m = `%LICENSE%

#import "%PREFIX%%NAME%Interactor.h"

@implementation %PREFIX%%NAME%Interactor

#pragma mark - %PREFIX%%NAME%InteractorInterface Implementation

@end
`;

const s = `%LICENSE%

class %NAME%Interactor {
    var presenter: %NAME%PresenterInterface?
}

extension %NAME%Interactor : %NAME%InteractorInterface {}
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
