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

#import "FRWeatherListItemCell.h"
#import "UIKit+FRExtension.h"
#import "UIKit+FRTheme.h"

NS_ASSUME_NONNULL_BEGIN

@interface FRWeatherListItemCellViewModel ()

@property (nonatomic, strong) NSString *title;
@property (nonatomic, strong) UIImage *image;
@property (nonatomic, strong) NSString *value;

@end

NS_ASSUME_NONNULL_END

#pragma mark -

@interface FRWeatherListItemCell ()

@property (nonatomic, strong) FRWeatherListItemCellViewModel *viewModel;

@property (nonatomic, strong) UIStackView *container;
@property (nonatomic, strong) UILabel *titleLabel;
@property (nonatomic, strong) UIView *imageContainer;
@property (nonatomic, strong) UIImageView *imageView;
@property (nonatomic, strong) UILabel *valueLabel;

@end

@implementation FRWeatherListItemCell

#pragma mark - UI Component

- (UIStackView *)container {
    if (!_container) {
        _container = [UIStackView makeWithSpacing:20];
    }
    return _container;
}

- (UILabel *)titleLabel {
    if (!_titleLabel) {
        _titleLabel = [UILabel makeWithText:_viewModel.title textAlignment:NSTextAlignmentCenter];
    }
    return _titleLabel;
}

- (UIView *)imageContainer {
    if (!_imageContainer) {
        _imageContainer = [UIView make];
    }
    return _imageContainer;
}

- (UIImageView *)imageView {
    if (!_imageView) {
        _imageView = [UIImageView makeWithImage:_viewModel.image];
    }
    return _imageView;
}

- (UILabel *)valueLabel {
    if (!_valueLabel) {
        _valueLabel = [UILabel makeWithText:_viewModel.value textAlignment:NSTextAlignmentCenter];
    }
    return _valueLabel;
}

#pragma mark - Lifecycle

+ (instancetype)cellWithViewModel:(FRWeatherListItemCellViewModel *)viewModel {
    FRWeatherListItemCell *cell = [[super alloc] init];
    cell.viewModel = viewModel;
    [cell setupSubviews];
    [cell setupLayouts];
    [cell updateStyling];
    return cell;
}

#pragma mark - Subview Management

- (void)setupSubviews {
    [self addSubview:self.container];
    [self.container addArrangedSubviews:@[self.titleLabel, self.imageContainer, self.valueLabel]];
    [self.imageContainer addSubview:self.imageView];
}

- (void)setupLayouts {
    [self.container edgeEqualToView:self];
    [self.container widthEqualToAnchor:self.widthAnchor];
    
    [self.imageView centerEqualToView:self.imageContainer];
    [self.imageView widthEqualToConstant:36];
    [self.imageView heightEqualToAnchor:self.imageView.widthAnchor];
}

- (void)updateStyling {
    self.titleLabel.textColor = [UIColor fontColor];
    self.valueLabel.textColor = [UIColor fontColor];
}

@end

#pragma mark - View Model

@implementation FRWeatherListItemCellViewModel

+ (instancetype)viewModelWithTitle:(NSString *)title
                             image:(UIImage *)image
                             value:(NSString *)value {
    FRWeatherListItemCellViewModel *viewModel = [[super alloc] init];
    viewModel.title = title;
    viewModel.image = image;
    viewModel.value = value;
    return viewModel;
}

@end
