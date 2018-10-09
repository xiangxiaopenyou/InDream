//
//  IDPersonalAdditionButton.m
//  InDream
//
//  Created by 项小盆友 on 2018/9/12.
//  Copyright © 2018年 med-vision. All rights reserved.
//

#import "IDPersonalAdditionButton.h"
@interface IDPersonalAdditionButton()
@property (nonatomic, strong) UILabel *itemQuantityLabel;
@property (nonatomic, strong) UILabel *itemNameLabel;
@end

@implementation IDPersonalAdditionButton
- (instancetype)init {
    self = [super init];
    if (self) {
        [self addSubview:self.itemQuantityLabel];
        [self addSubview:self.itemNameLabel];
        [self.itemQuantityLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerY.equalTo(self).with.mas_offset(- 10);
            make.centerX.equalTo(self);
        }];
        [self.itemNameLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self.itemQuantityLabel.mas_bottom).with.mas_offset(4);
            make.centerX.equalTo(self);
        }];
    }
    return self;
}
- (UIButtonType)buttonType {
    return UIButtonTypeCustom;
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/
- (UILabel *)itemQuantityLabel {
    if (!_itemQuantityLabel) {
        _itemQuantityLabel = [[UILabel alloc] init];
        _itemQuantityLabel.font = XPYFontOfSizeWithWeight(20, UIFontWeightMedium);
        _itemQuantityLabel.textColor = XPYColorWithHexString(@"5851D6");
    }
    return _itemQuantityLabel;
}
- (UILabel *)itemNameLabel {
    if (!_itemNameLabel) {
        _itemNameLabel = [[UILabel alloc] init];
        _itemNameLabel.font = XPYSystemFontOfSize(11);
        _itemNameLabel.textColor = IDTintTextColor;
    }
    return _itemNameLabel;
}
- (void)setItemNameString:(NSString *)itemNameString {
    if (itemNameString) {
        self.itemNameLabel.text = itemNameString;
    }
}
- (void)setQuantity:(NSInteger)quantity {
    if (quantity >= 0) {
        self.itemQuantityLabel.text = [NSString stringWithFormat:@"%@", @(quantity)];
    }
}

@end
