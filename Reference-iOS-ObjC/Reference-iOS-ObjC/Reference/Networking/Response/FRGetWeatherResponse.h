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

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface FRGetWeatherLivesResponse : NSObject

@property (nonatomic, strong, nonnull) NSString *adcode;
@property (nonatomic, strong, nonnull) NSString *city;
@property (nonatomic, strong, nonnull) NSString *humidity;
@property (nonatomic, strong, nonnull) NSString *humidity_float;
@property (nonatomic, strong, nonnull) NSString *province;
@property (nonatomic, strong, nonnull) NSString *reporttime;
@property (nonatomic, strong, nonnull) NSString *temperature;
@property (nonatomic, strong, nonnull) NSString *temperature_float;
@property (nonatomic, strong, nonnull) NSString *weather;
@property (nonatomic, strong, nonnull) NSString *winddirection;
@property (nonatomic, strong, nonnull) NSString *windpower;

@end

@interface FRGetWeatherResponse : NSObject

@property (nonatomic, strong, nonnull) NSString *count;
@property (nonatomic, strong, nonnull) NSString *info;
@property (nonatomic, strong, nonnull) NSString *infocode;
@property (nonatomic, strong, nonnull) NSArray<FRGetWeatherLivesResponse *> *lives;
@property (nonatomic, strong, nonnull) NSString *status;

@end

NS_ASSUME_NONNULL_END
