//
//  XPYBaseRequest.h
//  InDream
//
//  Created by 项小盆友 on 2018/8/22.
//  Copyright © 2018年 med-vision. All rights reserved.
//

#import <Foundation/Foundation.h>
typedef void (^RequestResultHandler)(id object, NSString *message);
typedef BOOL (^ParamsBlock)(id request);

@interface XPYBaseRequest : NSObject
@property (strong, nonatomic) NSMutableDictionary *params;
- (void)postRequest:(NSDictionary *)params requestURL:(NSString *)urlString request:(ParamsBlock)requestBlock result:(RequestResultHandler)handler;

@end
