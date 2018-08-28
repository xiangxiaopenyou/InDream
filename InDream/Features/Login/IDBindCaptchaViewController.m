//
//  IDBindCaptchaViewController.m
//  InDream
//
//  Created by 项小盆友 on 2018/8/28.
//  Copyright © 2018年 med-vision. All rights reserved.
//

#import "IDBindCaptchaViewController.h"
#import "IDBindCaptchaViewModel.h"
#import <UIImage+YYWebImage.h>

@interface IDBindCaptchaViewController ()
@property (weak, nonatomic) IBOutlet UILabel *mobileNumberLabel;
@property (weak, nonatomic) IBOutlet UITextField *captchaTextField;
@property (weak, nonatomic) IBOutlet UIButton *submitButton;
@property (weak, nonatomic) IBOutlet UIButton *resendButton;

@property (nonatomic, strong) IDBindCaptchaViewModel *viewModel;

@end

@implementation IDBindCaptchaViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self.resendButton setBackgroundImage:[UIImage yy_imageWithColor:XPYColorWithHexStringAndAlpha(@"0d0606", 0.3)] forState:UIControlStateDisabled];
    [self.resendButton setBackgroundImage:[UIImage yy_imageWithColor:XPYColorWithHexStringAndAlpha(@"0d0606", 0.7)] forState:UIControlStateNormal];
    [self.submitButton setBackgroundImage:[UIImage yy_imageWithColor:XPYColorWithHexStringAndAlpha(@"0d0606", 0.3)] forState:UIControlStateDisabled];
    [self.submitButton setBackgroundImage:[UIImage yy_imageWithColor:XPYColorWithHexStringAndAlpha(@"0d0606", 0.7)] forState:UIControlStateNormal];
    self.mobileNumberLabel.text = [NSString stringWithFormat:@"输入%@收到的%@位验证码", self.mobileNumber, @(IDCaptchaLength)];
    
    [self bindViewModel];
}
- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    [self.captchaTextField becomeFirstResponder];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
#pragma mark - Private methods
- (void)bindViewModel {
    self.viewModel = [[IDBindCaptchaViewModel alloc] init];
    self.viewModel.mobile = self.mobileNumber;
    RAC(self.viewModel, captcha) = [RACSignal merge:@[RACObserve(self.captchaTextField, text), self.captchaTextField.rac_textSignal]];
    RAC(self.resendButton, enabled) = self.viewModel.validResendSignal;
    RAC(self.submitButton, enabled) = self.viewModel.validSubmitSignal;
    @weakify(self);
    [[[RACObserve(self.viewModel, resendTitle) distinctUntilChanged] deliverOnMainThread] subscribeNext:^(NSString *x) {
        @strongify(self);
        [self.resendButton setTitle:x forState:UIControlStateNormal];
    }];
    [self.viewModel.countStartCommand execute:nil];
}
#pragma mark - Action
- (IBAction)resendAction:(id)sender {
    [self.viewModel.resendCommand execute:nil];
}
- (IBAction)submitAction:(id)sender {
    [self.viewModel.submitCommand execute:nil];
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
