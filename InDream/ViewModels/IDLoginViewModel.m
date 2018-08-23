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
@end

@implementation IDLoginViewModel
- (instancetype)init
{
    self = [super init];
    if (self) {
        [self initializer];
    }
    return self;
}
- (void)initializer
{
    @weakify(self);
    self.validCaptchaSignal = [[RACSignal combineLatest:@[RACObserve(self, timer.valid), RACObserve(self, captcha)]
                                                 reduce:^(NSNumber *timerValid, NSString *captchaString) {
                                                     return @(!timerValid.boolValue && captchaString.length != 5);
                                                 }] distinctUntilChanged];
    self.captchaCommand = [[RACCommand alloc] initWithSignalBlock:^RACSignal *(id input) {
        @strongify(self);
        self.captchaTitle = @"发送中...";
        @weakify(self);
        return [[RACSignal createSignal:^RACDisposable *(id<RACSubscriber> subscriber) {
            [subscriber sendNext:nil];
            [subscriber sendCompleted];
            return [RACDisposable disposableWithBlock:^{
            }];
        }] doNext:^(id x) {
            @strongify(self);
            self.count = IDCaptchaFetchMaxtime;
            self.captchaTitle = @"60秒后重新发送";
            self.timer = [NSTimer timerWithTimeInterval:1 target:self selector:@selector(timerValueChanged:) userInfo:nil repeats:YES];
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
        self.captchaTitle = @"获取验证码";
        return;
    }
    self.captchaTitle = [NSString stringWithFormat:@"%@秒后重新发送", @(self.count)];
}

@end
