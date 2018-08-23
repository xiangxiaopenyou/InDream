//
//  XPYBaseModel.h
//  InDream
//
//  Created by 项小盆友 on 2018/8/22.
//  Copyright © 2018年 med-vision. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <YYModel.h>

@interface XPYBaseModel : NSObject <YYModel>
//json转换为model
+ (instancetype)modelWithJSON:(id)json;
//dictionary转换为model
+ (instancetype)modelWithDictionary:(NSDictionary *)dictionary;
//json-array转换为model数组
+ (NSArray *)modelArrayWithJSON:(id)json;

//将model转换为JSON对象
- (id)toJSONObject;
//将model转换为NSData
- (NSData *)toJSONData;
//将model转换为JSONString
- (NSString *)toJSONString;

@end
