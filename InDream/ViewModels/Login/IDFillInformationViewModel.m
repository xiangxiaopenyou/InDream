//
//  IDFillInformationViewModel.m
//  InDream
//
//  Created by 项小盆友 on 2018/8/30.
//  Copyright © 2018年 med-vision. All rights reserved.
//

#import "IDFillInformationViewModel.h"

@implementation IDFillInformationViewModel
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
    self.userModel = [[IDUserModel alloc] init];
    self.validSubmitButton = [RACSignal combineLatest:@[RACObserve(self.userModel, nickname), RACObserve(self.userModel, avatarString), RACObserve(self.userModel, gender)]
                                               reduce:^(NSString *nicknameString, NSString *avatarString, NSNumber *gender){
                                                   return @(!XPYIsNullObject(nicknameString) && !XPYIsNullObject(avatarString) && gender.integerValue != 0);
    }];
    self.submitCommand = [[RACCommand alloc] initWithSignalBlock:^RACSignal *(id input) {
        return [RACSignal createSignal:^RACDisposable *(id<RACSubscriber> subscriber) {
            [subscriber sendNext:nil];
            [subscriber sendCompleted];
            return [RACDisposable disposableWithBlock:^{
            }];
        }];
    }];
}

@end
