//
//  FRCityViewController.m
//  Reference-iOS-ObjC
//
//  Created by Fay on 2023/7/7.
//  Copyright © 2023 Fay. All rights reserved.
//

#import "FRCityViewController.h"

@interface FRCityViewController ()

@end

@implementation FRCityViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor cyanColor];
    [self.interactor fetchData];
}

- (void)updateSubviewsWithResponse:(FRCityResponse * _Nonnull)response; {
    NSLog(@"%@", response.cities[0].name);
}

@end
