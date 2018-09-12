//
//  IDCommunitySearchView.m
//  InDream
//
//  Created by 项小盆友 on 2018/9/11.
//  Copyright © 2018年 med-vision. All rights reserved.
//

#import "IDCommunitySearchView.h"
@interface IDCommunitySearchView ()
@property (nonatomic, strong) UIImageView *searchImage;
@property (nonatomic, strong) UILabel *searchLabel;
@end

@implementation IDCommunitySearchView
- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = XPYColorWithHexStringAndAlpha(@"1E4A53", 0.07);
        self.layer.masksToBounds = YES;
        self.layer.cornerRadius = 6.f;
        self.userInteractionEnabled = YES;
        [self addSubview:self.searchImage];
        [self addSubview:self.searchLabel];
        [self.searchImage mas_makeConstraints:^(MASConstraintMaker *make) {
            make.leading.equalTo(self.mas_leading).with.mas_offset(12);
            make.centerY.equalTo(self);
            make.size.mas_offset(CGSizeMake(20, 20));
        }];
        [self.searchLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.leading.equalTo(self.mas_leading).with.mas_offset(35);
            make.centerY.equalTo(self);
        }];
    }
    return self;
}
- (CGSize)intrinsicContentSize
{
    return CGSizeMake(XPYScreenWidth, 34);
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/
- (UIImageView *)searchImage {
    if (!_searchImage) {
        _searchImage = [[UIImageView alloc] init];
        _searchImage.image = [UIImage imageNamed:@""];
        _searchImage.backgroundColor = [UIColor redColor];
    }
    return _searchImage;
}
- (UILabel *)searchLabel {
    if (!_searchLabel) {
        _searchLabel = [[UILabel alloc] init];
        _searchLabel.text = @"---";
        _searchLabel.textColor = IDTintTextColor;
        _searchLabel.font = XPYSystemFontOfSize(13);
    }
    return _searchLabel;
}

@end
