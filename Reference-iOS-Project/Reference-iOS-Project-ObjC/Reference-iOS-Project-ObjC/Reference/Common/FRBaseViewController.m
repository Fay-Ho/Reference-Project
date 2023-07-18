//
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

#import "FRBaseViewController.h"

@interface FRBaseViewController ()

@property (nonatomic, strong, readwrite) UIScrollView *root;
@property (nonatomic, strong, readwrite) UIStackView *container;

@end

@implementation FRBaseViewController

#pragma mark - UI Component

- (UIScrollView *)root {
    if (!_root) {
        _root = [UIScrollView make];
    }
    return _root;
}

- (UIStackView *)container {
    if (!_container) {
        _container = [UIStackView makeWithSpacing:0];
    }
    return _container;
}

#pragma mark - View Lifecycle

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setupSubviews];
    [self layoutSubviews];
}

#pragma mark - Subview Management

- (void)setupSubviews {
    [self.view addSubview:self.root];
    [self.root addSubview:self.container];
}

- (void)layoutSubviews {
    [self.root verticalEqualToView:self.view safeArea:YES];
    [self.root horizontalEqualToView:self.view];
    
    [self.container edgeEqualToView:self.root];
    [self.container widthEqualToAnchor:self.root.widthAnchor];
}

@end
