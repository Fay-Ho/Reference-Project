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

#import "FRWeatherViewController.h"
#import "FRHelper.h"
#import "UIColor+FRTheme.h"
#import "FRWeatherDashboardItem.h"

@interface FRWeatherViewController ()

@property (nonatomic, strong) UIImageView *locationButton;
@property (nonatomic, strong) FRWeatherDashboardItem *dashboardItem;

@end

@implementation FRWeatherViewController

#pragma mark - UI Component

- (UIImageView *)locationButton {
    if (!_locationButton) {
        _locationButton = [UIImageView makeWithImage:[UIImage imageNamed:@"ImgLocation"]];
        _locationButton.userInteractionEnabled = YES;

        UITapGestureRecognizer *recognizer = [[UITapGestureRecognizer alloc] init];
        [recognizer addTarget:self action:@selector(nextPage:)];
        [_locationButton addGestureRecognizer:recognizer];
    }
    return _locationButton;
}

- (FRWeatherDashboardItem *)dashboardItem {
    if (!_dashboardItem) {
        FRWeatherDashboardItemViewData *viewModel = [FRWeatherDashboardItemViewData viewData];
        viewModel.temperature = @"20 °C";
        _dashboardItem = [FRWeatherDashboardItem itemWithViewData:viewModel];
    }
    return _dashboardItem;
}

#pragma mark - View Lifecycle

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setupSubviews];
    [self setupLayouts];
    [self updateStyling];
    [self.interactor viewIsReady];
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    [self.navigationController setNavigationBarHidden:YES animated:NO];
}

- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
    [self.navigationController setNavigationBarHidden:NO animated:NO];
}

#pragma mark - Subview Management

- (void)setupSubviews {
    [self.view addSubview:self.locationButton];
    [self.container addArrangedSubview:self.dashboardItem];
}

- (void)setupLayouts {
    CGFloat margin = 24;
    [self.locationButton topEqualToAnchor:self.view.safeAreaLayoutGuide.topAnchor constant:margin];
    [self.locationButton trailingEqualToAnchor:self.view.trailingAnchor constant:-margin];
    [self.locationButton widthEqualToConstant:margin];
    [self.locationButton heightEqualToAnchor:self.locationButton.widthAnchor];
}

- (void)updateStyling {
    self.view.backgroundColor = [UIColor themeColor];
}

#pragma mark - Event Management

- (void)nextPage:(id)sender {
    [self.interactor fetchData];
}

#pragma mark - FRWeatherViewControllerInterface Implementation

- (void)updateDashboardItemWithViewData:(FRWeatherDashboardItemViewData *)viewData {
    [self.dashboardItem updateViewData:viewData];
}

- (void)showLocationPageWithDataModel:(NSData *)model {
    [[FRHelper sharedInstance].navigator navigateTo:FRDestinationLocation from:self.navigationController dataModel:model];
}

@end
