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

#import <UIKit/UIKit.h>
#import "FRWeatherDataModel.h"

NS_ASSUME_NONNULL_BEGIN

@class FRWeatherDashboardItemViewModel;

@interface FRWeatherDashboardItem : UIView

+ (instancetype)item;
- (void)updateWithViewModel:(FRWeatherDashboardItemViewModel *)viewModel;

@end

@interface FRWeatherDashboardItemViewModel : NSObject

@property (nonatomic, strong, nullable) NSString *temperature;
@property (nonatomic, strong, nullable) NSString *weather;
@property (nonatomic, strong, nullable) NSString *wind;

+ (instancetype)viewModelWithTemperature:(NSString * _Nonnull)temperature
                                 weather:(NSString * _Nonnull)weather
                                    wind:(NSString * _Nonnull)wind;

@end

NS_ASSUME_NONNULL_END