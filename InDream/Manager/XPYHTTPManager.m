//
//  XPYHTTPManager.m
//  InDream
//
//  Created by 项小盆友 on 2018/8/22.
//  Copyright © 2018年 med-vision. All rights reserved.
//

#import "XPYHTTPManager.h"
static NSString * const kXPYBaseURL = @"";

@implementation XPYHTTPManager
+ (instancetype)sharedManager {
    static XPYHTTPManager *instance;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        instance = [[XPYHTTPManager alloc] initWithBaseURL:[NSURL URLWithString:kXPYBaseURL]];
        AFJSONRequestSerializer *requestSerializer = [AFJSONRequestSerializer serializer];
        [requestSerializer setValue:@"application/json" forHTTPHeaderField:@"Content-Type"];
        [requestSerializer setValue:@"application/json" forHTTPHeaderField:@"Accept"];
        [requestSerializer setHTTPShouldHandleCookies:YES];
        requestSerializer.timeoutInterval = 20;
        AFJSONResponseSerializer *responceSerializer = [AFJSONResponseSerializer serializer];
        NSMutableSet *types = [[responceSerializer acceptableContentTypes] mutableCopy];
        [types addObjectsFromArray:@[@"text/plain", @"text/html"]];
        responceSerializer.acceptableContentTypes = types;
        instance.requestSerializer = requestSerializer;
        instance.responseSerializer = responceSerializer;
        [NSURLSessionConfiguration defaultSessionConfiguration].HTTPMaximumConnectionsPerHost = 1;
    });
    return instance;
}


@end
