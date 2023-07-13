//
//  FRCityViewController.m
//  Reference-iOS-ObjC
//
//  Created by Fay on 2023/7/7.
//  Copyright © 2023 Fay. All rights reserved.
//

#import "FRCityViewController.h"
#import "UIColor+FRTheme.h"
#import "FRHelper.h"

@interface FRCityViewController ()

@end

@implementation FRCityViewController

NSString * const identifier = @"identifier";

#pragma mark - View Lifecycle

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = UIColor.themeColor;
}

#pragma mark - UITableViewDataSource Methods

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.models.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
    }
    cell.textLabel.text = self.models[indexPath.row].name;
    return cell;
}

#pragma mark - UITableViewDelegate Methods

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
//    [FRHelper.sharedInstance.navigator navigateTo:FRDestinationHome navigationController:self.navigationController data:nil];
    NSLog(@"%@", self.models[indexPath.row].name);
}

@end
