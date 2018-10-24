//
//  UINavigationItem+XPYSwizzling.m
//  InDream
//
//  Created by 项小盆友 on 2018/10/22.
//  Copyright © 2018年 med-vision. All rights reserved.
//

#import "UINavigationItem+XPYSwizzling.h"
#import "NSObject+XPYSwizzling.h"

//static char kXPYCustomBackButtonKey;
@implementation UINavigationItem (XPYSwizzling)
//+ (void)load
//{
//    static dispatch_once_t onceToken;
//    dispatch_once(&onceToken, ^{
//        [self methodSwizzlingWithOriginalSelector:@selector(backBarButtonItem) swizzledSelector:@selector(xpy_backBarButtonItem)];
//    });
//}
//- (UIBarButtonItem *)xpy_backBarButtonItem
//{
//    UIBarButtonItem *backItem = [self xpy_backBarButtonItem];
//    if (backItem) {
//        return backItem;
//    }
//    backItem = objc_getAssociatedObject(self, &kXPYCustomBackButtonKey);
//    if (!backItem) {
//        backItem = [[UIBarButtonItem alloc] initWithTitle:@"" style:UIBarButtonItemStylePlain target:nil action:NULL];
//        objc_setAssociatedObject(self, &kXPYCustomBackButtonKey, backItem, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
//    }
//    return backItem;
//}
//- (void)dealloc
//{
//    objc_removeAssociatedObjects(self);
//}

@end
