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
#import "UIFont+FRTheme.h"
#import "UIKit+FRExtension.h"

@interface FRWeatherDashboardItem ()

@property (nonatomic, strong) UILabel *temperatureLabel;
@property (nonatomic, strong) FRWeatherDashboardItemViewData *viewData;

@end

@implementation FRWeatherDashboardItem

#pragma mark -

- (UILabel *)temperatureLabel {
    if (!_temperatureLabel) {
        _temperatureLabel = [UILabel makeWithText:_viewData.temperature];
        _temperatureLabel.textAlignment = NSTextAlignmentCenter;
    }
    return _temperatureLabel;
}

#pragma mark -

- (void)setupSubviews {
    [self addSubview:self.temperatureLabel];
}

- (void)setupLayouts {
    [self.temperatureLabel verticalEqualToView:self constant:100];
    [self.temperatureLabel horizontalEqualToView:self constant:50];
}

- (void)updateStyling {
    self.temperatureLabel.font = [UIFont boldLargeFont];
}

#pragma mark -

+ (instancetype)itemWithViewData:(FRWeatherDashboardItemViewData *)viewData {
    FRWeatherDashboardItem *item = [[self alloc] init];
    item.viewData = viewData;
    [item setupSubviews];
    [item setupLayouts];
    [item updateStyling];
    return item;
}

- (void)updateViewData:(FRWeatherDashboardItemViewData *)viewData {
    self.temperatureLabel.text = viewData.temperature;
}

@end
