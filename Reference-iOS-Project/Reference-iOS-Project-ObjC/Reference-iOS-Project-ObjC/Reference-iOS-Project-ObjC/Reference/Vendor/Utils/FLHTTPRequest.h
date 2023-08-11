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

@interface FLHTTPRequest : NSObject

/*!
 请求方法
 
 @discussion 定义了 HTTP 协议的请求方法，包括 GET，PUT，POST，DELETE 的请求类型
 */
typedef NSString* FLRequestMethod NS_STRING_ENUM;
FOUNDATION_EXPORT FLRequestMethod const FLRequestMethodGet;
FOUNDATION_EXPORT FLRequestMethod const FLRequestMethodPost;
FOUNDATION_EXPORT FLRequestMethod const FLRequestMethodDelete;
FOUNDATION_EXPORT FLRequestMethod const FLRequestMethodPut;

/*!
 请求地址
 
 @discussion 接收请求的服务器地址
 */
@property (nonatomic, copy) NSString *requestURL;

/*!
 请求方法
 
 @discussion 默认使用 GET 方法进行请求
 */
@property (nonatomic) FLRequestMethod requestMethod;

/*!
 请求头
 
 @discussion 发送到服务器的请求的头部参数，用于定义一些网络验证的参数
 */
@property (nonatomic, copy) NSDictionary *requestHeaders;

/*!
 请求参数
 
 @discussion 发送到服务器的请求的参数
 */
@property (nonatomic, copy) NSDictionary *requestParams;

/*!
 超时时隔
 
 @discussion 不设置默认请求时间为120秒
 */
@property (nonatomic) NSTimeInterval timeoutInterval;

+ (instancetype)requestWithRequestURL:(NSString *)requestURL requestMethod:(FLRequestMethod)requestMethod requestParams:(NSDictionary *)requestParams;

@end

@interface NSDictionary (FLHTTPRequest)

/*!
 序列化参数
 
 @return URL 格式化的参数
 */
- (NSString *)queryString;

@end

NS_ASSUME_NONNULL_END
