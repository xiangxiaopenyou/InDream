//
//  XPYUtilities.h
//  IMTest
//
//  Created by 项小盆友 on 2018/5/31.
//  Copyright © 2018年 项小盆友. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface XPYUtilities : NSObject
+ (BOOL)isNullObject:(id)object;
+ (UIColor *)colorWithHexString:(NSString *)hexString alpha:(CGFloat)alpha;
+ (UIImage *)imageWithCornerRadius:(CGFloat)radius size:(CGSize)size image:(UIImage *)originImage;
+ (BOOL)isMobileNumber:(NSString *)mobileNumber;
@end
