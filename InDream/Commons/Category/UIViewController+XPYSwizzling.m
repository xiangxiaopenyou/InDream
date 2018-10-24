//
//  UIViewController+XPYSwizzling.m
//  InDream
//
//  Created by 项小盆友 on 2018/10/23.
//  Copyright © 2018年 med-vision. All rights reserved.
//

#import "UIViewController+XPYSwizzling.h"
#import "NSObject+XPYSwizzling.h"

@implementation UIViewController (XPYSwizzling)
+ (void)load
{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        [self methodSwizzlingWithOriginalSelector:@selector(viewDidAppear:) swizzledSelector:@selector(xpy_viewDidAppear)];
    });
}
- (void)xpy_viewDidAppear
{
    self.navigationItem.backBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"" style:UIBarButtonItemStylePlain target:self action:nil];
    [self xpy_viewDidAppear];
}
@end
