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

#import "FRWeatherPresenter.h"
#import "NSObject+JSONModel.h"
#import "NSArray+FRExtension.h"
#import "FRWeatherImage.h"

@implementation FRWeatherPresenter

#pragma mark - FRWeatherPresenterInterface Implementation

- (void)handleGetWeatherResponse:(FRGetWeatherResponse *)response {
    FRWeatherListItemDataModel *row = [FRWeatherListItemDataModel dataModelWithTime:@"12时" image:[FRWeatherImage fileNameOf:@"晴朗"] weather:@"25°C"];
    NSArray<FRWeatherListItemDataModel *> *listItems = @[row, row, row, row, row, row, row, row, row, row, row, row, row, row, row, row, row, row, row, row, row, row, row, row];
    FRGetWeatherLivesResponse *livesResponse = response.lives.firstObject;
    FRWeatherDataModel *dataModel = [FRWeatherDataModel dataModelWithTemperature:livesResponse.temperature
                                                                         weather:livesResponse.weather
                                                                            wind:[livesResponse.winddirection stringByAppendingString:livesResponse.windpower]
                                                                       listItems:listItems];
    [self.viewController updateSubviewsWithDataModel:dataModel];
}

- (void)handleGetCityResponse:(FRGetCityResponse *)response {
    [self.viewController showLocationPageWithDataModel:response];
}

@end
