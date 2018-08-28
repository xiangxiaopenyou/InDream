//
//  IDBindMobileViewModel.h
//  InDream
//
//  Created by 项小盆友 on 2018/8/28.
//  Copyright © 2018年 med-vision. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface IDBindMobileViewModel : NSObject
//手机号
@property (nonatomic, copy) NSString *mobile;
//验证码按钮有效性
@property (nonatomic, strong) RACSignal *validCaptchaSignal;
//发送验证码命令
@property (nonatomic, strong) RACCommand *captchaCommand;
@end
