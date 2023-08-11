//
//  NSObject+FRExtension.h
//  Reference-iOS-Project-ObjC
//
//  Created by Fay on 2023/8/10.
//  Copyright © 2023 Fay. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

typedef id _Nullable(^FRDefinedCase)(void);
typedef void(^FRDefaultCase)(void);
typedef id _Nullable(^FRDefaultReturnCase)(void);

@interface NSObject (FRExtension)

- (nullable id)switchOf:(NSDictionary<id<NSCopying>, FRDefinedCase> *)cases;

- (nullable id)switchOf:(NSDictionary<id<NSCopying>, FRDefinedCase> *)cases defaultOf:(nullable FRDefaultCase)defaultCase;

- (nullable id)switchOf:(NSDictionary<id<NSCopying>, FRDefinedCase> *)cases defaultReturn:(nullable FRDefaultReturnCase)defaultReturnCase;

@end

NS_ASSUME_NONNULL_END
