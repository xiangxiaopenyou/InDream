//
//  IDFillOtherInformationViewController.m
//  InDream
//
//  Created by 项小盆友 on 2018/8/30.
//  Copyright © 2018年 med-vision. All rights reserved.
//

#import "IDFillOtherInformationViewController.h"
#import "IDFillOtherInformationViewModel.h"
#import <UIImage+YYWebImage.h>
#import <ActionSheetDatePicker.h>
#import <YYCategories/NSDate+YYAdd.h>

@interface IDFillOtherInformationViewController () <UITextFieldDelegate>
@property (weak, nonatomic) IBOutlet UITextField *professionTextField;
@property (weak, nonatomic) IBOutlet UIButton *birthdayButton;
@property (weak, nonatomic) IBOutlet UIButton *submitButton;

@property (nonatomic, copy) NSString *selectedDateString;
@property (nonatomic, strong) IDFillOtherInformationViewModel *viewModel;

@end

@implementation IDFillOtherInformationViewController

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
    [self.submitButton setBackgroundImage:[UIImage yy_imageWithColor:XPYColorWithHexStringAndAlpha(@"0d0606", 0.3)] forState:UIControlStateDisabled];
    [self.submitButton setBackgroundImage:[UIImage yy_imageWithColor:XPYColorWithHexStringAndAlpha(@"0d0606", 0.7)] forState:UIControlStateNormal];
}
- (void)bindViewModel {
    self.viewModel = [[IDFillOtherInformationViewModel alloc] init];
    RAC(self.viewModel, profession) = [RACSignal merge:@[RACObserve(self.professionTextField, text), self.professionTextField.rac_textSignal]];
    RAC(self.viewModel, birthday) = RACObserve(self, selectedDateString);
    RAC(self.submitButton, enabled) = self.viewModel.validSubmitButtonSignal;
}

#pragma mark - Action
- (IBAction)birthdayAction:(id)sender {
    [self.professionTextField resignFirstResponder];
    NSDate *minimumDate = [NSDate dateWithString:IDMinimumBirthDayDate format:@"yyyy-MM-dd"];
    NSDate *pickerSelectedDate = XPYIsNullObject(self.selectedDateString) ? [NSDate date] : [NSDate dateWithString:self.selectedDateString format:@"yyyy-MM-dd"];
    [ActionSheetDatePicker showPickerWithTitle:XPYLocalizedString(@"user_select_date")
                                datePickerMode:UIDatePickerModeDate
                                  selectedDate:pickerSelectedDate
                                   minimumDate:minimumDate
                                   maximumDate:[NSDate date]
                                     doneBlock:^(ActionSheetDatePicker *picker, id selectedDate, id origin) {
                                         self.selectedDateString = [(NSDate *)selectedDate stringWithFormat:@"yyyy-MM-dd"];
                                         [self.birthdayButton setTitle:self.selectedDateString forState:UIControlStateNormal];
                                     }
                                   cancelBlock:^(ActionSheetDatePicker *picker) {
                                       
                                   }
                                        origin:self.view];
}
- (IBAction)submitAction:(id)sender {
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
