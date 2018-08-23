//
//  XPYBaseModel.m
//  InDream
//
//  Created by 项小盆友 on 2018/8/22.
//  Copyright © 2018年 med-vision. All rights reserved.
//

#import "XPYBaseModel.h"

@implementation XPYBaseModel
+ (instancetype)modelWithJSON:(id)json
{
    return [self yy_modelWithJSON:json];
}
+ (instancetype)modelWithDictionary:(NSDictionary *)dictionary
{
    return [self yy_modelWithDictionary:dictionary];
}
+ (NSArray *)modelArrayWithJSON:(id)json
{
    return [NSArray yy_modelArrayWithClass:[self class] json:json];
}

- (id)toJSONObject
{
    return [self yy_modelToJSONObject];
}
- (NSData *)toJSONData
{
    return [self yy_modelToJSONData];
}
- (NSString *)toJSONString
{
    return [self yy_modelToJSONString];
}

@end
