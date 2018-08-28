//
//  IDBindCaptchaViewModel.h
//  InDream
//
//  Created by 项小盆友 on 2018/8/28.
//  Copyright © 2018年 med-vision. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface IDBindCaptchaViewModel : NSObject
@property (nonatomic, copy) NSString *mobile;
@property (nonatomic, copy) NSString *captcha;
@property (nonatomic, copy) NSString *resendTitle;
@property (nonatomic, strong) RACSignal *validResendSignal;
@property (nonatomic, strong) RACSignal *validSubmitSignal;
@property (nonatomic, strong) RACCommand *resendCommand;
@property (nonatomic, strong) RACCommand *submitCommand;
@property (nonatomic, strong) RACCommand *countStartCommand;

@end
