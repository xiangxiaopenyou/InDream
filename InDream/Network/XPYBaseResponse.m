//
//  XPYBaseResponse.m
//  InDream
//
//  Created by 项小盆友 on 2018/11/22.
//  Copyright © 2018年 med-vision. All rights reserved.
//

#import "XPYBaseResponse.h"

@implementation XPYBaseResponse
- (NSString *)description
{
    return [NSString stringWithFormat:@"状态码:%d\n错误:%@\n响应体:%@", self.statusCode, self.error, self.responseObject];
}
- (void)setError:(NSError *)error
{
    _error = error;
    self.statusCode = error.code;
    self.errorMessage = error.localizedDescription;
}

@end
