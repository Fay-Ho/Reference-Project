//
//  FRLocationModel.h
//  Reference-iOS-Project-ObjC
//
//  Created by Fay on 2023/7/16.
//  Copyright © 2023 Fay. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@class FRLocationTableViewRowModel;

@interface FRLocationTableViewModel : NSObject

@property (nonatomic, strong) NSArray<FRLocationTableViewRowModel *> *rows;

@end

@interface FRLocationTableViewRowModel : NSObject

@property (nonatomic, strong) NSString *name;

@end

NS_ASSUME_NONNULL_END
