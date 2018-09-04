//
//  IDCommunityTableHeaderView.m
//  InDream
//
//  Created by 项小盆友 on 2018/9/4.
//  Copyright © 2018年 med-vision. All rights reserved.
//

#import "IDCommunityTableHeaderView.h"
@interface IDCommunityTableHeaderView ()
@property (nonatomic, strong) UIImageView *headerImageView;
@property (nonatomic, strong) UILabel *headerLabel;
@property (nonatomic, strong) UIButton *moreButton;
@end

@implementation IDCommunityTableHeaderView
- (instancetype)initWithFrame:(CGRect)frame image:(UIImage *)image title:(NSString *)title
{
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor whiteColor];
        [self addSubview:self.headerImageView];
        [self addSubview:self.headerLabel];
        [self addSubview:self.moreButton];
        if (image) {
            self.headerImageView.image = image;
        }
        if (title) {
            self.headerLabel.text = title;
        }
    }
    return self;
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

#pragma mark - Action
- (void)moreAction:(UIButton *)button {
    
}

#pragma mark - Setters
- (void)setHeaderImage:(UIImage *)headerImage {
    if (headerImage) {
        self.headerImageView.image = headerImage;
    }
}
- (void)setHeaderTitle:(NSString *)headerTitle {
    if (headerTitle) {
        self.headerLabel.text = headerTitle;
    }
}

#pragma mark - Getters
- (UIImageView *)headerImageView
{
    if (!_headerImageView) {
        _headerImageView = [[UIImageView alloc] initWithFrame:CGRectMake(16, 20, 20, 30)];
    }
    return _headerImageView;
}
- (UILabel *)headerLabel
{
    if (!_headerLabel) {
        _headerLabel = [[UILabel alloc] initWithFrame:CGRectMake(38, 20, 150, 30)];
        _headerLabel.font = XPYFontOfSizeWithWeight(20, UIFontWeightMedium);
        _headerLabel.textColor = XPYColorWithHexString(@"171F24");
    }
    return _headerLabel;
}
- (UIButton *)moreButton
{
    if (!_moreButton) {
        _moreButton = [UIButton buttonWithType:UIButtonTypeCustom];
        _moreButton.frame = CGRectMake(CGRectGetWidth(self.bounds) - 100, 20, 100, 30);
        [_moreButton setTitle:XPYLocalizedString(@"community_more") forState:UIControlStateNormal];
        _moreButton.titleLabel.font = XPYSystemFontOfSize(11);
        [_moreButton setTitleColor:XPYColorWithHexString(@"999999") forState:UIControlStateNormal];
        [_moreButton addTarget:self action:@selector(moreAction:) forControlEvents:UIControlEventTouchUpInside];
        
    }
    return _moreButton;
}


@end
