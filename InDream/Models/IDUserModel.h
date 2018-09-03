//
//  IDUserModel.h
//  InDream
//
//  Created by 项小盆友 on 2018/8/30.
//  Copyright © 2018年 med-vision. All rights reserved.
//

#import "XPYBaseModel.h"

@interface IDUserModel : XPYBaseModel
//ID
@property (nonatomic, copy) NSString *userId;
//昵称
@property (nonatomic, copy) NSString *nickname;
//头像
@property (nonatomic, copy) NSString *avatarString;
//性别
@property (nonatomic, strong) NSNumber *gender;
//职业
@property (nonatomic, copy) NSString *profession;
//生日
@property (nonatomic, copy) NSString *birthday;

@end
