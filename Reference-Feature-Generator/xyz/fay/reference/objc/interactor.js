"use strict";

const global_prefix = /%PREFIX%/g;

const global_class = /%CLASS%/g;

const interactor_h = `#import <Foundation/Foundation.h>
#import "%PREFIX%%CLASS%Interface.h"

NS_ASSUME_NONNULL_BEGIN

@interface %PREFIX%%CLASS%Interactor : NSObject <%PREFIX%%CLASS%InteractorInterface>

@property (nonatomic, strong) id<%PREFIX%%CLASS%PresenterInterface> presenter;

@end

NS_ASSUME_NONNULL_END`;

const interactor_m = `#import "%PREFIX%%CLASS%Interactor.h"

@implementation %PREFIX%%CLASS%Interactor

@end`;

let interactor_h_s = interactor_h.replace(global_prefix, "FR");
interactor_h_s = interactor_h_s.replace(global_class, "Person");
console.log(interactor_h_s);

let interactor_m_s = interactor_m.replace(global_prefix, "FR");
interactor_m_s = interactor_m_s.replace(global_class, "Person");
console.log(interactor_m_s);
