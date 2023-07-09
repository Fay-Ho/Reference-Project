"use strict";

const global_prefix = /%PREFIX%/g;

const global_class = /%CLASS%/g;

const presenter_h = `#import <Foundation/Foundation.h>
#import "%PREFIX%%CLASS%Interface.h"

NS_ASSUME_NONNULL_BEGIN

@interface %PREFIX%%CLASS%Presenter : NSObject <%PREFIX%%CLASS%PresenterInterface>

@property (nonatomic, weak) id<%PREFIX%%CLASS%ViewControllerInterface> viewController;

@end

NS_ASSUME_NONNULL_END`;

const presenter_m = `#import "%PREFIX%%CLASS%Presenter.h"

@implementation %PREFIX%%CLASS%Presenter

@end`;

let presenter_h_s = presenter_h.replace(global_prefix, "FR");
presenter_h_s = presenter_h_s.replace(global_class, "Person");
console.log(presenter_h_s);

let presenter_m_s = presenter_m.replace(global_prefix, "FR");
presenter_m_s = presenter_m_s.replace(global_class, "Person");
console.log(presenter_m_s);
