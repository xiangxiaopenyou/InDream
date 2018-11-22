//
//  XPYHTTPManager.h
//  InDream
//
//  Created by 项小盆友 on 2018/8/22.
//  Copyright © 2018年 med-vision. All rights reserved.
//

#import "AFHTTPSessionManager.h"
#import "XPYBaseResponse.h"

typedef void(^XPYResultHander)(XPYBaseResponse *response);

@interface XPYHTTPManager : AFHTTPSessionManager
+ (instancetype)sharedManager;

- (void)post:(NSString *)urlString parameters:(id)params completion:(XPYResultHander)result;

@end
