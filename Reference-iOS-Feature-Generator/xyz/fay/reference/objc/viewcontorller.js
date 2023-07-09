"use strict";

const global_prefix = /%PREFIX%/g;

const global_class = /%CLASS%/g;

const view_controller_h = `#import <UIKit/UIKit.h>
#import "%PREFIX%%CLASS%Interface.h"

NS_ASSUME_NONNULL_BEGIN

@interface %PREFIX%%CLASS%ViewController : UIViewController <%PREFIX%%CLASS%ViewControllerInterface>

@property (nonatomic, strong) id<%PREFIX%%CLASS%InteractorInterface> interactor;

@end

NS_ASSUME_NONNULL_END`;

const view_controller_m = `#import "%PREFIX%%CLASS%ViewController.h"

@interface %PREFIX%%CLASS%ViewController ()

@end

@implementation %PREFIX%%CLASS%ViewController

#pragma mark - View Lifecycle

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

@end`;

let view_controller_h_s = view_controller_h.replace(global_prefix, "FR");
view_controller_h_s = view_controller_h_s.replace(global_class, "Person");
console.log(view_controller_h_s);

let view_controller_m_s = view_controller_m.replace(global_prefix, "FR");
view_controller_m_s = view_controller_m_s.replace(global_class, "Person");
console.log(view_controller_m_s);
