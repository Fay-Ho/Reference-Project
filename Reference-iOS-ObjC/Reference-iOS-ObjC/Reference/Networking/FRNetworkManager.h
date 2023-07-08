//
//  FRNetworkManager.h
//  Reference-iOS-ObjC
//
//  Created by Fay on 2023/7/7.
//  Copyright © 2023 Fay. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface FRNetworkManager<R> : NSObject

typedef void(^FRCompletion)(R _Nullable response);

+ (instancetype)manager;

- (void)getCity:(FRCompletion _Nullable)completion;

- (void)getWeather:(FRCompletion _Nullable)completion;

- (void)postUser:(FRCompletion _Nullable)completion;

@end

NS_ASSUME_NONNULL_END
