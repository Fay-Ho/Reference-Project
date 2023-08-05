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

#import "FLNetworking.h"
#import "YYModel.h"

static NSOperationQueue* operationQueue() {
    static NSOperationQueue *queue;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        queue = [[NSOperationQueue alloc] init];
        queue.maxConcurrentOperationCount = 1;
    });
    return queue;
}

@implementation FLNetworking

#pragma mark -

// 新建实例
+ (instancetype)networking {
    return [[super alloc] init];
}

#pragma mark -

- (void)sendRequest:(FLHTTPRequest *)httpRequest success:(FLResponseSuccess)success failure:(FLResponseFailure)failure {
    NSURL *url = [NSURL URLWithString:httpRequest.requestURL];
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:url];
    request.HTTPMethod = httpRequest.requestMethod;
    request.timeoutInterval = httpRequest.timeoutInterval;
    request.HTTPBody = [httpRequest.requestParams.queryString dataUsingEncoding:NSUTF8StringEncoding];
    [httpRequest.requestHeaders enumerateKeysAndObjectsUsingBlock:^(id _Nonnull field, id _Nonnull value, BOOL * _Nonnull stop) {
        [request setValue:value forHTTPHeaderField:field];
    }];
    
    NSURLSession *session = [NSURLSession sessionWithConfiguration:[NSURLSessionConfiguration defaultSessionConfiguration] delegate:nil delegateQueue:operationQueue()];
    NSURLSessionDataTask *dataTask = [session dataTaskWithRequest:request completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        if (data) {
            dispatch_async(dispatch_get_main_queue(), ^{
                success(data);
            });
        } else if (error) {
            dispatch_async(dispatch_get_main_queue(), ^{
                failure(error);
            });
        }
    }];
    
    [dataTask resume];
}

@end
