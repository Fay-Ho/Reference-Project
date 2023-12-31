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

#import "FRWeatherDataModel.h"

NS_ASSUME_NONNULL_BEGIN

@interface FRWeatherDataModel ()

@property (nonatomic, strong, readwrite) NSString *temperature;
@property (nonatomic, strong, readwrite) NSString *weather;
@property (nonatomic, strong, readwrite) NSString *wind;
@property (nonatomic, strong, readwrite) NSArray<FRWeatherListItemDataModel *> *listItems;

@end

@implementation FRWeatherDataModel

+ (instancetype)dataModelWithTemperature:(NSString *)temperature
                                 weather:(NSString *)weather
                                    wind:(NSString *)wind
                               listItems:(NSArray<FRWeatherListItemDataModel *> *)listItems {
    FRWeatherDataModel *dataModel = [[super alloc] init];
    dataModel.temperature = temperature;
    dataModel.weather = weather;
    dataModel.wind = wind;
    dataModel.listItems = listItems;
    return dataModel;
}

@end

@interface FRWeatherListItemDataModel ()

@property (nonatomic, strong, readwrite) NSString *time;
@property (nonatomic, strong, readwrite) NSString *image;
@property (nonatomic, strong, readwrite) NSString *weather;

@end

@implementation FRWeatherListItemDataModel

+ (instancetype)dataModelWithTime:(NSString *)time
                            image:(NSString *)image
                          weather:(NSString *)weather {
    FRWeatherListItemDataModel *model = [[super alloc] init];
    model.time = time;
    model.image = image;
    model.weather = weather;
    return model;
}

@end

NS_ASSUME_NONNULL_END
