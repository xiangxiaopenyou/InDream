//
//  IDMobileBindViewController.m
//  InDream
//
//  Created by 项小盆友 on 2018/8/27.
//  Copyright © 2018年 med-vision. All rights reserved.
//

#import "IDMobileBindViewController.h"
#import "IDBindCaptchaViewController.h"
#import "IDBindMobileViewModel.h"
#import <UIImage+YYWebImage.h>

@interface IDMobileBindViewController ()
@property (weak, nonatomic) IBOutlet UITextField *mobileTextField;
@property (weak, nonatomic) IBOutlet UIButton *sendButton;
@property (nonatomic, strong) IDBindMobileViewModel *viewModel;

@end

@implementation IDMobileBindViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self setupViews];
    [self bindViewModel];
}
- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    [self.mobileTextField becomeFirstResponder];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
#pragma mark - Setup
- (void)setupViews {
    [self.sendButton setBackgroundImage:[UIImage yy_imageWithColor:XPYColorWithHexStringAndAlpha(@"0d0606", 0.3)] forState:UIControlStateDisabled];
    [self.sendButton setBackgroundImage:[UIImage yy_imageWithColor:XPYColorWithHexStringAndAlpha(@"0d0606", 0.7)] forState:UIControlStateNormal];
}
- (void)bindViewModel {
    self.viewModel = [[IDBindMobileViewModel alloc] init];
    RAC(self.viewModel, mobile) = [RACSignal merge:@[RACObserve(self.mobileTextField, text), self.mobileTextField.rac_textSignal]];
    RAC(self.sendButton, enabled) = self.viewModel.validCaptchaSignal;
}

#pragma mark - Action
- (IBAction)sendAction:(id)sender {
    [[self.viewModel.captchaCommand execute:nil] subscribeCompleted:^{
        IDBindCaptchaViewController *bindCaptchaController = XPYViewControllerWithStoryboard(@"IDLogin", @"IDBindCaptcha");
        bindCaptchaController.mobileNumber = self.viewModel.mobile;
        [self.navigationController pushViewController:bindCaptchaController animated:YES];
    }];
//    [[[self.viewModel.captchaCommand execute:nil] doCompleted:^{
//    
//    }] doError:^(NSError *error) {
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
