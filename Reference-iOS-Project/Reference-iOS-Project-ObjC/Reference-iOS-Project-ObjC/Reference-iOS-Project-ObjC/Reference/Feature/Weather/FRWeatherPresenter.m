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

#import "FRWeatherDataModel.h"
#import "FRWeatherResponse.h"

#import "Foundation+FRExtension.h"

@implementation FRWeatherPresenter

typedef NSString* FRPattern NS_STRING_ENUM;
FRPattern const FRPatternDateTime = @"yyyy-MM-dd HH:mm:ss";
FRPattern const FRPatternTime = @"HH:mm";

#pragma mark - FRWeatherPresenterInterface Implementation

- (void)handleCityResponse:(FRCityResponse *)response {
    [self.viewController showLocationPageWithResponse:response];
}

- (void)handleWeatherResponse:(FRWeatherResponse *)response {
    FRWeatherListResponse *listResponse = response.list.firstObject;
    if (!listResponse) { return; }
    
    FRWeatherListWeatherResponse *weatherResponse = listResponse.weather.firstObject;
    if (!weatherResponse) { return; }
    
    [self.viewController updateSubviewsWithDataModel:[FRWeatherDataModel dataModelWithTemperature:[self formatDouble:listResponse.main.temp]
                                                                                          weather:weatherResponse.w_description
                                                                                             wind:[self formatInt:listResponse.wind.deg]
                                                                                        listItems:[self makeListItems:response]]];
}

- (NSArray<FRWeatherListItemDataModel *> *)makeListItems:(FRWeatherResponse *)response {
    return [response.list map:^id _Nonnull (FRWeatherListResponse * _Nonnull response) {
        return [FRWeatherListItemDataModel dataModelWithTime:[self formatDate:response.dt_txt]
                                                       image:[self formatImage:response.weather.firstObject]
                                                     weather:[self formatDouble:response.main.temp]];
    }];
}

- (NSString *)formatDate:(NSString *)string {
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    formatter.dateFormat = FRPatternDateTime;
    NSDate *date = [formatter dateFromString:string];
    formatter.dateFormat = FRPatternTime;
    return [formatter stringFromDate:date];
}

- (NSString *)formatDouble:(double)value {
    return [NSString stringWithFormat:@"%.f", ceil(value)];
}

- (NSString *)formatImage:(nullable FRWeatherListWeatherResponse *)response {
    return response ? response.main : @"";
}

- (NSString *)formatInt:(int)value {
    return [NSString stringWithFormat:@"%d", value];
}

@end
