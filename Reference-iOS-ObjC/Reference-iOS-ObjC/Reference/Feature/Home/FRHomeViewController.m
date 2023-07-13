//
//  FRHomeViewController.m
//  Reference-iOS-ObjC
//
//  Created by Fay on 2023/7/7.
//  Copyright © 2023 Fay. All rights reserved.
//

#import "FRHomeViewController.h"
#import "FRHelper.h"
#import "UIColor+FRColor.h"

@interface FRHomeViewController ()

@end

@implementation FRHomeViewController

#pragma mark - View Lifecycle

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = UIColor.themeColor;
    
    UIButton *button = [UIButton buttonWithType:UIButtonTypeSystem];
    button.frame = CGRectMake(100, 100, 100, 100);
    [button setTitle:@"BUTTON" forState:UIControlStateNormal];
    [button addTarget:self action:@selector(click:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button];
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    self.navigationController.navigationBar.hidden = YES;
}

- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
    self.navigationController.navigationBar.hidden = NO;
}

#pragma mark - Event Management

- (void)click:(UIButton *)button {
    [self.interactor fetchCityData];
}

#pragma mark - FRHomeViewControllerInterface Methods

- (void)showCityPageWithResponse:(FRGetCityResponse *)response {
    [FRHelper.sharedInstance.navigator navigateTo:FRDestinationCity navigationController:self.navigationController data:response.cities];
}

- (void)updateSubviewsWithResponse:(FRGetCityResponse * _Nonnull)response; {
    
}

@end
