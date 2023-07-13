//
//  BaseViewController.m
//  Reference-iOS-ObjC
//
//  Created by Fay on 2023/7/13.
//  Copyright © 2023 Fay. All rights reserved.
//

#import "BaseViewController.h"
#import "UIStackView+FRExtension.h"

@interface BaseViewController ()

@end

@implementation BaseViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (UIStackView *)container {
    if (!_container) {
        _container = [[UIStackView alloc] init];
    }
    return _container;
}

@end
