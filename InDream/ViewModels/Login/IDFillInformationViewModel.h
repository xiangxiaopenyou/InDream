//
//  IDFillInformationViewModel.h
//  InDream
//
//  Created by 项小盆友 on 2018/8/30.
//  Copyright © 2018年 med-vision. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "IDUserModel.h"

@interface IDFillInformationViewModel : NSObject
////昵称
//@property (nonatomic, copy) NSString *nickname;
////头像链接
//@property (nonatomic, copy) NSString *avatar;
////性别
//@property (nonatomic, strong) NSNumber *gender;
//用户信息Model
@property (nonatomic, strong) IDUserModel *userModel;
//下一步按钮可点击信号
@property (nonatomic, strong) RACSignal *validSubmitButton;
//下一步按钮点击命令
@property (nonatomic, strong) RACCommand *submitCommand;

@end
