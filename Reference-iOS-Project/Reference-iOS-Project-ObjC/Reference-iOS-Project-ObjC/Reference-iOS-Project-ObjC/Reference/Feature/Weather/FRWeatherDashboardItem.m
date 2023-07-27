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

#import "FRWeatherDashboardItem.h"
#import "UIKit+FRExtension.h"
#import "UIKit+FRTheme.h"

NS_ASSUME_NONNULL_BEGIN

@interface FRWeatherDashboardItemViewModel ()

@property (nonatomic, strong, nonnull) NSString *temperature;
@property (nonatomic, strong, nonnull) NSString *weather;
@property (nonatomic, strong, nonnull) NSString *wind;

@end

NS_ASSUME_NONNULL_END

#pragma mark -

@interface FRWeatherDashboardItem ()

@property (nonatomic, strong) UIView *container;
@property (nonatomic, strong) UILabel *temperatureLabel;
@property (nonatomic, strong) UILabel *celsiusLabel;
@property (nonatomic, strong) UILabel *weatherLabel;
@property (nonatomic, strong) UILabel *windLabel;

@end

@implementation FRWeatherDashboardItem

#pragma mark - UI Component

- (UIView *)container {
    if (!_container) {
        _container = [UIView make];
        _container.layer.cornerRadius = 10;
        _container.layer.masksToBounds = YES;
    }
    return _container;
}

- (UILabel *)temperatureLabel {
    if (!_temperatureLabel) {
        _temperatureLabel = [UILabel makeWithText:nil];
        _temperatureLabel.textAlignment = NSTextAlignmentCenter;
    }
    return _temperatureLabel;
}

- (UILabel *)celsiusLabel {
    if (!_celsiusLabel) {
        _celsiusLabel = [UILabel makeWithText:@"°C"];
        _celsiusLabel.textAlignment = NSTextAlignmentNatural;
    }
    return _celsiusLabel;
}

- (UILabel *)weatherLabel {
    if (!_weatherLabel) {
        _weatherLabel = [UILabel makeWithText:nil];
        _weatherLabel.textAlignment = NSTextAlignmentCenter;
        _weatherLabel.layer.cornerRadius = 5;
        _weatherLabel.layer.masksToBounds = YES;
    }
    return _weatherLabel;
}

- (UILabel *)windLabel {
    if (!_windLabel) {
        _windLabel = [UILabel makeWithText:nil];
        _windLabel.textAlignment = NSTextAlignmentCenter;
        _windLabel.layer.cornerRadius = 5;
        _windLabel.layer.masksToBounds = YES;
    }
    return _windLabel;
}

#pragma mark - Lifecycle

+ (instancetype)item {
    FRWeatherDashboardItem *item = [[self alloc] init];
    [item setupSubviews];
    [item setupLayouts];
    [item updateStyling];
    return item;
}

#pragma mark - Subview Management

- (void)setupSubviews {
    [self addSubview:self.container];
    [self.container addSubviews:@[self.temperatureLabel, self.celsiusLabel, self.weatherLabel, self.windLabel]];
}

- (void)setupLayouts {
    [self.container topEqualToAnchor:self.topAnchor constant:60];
    [self.container bottomEqualToAnchor:self.bottomAnchor constant:10];
    [self.container horizontalEqualToView:self constant:16];
    
    [self.temperatureLabel verticalEqualToView:self.container constant:100];
    [self.temperatureLabel horizontalEqualToView:self.container constant:135];
    
    [self.celsiusLabel topEqualToAnchor:self.container.topAnchor constant:100];
    [self.celsiusLabel trailingEqualToAnchor:self.container.trailingAnchor constant:100];
    [self.celsiusLabel leadingEqualToAnchor:self.temperatureLabel.trailingAnchor];
    
    [self.weatherLabel topEqualToAnchor:self.temperatureLabel.bottomAnchor constant:10];
    [self.weatherLabel centerXEqualToAnchor:self.container.centerXAnchor constant:-50];
    
    [self.windLabel topEqualToAnchor:self.temperatureLabel.bottomAnchor constant:10];
    [self.windLabel centerXEqualToAnchor:self.container.centerXAnchor constant:50];
}

- (void)updateStyling {
    self.container.backgroundColor = [UIColor itemColor];
    
    self.temperatureLabel.font = [UIFont size80Font];
    self.temperatureLabel.textColor = [UIColor fontColor];
    
    self.celsiusLabel.font = [UIFont size30Font];
    self.celsiusLabel.textColor = [UIColor fontColor];
    
    self.weatherLabel.font = [UIFont size16Font];
    self.weatherLabel.textColor = [UIColor fontColor];
    self.weatherLabel.backgroundColor = [UIColor labelColor];
    
    self.windLabel.font = [UIFont size16Font];
    self.windLabel.textColor = [UIColor fontColor];
    self.windLabel.backgroundColor = [UIColor labelColor];
}

#pragma mark -

- (void)updateWithViewModel:(FRWeatherDashboardItemViewModel *)viewModel {
    self.temperatureLabel.text = viewModel.temperature;
    self.weatherLabel.text = viewModel.weather;
    self.windLabel.text = viewModel.wind;
}

@end

@implementation FRWeatherDashboardItemViewModel

+ (instancetype)viewModelWithTemperature:(NSString *)temperature
                                 weather:(NSString *)weather
                                    wind:(NSString *)wind {
    FRWeatherDashboardItemViewModel *viewModel = [[self alloc] init];
    viewModel.temperature = temperature;
    viewModel.weather = weather;
    viewModel.wind = wind;
    return viewModel;
}

@end
