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

#import "FLHTTPRequest.h"

@implementation FLHTTPRequest

NSString * const FLRequestMethodGet = @"GET";
NSString * const FLRequestMethodPut = @"PUT";
NSString * const FLRequestMethodPost = @"POST";
NSString * const FLRequestMethodDelete = @"DELETE";

- (NSTimeInterval)timeoutInterval {
    if (_timeoutInterval == 0) {
        return 120;
    }
    return _timeoutInterval;
}

+ (instancetype)requestWithURL:(NSString *)url method:(FLRequestMethod)method {
    FLHTTPRequest *httpRequest = [[super alloc] init];
    httpRequest.requestURL = url;
    httpRequest.requestMethod = method;
    return httpRequest;
}

@end

@implementation NSDictionary (FLHTTPRequest)

- (NSString *)queryString {
    NSMutableArray *pairs = [NSMutableArray array];
    [self enumerateKeysAndObjectsUsingBlock:^(id _Nonnull key, id  _Nonnull obj, BOOL * _Nonnull stop) {
        [pairs addObject:[NSString stringWithFormat:@"%@=%@", key, obj]];
    }];
    return [pairs componentsJoinedByString:@"&"];
}

@end
