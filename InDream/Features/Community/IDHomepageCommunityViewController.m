//
//  IDHomepageCommunityViewController.m
//  InDream
//
//  Created by 项小盆友 on 2018/8/29.
//  Copyright © 2018年 med-vision. All rights reserved.
//

#import "IDHomepageCommunityViewController.h"

#define kIDTipLeadingWidth XPYScreenWidth / 4.f - 14.f
#define kIDTipChangedLeadingWidth 3 * XPYScreenWidth / 4.f - 14.f

@interface IDHomepageCommunityViewController ()
@property (weak, nonatomic) IBOutlet UIButton *recommendationButton;
@property (weak, nonatomic) IBOutlet UIButton *followingButton;
@property (weak, nonatomic) IBOutlet UIView *topSegView;
@property (nonatomic, strong) UIImageView *tipImageView;

@end

@implementation IDHomepageCommunityViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self initializeSlideView];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Setup
- (void)initializeSlideView {
    [self.topSegView addSubview:self.tipImageView];
    [self.tipImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.equalTo(self.topSegView.mas_bottom);
        make.size.mas_offset(CGSizeMake(28, 2));
        make.leading.equalTo(self.topSegView.mas_leading).with.mas_offset(kIDTipLeadingWidth);
    }];
}
#pragma mark - Action
- (IBAction)recommendationsAction:(id)sender {
}
- (IBAction)followingAction:(id)sender {
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/
#pragma mark - Getters
- (UIImageView *)tipImageView {
    if (!_tipImageView) {
        _tipImageView = [[UIImageView alloc] init];
        _tipImageView.backgroundColor = XPYColorWithHexString(@"oD0606");
    }
    return _tipImageView;
}
@end
