//
//  IDBindCaptchaViewModel.m
//  InDream
//
//  Created by 项小盆友 on 2018/8/28.
//  Copyright © 2018年 med-vision. All rights reserved.
//

#import "IDBindCaptchaViewModel.h"
@interface IDBindCaptchaViewModel ()
@property (nonatomic, strong) NSTimer *timer;
@property (nonatomic, assign) NSUInteger count;
@property (nonatomic, assign) BOOL resendButtonValid;
@end

@implementation IDBindCaptchaViewModel
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
    self.resendTitle = XPYLocalizedString(@"login_resend_captcha");
    self.validResendSignal = [[RACObserve(self, resendButtonValid) map:^id(NSNumber *value) {
        return @(value.boolValue);
    }] distinctUntilChanged];
    @weakify(self);
    self.resendCommand = [[RACCommand alloc] initWithSignalBlock:^RACSignal *(id input) {
        @strongify(self);
        self.resendButtonValid = NO;
        self.resendTitle = XPYLocalizedString(@"login_sending");
        @weakify(self);
        return [[RACSignal createSignal:^RACDisposable *(id<RACSubscriber> subscriber) {
            [subscriber sendNext:nil];
            [subscriber sendCompleted];
            return [RACDisposable disposableWithBlock:^{
            }];
        }] doNext:^(id x) {
            @strongify(self);
            [self countStart];
        }];
    }];
    self.validSubmitSignal = [[RACObserve(self, captcha) map:^id(NSString *value) {
        return @(value.length == IDCaptchaLength);
    }] distinctUntilChanged];
    self.submitCommand = [[RACCommand alloc] initWithSignalBlock:^RACSignal *(id input) {
        return [RACSignal createSignal:^RACDisposable *(id<RACSubscriber> subscriber) {
            [subscriber sendNext:nil];
            [subscriber sendCompleted];
            return [RACDisposable disposableWithBlock:^{
            }];
        }];
    }];
    self.countStartCommand = [[RACCommand alloc] initWithSignalBlock:^RACSignal *(id input) {
        return [RACSignal createSignal:^RACDisposable *(id<RACSubscriber> subscriber) {
            //[subscriber sendNext:nil];
            @strongify(self);
            [self countStart];
            [subscriber sendCompleted];
            return [RACDisposable disposableWithBlock:^{
            }];
        }];
    }];
}
- (void)countStart
{
    self.count = IDCaptchaFetchMaxtime;
    self.resendButtonValid = NO;
    self.resendTitle = [NSString stringWithFormat:@"%@（%@s）", XPYLocalizedString(@"login_resend_captcha"), @(IDCaptchaFetchMaxtime)];
    self.timer = [NSTimer scheduledTimerWithTimeInterval:1 target:self selector:@selector(timerValueChanged:) userInfo:nil repeats:YES];
}
- (void)timerValueChanged:(NSTimer *)timer
{
    self.count --;
    if (self.count == 0) {
        [timer invalidate];
        timer = nil;
        self.resendButtonValid = YES;
        self.resendTitle = XPYLocalizedString(@"login_resend_captcha");
        return;
    }
    self.resendTitle = [NSString stringWithFormat:@"%@(%@)",XPYLocalizedString(@"login_resend_captcha"), @(self.count)];
}
@end
