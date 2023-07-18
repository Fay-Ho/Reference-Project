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

#import "FRGetWeatherResponse.h"

@interface FRGetWeatherResponse ()

@property (nonatomic, strong, readwrite, nonnull) NSString *count;
@property (nonatomic, strong, readwrite, nonnull) NSString *info;
@property (nonatomic, strong, readwrite, nonnull) NSString *infocode;
@property (nonatomic, strong, readwrite, nonnull) NSArray<FRGetWeatherLivesResponse *> *lives;
@property (nonatomic, strong, readwrite, nonnull) NSString *status;

@end

@implementation FRGetWeatherResponse

- (NSDictionary<NSString *,NSString *> *)unkeyedContainer {
    return @{@"lives": @"FRGetWeatherLivesResponse"};
}

@end

@interface FRGetWeatherLivesResponse ()

@property (nonatomic, strong, readwrite, nonnull) NSString *adcode;
@property (nonatomic, strong, readwrite, nonnull) NSString *city;
@property (nonatomic, strong, readwrite, nonnull) NSString *humidity;
@property (nonatomic, strong, readwrite, nonnull) NSString *humidity_float;
@property (nonatomic, strong, readwrite, nonnull) NSString *province;
@property (nonatomic, strong, readwrite, nonnull) NSString *reporttime;
@property (nonatomic, strong, readwrite, nonnull) NSString *temperature;
@property (nonatomic, strong, readwrite, nonnull) NSString *temperature_float;
@property (nonatomic, strong, readwrite, nonnull) NSString *weather;
@property (nonatomic, strong, readwrite, nonnull) NSString *winddirection;
@property (nonatomic, strong, readwrite, nonnull) NSString *windpower;

@end

@implementation FRGetWeatherLivesResponse

@end
