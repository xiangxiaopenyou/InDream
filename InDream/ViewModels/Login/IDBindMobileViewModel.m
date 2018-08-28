//
//  IDBindMobileViewModel.m
//  InDream
//
//  Created by 项小盆友 on 2018/8/28.
//  Copyright © 2018年 med-vision. All rights reserved.
//

#import "IDBindMobileViewModel.h"

@implementation IDBindMobileViewModel
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
    self.validCaptchaSignal = [RACObserve(self, mobile) map:^id(NSString *value) {
        return @(XPYIsMobileNumber(value));
    }];
    self.captchaCommand = [[RACCommand alloc] initWithSignalBlock:^RACSignal *(id input) {
        return [RACSignal createSignal:^RACDisposable *(id<RACSubscriber> subscriber) {
            [subscriber sendNext:nil];
            [subscriber sendCompleted];
            return [RACDisposable disposableWithBlock:^{
            }];
        }];
    }];
}
@end
