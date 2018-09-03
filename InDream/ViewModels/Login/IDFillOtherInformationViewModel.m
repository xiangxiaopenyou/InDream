//
//  IDFillOtherInformationViewModel.m
//  InDream
//
//  Created by 项小盆友 on 2018/8/31.
//  Copyright © 2018年 med-vision. All rights reserved.
//

#import "IDFillOtherInformationViewModel.h"

@implementation IDFillOtherInformationViewModel
- (instancetype)init
{
    self = [super init];
    if (self) {
        [self initialize];
    }
    return self;
}
- (void)initialize {
    self.validSubmitButtonSignal = [RACSignal combineLatest:@[RACObserve(self, profession), RACObserve(self, birthday)]
                                                     reduce:^(NSString *professionString, NSString *birthdayString){
                                                         return @(!XPYIsNullObject(professionString) || !XPYIsNullObject(birthdayString));
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
