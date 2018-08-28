//
//  IDLoginViewController.m
//  InDream
//
//  Created by 项小盆友 on 2018/8/23.
//  Copyright © 2018年 med-vision. All rights reserved.
//

#import "IDLoginViewController.h"
#import "IDMobileBindViewController.h"
#import "IDLoginViewModel.h"
#import <OpenShare+Weixin.h>
@interface IDLoginViewController ()
@property (weak, nonatomic) IBOutlet UITextField *usernameTextField;
@property (weak, nonatomic) IBOutlet UITextField *captchaTextField;
@property (weak, nonatomic) IBOutlet UIButton *loginButton;
@property (weak, nonatomic) IBOutlet UIButton *captchaButton;
@property (weak, nonatomic) IBOutlet UIButton *wechatLoginButton;

@property (nonatomic, strong) IDLoginViewModel *loginViewModel;

@end

@implementation IDLoginViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self.captchaButton setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
    [self.captchaButton setTitleColor:[UIColor grayColor] forState:UIControlStateDisabled];
    [self bindViewModel];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Private methods
- (void)bindViewModel {
    self.loginViewModel = [[IDLoginViewModel alloc] init];
    RAC(self.loginViewModel, username) = [RACSignal merge:@[RACObserve(self.usernameTextField, text), self.usernameTextField.rac_textSignal]];
    RAC(self.captchaButton, enabled) = self.loginViewModel.validCaptchaSignal;
    @weakify(self);
    [[[RACObserve(self.loginViewModel, captchaTitle) distinctUntilChanged] deliverOnMainThread] subscribeNext:^(NSString *x) {
        @strongify(self);
        [self.captchaButton setTitle:x forState:UIControlStateNormal];
    }];
    RAC(self.loginViewModel, captcha) = [RACSignal merge:@[RACObserve(self.captchaTextField, text), self.captchaTextField.rac_textSignal]];
    RAC(self.loginButton, enabled) = self.loginViewModel.validLoginSignal;
    
}

#pragma mark - Action
- (IBAction)fetchCaptchaAction:(id)sender {
    [self.loginViewModel.captchaCommand execute:nil];
}
- (IBAction)commonLoginAction:(id)sender {
    [self.loginViewModel.loginCommand execute:nil];
}
- (IBAction)wechatLoginAction:(id)sender {
    IDMobileBindViewController *mobileBindController = XPYViewControllerWithStoryboard(@"IDLogin", @"IDMobileBind");
    UINavigationController *navigationController = [[UINavigationController alloc] initWithRootViewController:mobileBindController];
    [self presentViewController:navigationController animated:YES completion:nil];
//    [OpenShare WeixinAuth:IDFetchWechatUserInfoKey Success:^(NSDictionary *message) {
//
//    } Fail:^(NSDictionary *message, NSError *error) {
//
//    }];
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
