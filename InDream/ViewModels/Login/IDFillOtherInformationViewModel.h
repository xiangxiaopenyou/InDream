//
//  IDFillOtherInformationViewModel.h
//  InDream
//
//  Created by 项小盆友 on 2018/8/31.
//  Copyright © 2018年 med-vision. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface IDFillOtherInformationViewModel : NSObject
//职业
@property (nonatomic, copy) NSString *profession;
//生日
@property (nonatomic, copy) NSString *birthday;
//提交命令
@property (nonatomic, strong) RACCommand *submitCommand;
//提交按钮可点击信号
@property (nonatomic, strong) RACSignal *validSubmitButtonSignal;

@end
