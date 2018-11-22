//
//  XPYBaseResponse.h
//  InDream
//
//  Created by 项小盆友 on 2018/11/22.
//  Copyright © 2018年 med-vision. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface XPYBaseResponse : NSObject
//错误
@property (nonatomic, strong) NSError *error;
//错误信息
@property (nonatomic, copy) NSString *errorMessage;
//状态码
@property (nonatomic, assign) NSInteger statusCode;
//响应体
@property (nonatomic, strong) id responseObject;

@end

NS_ASSUME_NONNULL_END
