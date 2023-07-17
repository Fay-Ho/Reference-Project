'use strict';

const h = `%LICENSE%

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@protocol %PREFIX%%NAME%InteractorInterface <NSObject>

@end

@protocol %PREFIX%%NAME%PresenterInterface <NSObject>

@end

@protocol %PREFIX%%NAME%ViewControllerInterface <NSObject>

@end

NS_ASSUME_NONNULL_END
`;

const s = `%LICENSE%

import Foundation

protocol %NAME%InteractorInterface {}

protocol %NAME%PresenterInterface {}

protocol %NAME%ViewControllerInterface: NSObject {}
`;

function createHeader(flagLicense, targetLicense, flagPrefix, targetPrefix, flagName, targetName) {
    return h.replace(flagLicense, targetLicense)
        .replace(flagPrefix, targetPrefix)
        .replace(flagName, targetName);
}

function createSwift(flagLicense, targetLicense, flagName, targetName) {
    return s.replace(flagLicense, targetLicense)
        .replace(flagName, targetName);
}

module.exports = {
    createHeader,
    createSwift
};
