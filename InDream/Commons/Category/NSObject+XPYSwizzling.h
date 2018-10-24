//
//  NSObject+XPYSwizzling.h
//  InDream
//
//  Created by 项小盆友 on 2018/10/22.
//  Copyright © 2018年 med-vision. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <objc/runtime.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSObject (XPYSwizzling)
+ (void)methodSwizzlingWithOriginalSelector:(SEL)originalSelector swizzledSelector:(SEL)swizzledSelector;

@end

NS_ASSUME_NONNULL_END
