//
//  XPYBaseRequest.m
//  InDream
//
//  Created by 项小盆友 on 2018/8/22.
//  Copyright © 2018年 med-vision. All rights reserved.
//

#import "XPYBaseRequest.h"
#import "XPYHTTPManager.h"

@implementation XPYBaseRequest
- (instancetype)init
{
    self = [super init];
    if (self) {
        self.params = [[NSMutableDictionary alloc] init];
        if ([[NSUserDefaults standardUserDefaults] stringForKey:USERTOKEN]) {
            NSString *token = [[NSUserDefaults standardUserDefaults] stringForKey:USERTOKEN];
            [self.params setObject:token forKey:@"token"];
        }
    }
    return self;
}
- (void)postRequest:(NSDictionary *)params requestURL:(NSString *)urlString request:(ParamsBlock)requestBlock result:(RequestResultHandler)handler
{
    if (!requestBlock(self)) {
        return;
    }
    if (params) {
        [self.params addEntriesFromDictionary:params];
    }
    [[XPYHTTPManager sharedManager] POST:urlString parameters:self.params progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        if ([responseObject[@"success"] boolValue]) {
            !handler ?: handler(responseObject[@"data"], nil);
        } else {
            !handler ?: handler(nil, responseObject[@"message"]);
        }
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        !handler ?: handler(nil, @"");
    }];
}

@end
