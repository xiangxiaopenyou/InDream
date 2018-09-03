//
//  IDFillInformationViewController.m
//  InDream
//
//  Created by 项小盆友 on 2018/8/29.
//  Copyright © 2018年 med-vision. All rights reserved.
//

#import "IDFillInformationViewController.h"
#import "IDFillOtherInformationViewController.h"
#import "IDFillInformationViewModel.h"
#import <UIImage+YYWebImage.h>

@interface IDFillInformationViewController () <UITextFieldDelegate>
@property (weak, nonatomic) IBOutlet UIImageView *avatarImageView;
@property (weak, nonatomic) IBOutlet UITextField *nicknameTextField;
@property (weak, nonatomic) IBOutlet UIButton *genderMaleButton;
@property (weak, nonatomic) IBOutlet UIButton *genderFemaleButton;
@property (weak, nonatomic) IBOutlet UIButton *submitButton;

@property (nonatomic, strong) IDFillInformationViewModel *viewModel;

@end

@implementation IDFillInformationViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self setupViews];
    [self bindViewModel];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Setup
- (void)setupViews {
    [self.genderMaleButton setBackgroundImage:[UIImage yy_imageWithColor:XPYColorWithHexStringAndAlpha(@"0d0606", 0.3)] forState:UIControlStateNormal];
    [self.genderMaleButton setBackgroundImage:[UIImage yy_imageWithColor:XPYColorWithHexStringAndAlpha(@"0d0606", 0.7)] forState:UIControlStateSelected];
    [self.genderFemaleButton setBackgroundImage:[UIImage yy_imageWithColor:XPYColorWithHexStringAndAlpha(@"0d0606", 0.3)] forState:UIControlStateNormal];
    [self.genderFemaleButton setBackgroundImage:[UIImage yy_imageWithColor:XPYColorWithHexStringAndAlpha(@"0d0606", 0.7)] forState:UIControlStateSelected];
    [self.submitButton setBackgroundImage:[UIImage yy_imageWithColor:XPYColorWithHexStringAndAlpha(@"0d0606", 0.3)] forState:UIControlStateDisabled];
    [self.submitButton setBackgroundImage:[UIImage yy_imageWithColor:XPYColorWithHexStringAndAlpha(@"0d0606", 0.7)] forState:UIControlStateNormal];
    
    self.nicknameTextField.text = self.nicknameString;
    if (self.gender.integerValue == 1) {
        self.genderMaleButton.selected = YES;
    } else if (self.gender.integerValue == 2) {
        self.genderFemaleButton.selected = YES;
    }
}
- (void)bindViewModel {
    self.viewModel = [[IDFillInformationViewModel alloc] init];
    self.viewModel.userModel.avatarString = self.avatarString;
    self.viewModel.userModel.nickname = self.nicknameString;
    self.viewModel.userModel.gender = self.gender;
    RAC(self.viewModel.userModel, gender) = [[RACObserve(self, gender) map:^(NSNumber *value) {
        return value;
    }] distinctUntilChanged];
    RAC(self.viewModel.userModel, nickname) = [RACSignal merge:@[RACObserve(self.nicknameTextField, text), self.nicknameTextField.rac_textSignal]];
    RAC(self.viewModel.userModel, avatarString) = [[RACObserve(self, avatarString) map:^(NSString *value) {
        return value;
    }] distinctUntilChanged];
    RAC(self.submitButton, enabled) = self.viewModel.validSubmitButton;
}

#pragma mark - Action
- (IBAction)femaleButtonAction:(UIButton *)sender {
    if (sender.selected) {
        sender.selected = NO;
        self.gender = @0;
    } else {
        sender.selected = YES;
        self.genderMaleButton.selected = NO;
        self.gender = @2;
    }
}
- (IBAction)maleButtonAction:(UIButton *)sender {
    if (sender.selected) {
        sender.selected = NO;
        self.gender = @0;
    } else {
        sender.selected = YES;
        self.genderFemaleButton.selected = NO;
        self.gender = @1;
    }
}
- (IBAction)submitButtonAction:(id)sender {
    [[self.viewModel.submitCommand execute:nil] subscribeCompleted:^{
        IDFillOtherInformationViewController *otherController = XPYViewControllerWithStoryboard(@"IDLogin", @"IDFillOtherInformation");
        [self.navigationController pushViewController:otherController animated:YES];
    }];
}
- (IBAction)avatarTap:(id)sender {
    
}

#pragma mark - Text field delegate
- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    [textField resignFirstResponder];
    return YES;
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
