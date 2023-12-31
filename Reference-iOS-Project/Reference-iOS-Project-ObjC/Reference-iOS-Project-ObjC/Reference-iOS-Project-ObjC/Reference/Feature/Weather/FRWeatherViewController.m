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

#import "FRImageProvider.h"
#import "FRWeatherDashboardItem.h"
#import "FRWeatherDataModel.h"
#import "FRWeatherListItem.h"

#import "UIKit+FRTheme.h"

@interface FRWeatherViewController ()

@property (nonatomic, strong) UIImageView *locationButton;
@property (nonatomic, strong) FRWeatherDashboardItem *dashboardItem;
@property (nonatomic, strong) FRWeatherListItem *listItem;

@end

@implementation FRWeatherViewController

#pragma mark - UI Component

- (UIImageView *)locationButton {
    if (!_locationButton) {
        _locationButton = [UIImageView makeWithImage:[[FRImageProvider rawValue:FRImageEnumLocation] loadImage]];
        _locationButton.userInteractionEnabled = YES;
        
        UITapGestureRecognizer *recognizer = [[UITapGestureRecognizer alloc] init];
        [recognizer addTarget:self action:@selector(nextPage:)];
        [_locationButton addGestureRecognizer:recognizer];
    }
    return _locationButton;
}

- (FRWeatherDashboardItem *)dashboardItem {
    if (!_dashboardItem) {
        _dashboardItem = [FRWeatherDashboardItem item];
    }
    return _dashboardItem;
}

- (FRWeatherListItem *)listItem {
    if (!_listItem) {
        _listItem = [FRWeatherListItem item];
    }
    return _listItem;
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
    [self.container addArrangedSubviews:@[self.dashboardItem, self.listItem]];
}

- (void)setupLayouts {
    [self.locationButton topEqualToAnchor:self.view.safeAreaLayoutGuide.topAnchor constant:16];
    [self.locationButton trailingEqualToAnchor:self.view.trailingAnchor constant:-24];
    [self.locationButton widthEqualToConstant:24];
    [self.locationButton heightEqualToAnchor:self.locationButton.widthAnchor];
}

- (void)updateStyling {
    self.view.backgroundColor = [UIColor wallpaperColor];
}

#pragma mark - Event Management

- (void)nextPage:(id)sender {
    [self.interactor fetchCityList];
}

#pragma mark - FRWeatherViewControllerInterface Implementation

- (void)updateSubviewsWithDataModel:(FRWeatherDataModel *)dataModel {
    FRWeatherDashboardItemViewModel *viewModel = [FRWeatherDashboardItemViewModel viewModelWithTemperature:dataModel.temperature
                                                                                                   weather:dataModel.weather
                                                                                                      wind:dataModel.wind];
    [self.dashboardItem updateWithViewModel:viewModel];
    [self.listItem updateWithDataModel:dataModel.listItems];
}

- (void)showLocationPageWithResponse:(FRCityResponse *)response {
    [self.navigator navigateTo:FRDestinationLocation from:self.navigationController dataModel:response];
}

@end
