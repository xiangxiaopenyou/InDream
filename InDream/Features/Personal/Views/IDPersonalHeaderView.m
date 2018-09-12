//
//  IDPersonalHeaderView.m
//  InDream
//
//  Created by 项小盆友 on 2018/9/12.
//  Copyright © 2018年 med-vision. All rights reserved.
//

#import "IDPersonalHeaderView.h"
#import "IDPersonalAdditionButton.h"
@interface IDPersonalHeaderView ()
@property (nonatomic, strong) UIImageView *backgroundImageView;
@property (nonatomic, strong) UIImageView *avatarImageView;
@property (nonatomic, strong) UILabel *nicknameLabel;
@property (nonatomic, strong) UIView *otherView;
@property (nonatomic, strong) UIImageView *otherBackgroundImageView;
@property (nonatomic, strong) IDPersonalAdditionButton *followersButton;
@property (nonatomic, strong) IDPersonalAdditionButton *attentionButton;
@property (nonatomic, strong) IDPersonalAdditionButton *pointsButton;
@end

@implementation IDPersonalHeaderView
- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self initializeSubviews];
    }
    return self;
}
- (void)initializeSubviews
{
    [self addSubview:self.backgroundImageView];
    [self.backgroundImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.leading.trailing.equalTo(self);
        make.bottom.equalTo(self.mas_bottom).with.mas_offset(- 34);
    }];
    
    [self addSubview:self.avatarImageView];
    [self.avatarImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self);
        make.centerY.equalTo(self).with.mas_offset(- 40);
    }];
    
    [self addSubview:self.nicknameLabel];
    [self.nicknameLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self);
        make.top.equalTo(self.avatarImageView.mas_bottom).with.mas_offset(8);
    }];
    
    [self addSubview:self.otherView];
    [self.otherView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.equalTo(self);
        make.centerX.equalTo(self);
        make.height.mas_offset(35.f);
        make.width.equalTo(self).multipliedBy(0.91);
    }];
    
    [self.otherView addSubview:self.otherBackgroundImageView];
    [self.otherBackgroundImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self.otherView).with.insets(UIEdgeInsetsMake(0, 0, 0, 0));
    }];
    
    [self.otherView addSubview:self.followersButton];
    [self.followersButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.bottom.leading.equalTo(self.otherView);
        make.width.equalTo(self.otherView).multipliedBy(1.0 / 3).with.mas_offset(- 1);
    }];
    
    UIImageView *line1 = [[UIImageView alloc] init];
    line1.backgroundColor = XPYColorWithHexString(@"D2D2D2");
    [self.otherView addSubview:line1];
    [line1 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.leading.equalTo(self.followersButton.mas_trailing);
        make.size.mas_offset(CGSizeMake(0.5, 18));
        make.centerY.equalTo(self.otherView);
    }];
    
    [self.otherView addSubview:self.attentionButton];
    [self.attentionButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.leading.equalTo(line1.mas_trailing);
        make.top.bottom.equalTo(self.otherView);
        make.width.equalTo(self.otherView).multipliedBy(1.0 / 3).with.mas_offset(- 1);
    }];
    
    UIImageView *line2 = [[UIImageView alloc] init];
    line2.backgroundColor = XPYColorWithHexString(@"D2D2D2");
    [self.otherView addSubview:line2];
    [line2 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.leading.equalTo(self.attentionButton.mas_trailing);
        make.size.mas_offset(CGSizeMake(0.5, 18));
        make.centerY.equalTo(self.otherView);
    }];
    
    [self.otherView addSubview:self.pointsButton];
    [self.pointsButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.leading.equalTo(line2.mas_trailing);
        make.bottom.top.trailing.equalTo(self.otherView);
    }];
}

- (UIImageView *)backgroundImageView
{
    if (!_backgroundImageView) {
        _backgroundImageView = [[UIImageView alloc] init];
        _backgroundImageView.contentMode = UIViewContentModeScaleAspectFill;
        _backgroundImageView.clipsToBounds = YES;
        _backgroundImageView.image = [UIImage new];
    }
    return _backgroundImageView;
}
- (UIImageView *)avatarImageView
{
    if (!_avatarImageView) {
        _avatarImageView = [[UIImageView alloc] init];
        _avatarImageView.layer.masksToBounds = YES;
        _avatarImageView.layer.cornerRadius = 8.f;
    }
    return _avatarImageView;
}
- (UILabel *)nicknameLabel
{
    if (!_nicknameLabel) {
        _nicknameLabel = [[UILabel alloc] init];
        _nicknameLabel.font = XPYFontOfSizeWithWeight(15, UIFontWeightMedium);
        _nicknameLabel.textColor = [UIColor colorWithWhite:1 alpha:0.87];
    }
    return _nicknameLabel;
}
- (UIView *)otherView
{
    if (!_otherView) {
        _otherView = [[UIView alloc] init];
        _otherView.backgroundColor = [UIColor clearColor];
    }
    return _otherView;
}
- (UIImageView *)otherBackgroundImageView
{
    if (!_otherBackgroundImageView) {
        _otherBackgroundImageView = [[UIImageView alloc] init];
    }
    return _otherBackgroundImageView;
}
- (IDPersonalAdditionButton *)followersButton
{
    if (!_followersButton) {
        _followersButton = [[IDPersonalAdditionButton alloc] init];
        _followersButton.itemNameString = XPYLocalizedString(@"personal_followers");
        _followersButton.quantity = 0;
    }
    return _followersButton;
}
- (IDPersonalAdditionButton *)attentionButton
{
    if (!_attentionButton) {
        _attentionButton = [[IDPersonalAdditionButton alloc] init];
        _attentionButton.itemNameString = XPYLocalizedString(@"personal_attention");
        _attentionButton.quantity = 0;
    }
    return _attentionButton;
}
- (IDPersonalAdditionButton *)pointsButton
{
    if (!_pointsButton) {
        _pointsButton = [[IDPersonalAdditionButton alloc] init];
        _pointsButton.itemNameString = XPYLocalizedString(@"personal_points");
        _pointsButton.quantity = 0;
    }
    return _pointsButton;
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
