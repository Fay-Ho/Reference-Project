//
//  FRBundleProvider.h
//  Reference-iOS-ObjC
//
//  Created by Fay on 2023/7/7.
//  Copyright © 2023 Fay. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface FRBundleProvider : NSObject

+ (instancetype)provider;

- (id)loadJsonFile:(NSString * _Nonnull)fileName;

@end

NS_ASSUME_NONNULL_END
