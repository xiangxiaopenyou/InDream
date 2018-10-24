//
//  NSObject+XPYSwizzling.m
//  InDream
//
//  Created by 项小盆友 on 2018/10/22.
//  Copyright © 2018年 med-vision. All rights reserved.
//

#import "NSObject+XPYSwizzling.h"

@implementation NSObject (XPYSwizzling)
+ (void)methodSwizzlingWithOriginalSelector:(SEL)originalSelector swizzledSelector:(SEL)swizzledSelector
{
    Class class = [self class];
    //原方法
    Method originalMethod = class_getInstanceMethod(class, originalSelector);
    //新方法
    Method swizzledMethod = class_getInstanceMethod(class, swizzledSelector);
    //先尝试给源SEL添加IMP，为了避免SEL没有实现IMP的情况
    BOOL isAddedMethod = class_addMethod(class, originalSelector, method_getImplementation(swizzledMethod), method_getTypeEncoding(swizzledMethod));
    if (isAddedMethod) {    //添加成功：说明源SEL没有实现IMP，将源SEL的IMP替换到交换SEL的IMP
        class_replaceMethod(class, swizzledSelector, method_getImplementation(originalMethod), method_getTypeEncoding(originalMethod));
    } else {                //添加失败：说明源SEL已经有IMP，直接将两个SEL的IMP交换即可
        method_exchangeImplementations(originalMethod, swizzledMethod);
    }
}

@end
