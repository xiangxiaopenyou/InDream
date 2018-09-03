//
//  IDLoginViewModel.m
//  InDream
//
//  Created by 项小盆友 on 2018/8/23.
//  Copyright © 2018年 med-vision. All rights reserved.
//

#import "IDLoginViewModel.h"
@interface IDLoginViewModel ()
@property (nonatomic, strong) NSTimer *timer;
@property (nonatomic, assign) NSUInteger count;
@property (nonatomic, assign) BOOL captchaButtonValid;
@end

@implementation IDLoginViewModel
- (instancetype)init
{
    self = [super init];
    if (self) {
        [self initialize];
    }
    return self;
}
- (void)initialize
{
    @weakify(self);
    self.captchaTitle = XPYLocalizedString(@"login_captcha");
    RAC(self, captchaButtonValid) = [[RACObserve(self, timer.valid) map:^id(NSNumber * value) {
        return @(!value.boolValue);
    }] distinctUntilChanged];
    self.validCaptchaSignal = [[RACSignal combineLatest:@[RACObserve(self, captchaButtonValid), RACObserve(self, username)]
                                                 reduce:^(NSNumber *valid, NSString *usernameString) {
                                                     return @([valid boolValue] && XPYIsMobileNumber(usernameString));
                                                 }] distinctUntilChanged];
    self.captchaCommand = [[RACCommand alloc] initWithSignalBlock:^RACSignal *(id input) {
        @strongify(self);
        self.captchaButtonValid = NO;
        self.captchaTitle = XPYLocalizedString(@"login_sending");
        @weakify(self);
        return [[RACSignal createSignal:^RACDisposable *(id<RACSubscriber> subscriber) {
            [subscriber sendNext:nil];
            [subscriber sendCompleted];
            return [RACDisposable disposableWithBlock:^{
            }];
        }] doNext:^(id x) {
            @strongify(self);
            self.count = IDCaptchaFetchMaxtime;
            self.captchaTitle = [NSString stringWithFormat:@"%@秒", @(IDCaptchaFetchMaxtime)];
            self.timer = [NSTimer scheduledTimerWithTimeInterval:1 target:self selector:@selector(timerValueChanged:) userInfo:nil repeats:YES];
            
        }];
    }];
    
    self.validLoginSignal = [[RACSignal combineLatest:@[RACObserve(self, username), RACObserve(self, captcha)]
                                               reduce:^id(NSString *usernameString, NSString *captchaString){
                                                   return @(XPYIsMobileNumber(usernameString) && captchaString.length == IDCaptchaLength);
                                               }] distinctUntilChanged];
    self.loginCommand = [[RACCommand alloc] initWithSignalBlock:^RACSignal *(id input) {
        return [RACSignal createSignal:^RACDisposable *(id<RACSubscriber> subscriber) {
            [subscriber sendNext:nil];
            [subscriber sendCompleted];
            return [RACDisposable disposableWithBlock:^{
            }];
        }];
    }];
    
    
    _successObject = [RACSubject subject];
    _failureObject = [RACSubject subject];
    _errorObject = [RACSubject subject];
}

- (void)timerValueChanged:(NSTimer *)timer {
    self.count --;
    if (self.count == 0) {
        [timer invalidate];
        timer = nil;
        self.captchaButtonValid = YES;
        self.captchaTitle = XPYLocalizedString(@"login_captcha");
        return;
    }
    self.captchaTitle = [NSString stringWithFormat:@"%@秒", @(self.count)];
}

@end
