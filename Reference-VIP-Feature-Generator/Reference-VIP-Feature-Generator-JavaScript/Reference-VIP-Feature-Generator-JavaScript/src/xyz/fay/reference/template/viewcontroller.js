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
