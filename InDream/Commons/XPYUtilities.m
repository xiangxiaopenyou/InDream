//
//  XPYUtilities.m
//  IMTest
//
//  Created by 项小盆友 on 2018/5/31.
//  Copyright © 2018年 项小盆友. All rights reserved.
//

#import "XPYUtilities.h"

@implementation XPYUtilities
+ (BOOL)isNullObject:(id)object
{
    if (!object ||
        [object isEqual:@""] ||
        [object isEqual:[NSNull null]] ||
        [object isKindOfClass:[NSNull class]]) {
        return YES;
    }
    return NO;
}
+ (UIColor *)colorWithHexString:(NSString *)hexString alpha:(CGFloat)alpha
{
    NSString *tempString = [[hexString stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]] uppercaseString];
    if (tempString.length < 6) {
        return [UIColor clearColor];
    }
    //查询是否以"0x"或者"#"开头
    if ([tempString hasPrefix:@"0x"]) {
        tempString = [tempString substringFromIndex:2];
    }
    if ([tempString hasPrefix:@"#"]) {
        tempString = [tempString substringFromIndex:1];
    }
    if (tempString.length != 6) {
        return [UIColor clearColor];
    }
    NSRange range = NSMakeRange(0, 2);
    NSString *rString = [tempString substringWithRange:range];
    range.location = 2;
    NSString *gString = [tempString substringWithRange:range];
    range.location = 4;
    NSString *bString = [tempString substringWithRange:range];
    
    unsigned int r, g, b;
    [[NSScanner scannerWithString:rString] scanHexInt:&r];
    [[NSScanner scannerWithString:gString] scanHexInt:&g];
    [[NSScanner scannerWithString:bString] scanHexInt:&b];
    
    return [UIColor colorWithRed:((float) r / 255.0f) green:((float) g / 255.0f) blue:((float) b / 255.0f) alpha:alpha];
}
+ (UIImage *)imageWithCornerRadius:(CGFloat)radius size:(CGSize)size image:(UIImage *)originImage
{
    CGRect rect = CGRectMake(0, 0, size.width, size.height);
    UIGraphicsBeginImageContextWithOptions(size, NO, [UIScreen mainScreen].scale);
    CGContextRef contextRef = UIGraphicsGetCurrentContext();
    UIBezierPath *path = [UIBezierPath bezierPathWithRoundedRect:rect byRoundingCorners:UIRectCornerAllCorners cornerRadii:CGSizeMake(radius, radius)];
    CGContextAddPath(contextRef, path.CGPath);
    CGContextClip(contextRef);
    [originImage drawInRect:rect];
    CGContextDrawPath(contextRef, kCGPathFillStroke);
    UIImage *resultImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return resultImage;
}
+ (BOOL)isMobileNumber:(NSString *)mobileNumber
{
    NSString *target = @"^(0|86|17951)?(13[0-9]|15[012356789]|16[6]|19[89]]|17[01345678]|18[0-9]|14[579])[0-9]{8}$";
    NSPredicate *targetPredicate = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", target];
    if ([targetPredicate evaluateWithObject:mobileNumber]) {
        return YES;
    }
    return NO;
}

@end
