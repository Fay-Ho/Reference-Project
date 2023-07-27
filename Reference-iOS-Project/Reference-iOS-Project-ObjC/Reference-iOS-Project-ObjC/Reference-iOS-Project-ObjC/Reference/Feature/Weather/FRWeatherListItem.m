//
//  MIT License
//
//  Copyright (c) 2023 Fay-Ho
//
//  Permission is hereby granted, free of charge, to any person obtaining a copy
//  of this software and associated documentation files (the "Software"), to deal
//  in the Software without restriction, including without limitation the rights
//  to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
//  copies of the Software, and to permit persons to whom the Software is
//  furnished to do so, subject to the following conditions:
//
//  The above copyright notice and this permission notice shall be included in all
//  copies or substantial portions of the Software.
//
//  THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
//  IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
//  FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
//  AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
//  LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
//  OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
//  SOFTWARE.
//

#import "FRWeatherListItem.h"
#import "UIKit+FRExtension.h"
#import "UIKit+FRTheme.h"
#import "NSArray+FRExtension.h"
#import "FRWeatherListItemCell.h"

@interface FRWeatherListItem ()

@property (nonatomic, strong) UIScrollView *root;
@property (nonatomic, strong) UIStackView *container;

@end

@implementation FRWeatherListItem

#pragma mark - UI Component

- (UIScrollView *)root {
    if (!_root) {
        _root = [UIScrollView make];
        _root.layer.cornerRadius = 10;
        _root.layer.masksToBounds = YES;
        _root.contentSize = CGSizeMake(_root.width, 0);
        _root.showsHorizontalScrollIndicator = NO;
    }
    return _root;
}

- (UIStackView *)container {
    if (!_container) {
        _container = [UIStackView makeWithSpacing:10 axis:UILayoutConstraintAxisHorizontal];
    }
    return _container;
}

#pragma mark - Lifecycle

+ (instancetype)item {
    FRWeatherListItem *item = [[self alloc] init];
    [item setupSubviews];
    [item setupLayouts];
    [item updateStyling];
    return item;
}

#pragma mark - Subview Management

- (void)setupSubviews {
    [self addSubview:self.root];
    [self.root addSubview:self.container];
}

- (void)setupLayouts {
    [self.root topEqualToAnchor:self.topAnchor constant:16];
    [self.root bottomEqualToAnchor:self.bottomAnchor];
    [self.root horizontalEqualToView:self constant:16];
    
    [self.container edgeEqualToView:self.root];
    [self.container heightEqualToAnchor:self.root.heightAnchor];
}

- (void)updateStyling {
    self.root.backgroundColor = [UIColor itemColor];
}

- (void)updateWithDataModel:(NSArray<FRWeatherListItemDataModel *> *)dataModel {
    NSArray<FRWeatherListItemCell *> *cells = [dataModel map:^id _Nonnull (FRWeatherListItemDataModel * _Nonnull element) {
        FRWeatherListItemCellViewModel *viewModel = [FRWeatherListItemCellViewModel viewModelWithTitle:element.time
                                                                                                 image:element.image
                                                                                                 value:element.weather];
        FRWeatherListItemCell *cell = [FRWeatherListItemCell cellWithViewModel:viewModel];
        return cell;
    }];
    [self.container addArrangedSubviews:cells];
}

@end
