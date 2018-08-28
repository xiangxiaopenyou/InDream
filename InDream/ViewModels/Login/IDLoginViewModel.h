//
//  IDLoginViewModel.h
//  InDream
//
//  Created by 项小盆友 on 2018/8/23.
//  Copyright © 2018年 med-vision. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface IDLoginViewModel : NSObject
//手机号
@property (nonatomic, copy) NSString *username;
//验证码
@property (nonatomic, copy) NSString *captcha;
//登录成功信号
@property (nonatomic, strong) RACSubject *successObject;
//登录失败信号
@property (nonatomic, strong) RACSubject *failureObject;
//网络错误信号
@property (nonatomic, strong) RACSubject *errorObject;
//验证码按钮有效性
@property (nonatomic, strong) RACSignal *validCaptchaSignal;
//验证码按钮显示
@property (nonatomic, copy) NSString *captchaTitle;
//登录按钮有效性
@property (nonatomic, strong) RACSignal *validLoginSignal;
//获取验证码命令
@property (nonatomic, strong) RACCommand *captchaCommand;
//登录命令
@property (nonatomic, strong) RACCommand *loginCommand;

@end
