"use strict";

const global_prefix = /%PREFIX%/g;

const global_class = /%CLASS%/g;

const interface_h = `#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@protocol %PREFIX%%CLASS%InteractorInterface <NSObject>

@end

@protocol %PREFIX%%CLASS%PresenterInterface <NSObject>

@end

@protocol %PREFIX%%CLASS%ViewControllerInterface <NSObject>

@end

NS_ASSUME_NONNULL_END`;

let interface_h_s = interface_h.replace(global_prefix, "FR");
interface_h_s = interface_h_s.replace(global_class, "Person");
console.log(interface_h_s);
