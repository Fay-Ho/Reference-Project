'use strict';

const h = `%LICENSE%

#import <UIKit/UIKit.h>
#import "%PREFIX%%NAME%Interface.h"

NS_ASSUME_NONNULL_BEGIN

@interface %PREFIX%%NAME%ViewController : UIViewController <%PREFIX%%NAME%ViewControllerInterface>

@property (nonatomic, strong) id<%PREFIX%%NAME%InteractorInterface> interactor;

@end

NS_ASSUME_NONNULL_END
`;

const m = `%LICENSE%

#import "%PREFIX%%NAME%ViewController.h"

@interface %PREFIX%%NAME%ViewController ()

@end

@implementation %PREFIX%%NAME%ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
}

#pragma mark - %PREFIX%%NAME%ViewControllerInterface Implementation

@end
`;

const s = `%LICENSE%

import UIKit

class %NAME%ViewController : UIViewController {
    var interactor: %NAME%InteractorInterface?
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}

extension %NAME%ViewController : %NAME%ViewControllerInterface {}
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
