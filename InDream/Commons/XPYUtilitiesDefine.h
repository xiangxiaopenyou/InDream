//
//  XPYUtilitiesDefine.h
//  IMTest
//
//  Created by 项小盆友 on 2018/5/31.
//  Copyright © 2018年 项小盆友. All rights reserved.
//
#import "XPYUtilities.h"

/**
 屏幕宽度
 */
#define XPYScreenWidth CGRectGetWidth([UIScreen mainScreen].bounds)

/**
 屏幕高度
 */
#define XPYScreenHeight CGRectGetHeight([UIScreen mainScreen].bounds)

/**
 获取主窗口
 */
#define XPYKeyWindow [UIApplication sharedApplication].keyWindow

/**
 弱引用对象

 @param anObject  传入对象
 @return 弱引用对象
 */
#define XPYWeakObject(anObject) autoreleasepool{} __weak typeof(anObject) anObject##Weak = anObject

/**
 强引用对象

 @param anObject 传入对象
 @return 强引用对象
 */
#define XPYStrongObject(anObject) autoreleasepoo{} __strong typeof(anObject) anObject = anObject##Weak

/**
 通过storyboard初始化ViewController
 
 @param storyboardName storyboard名称
 @param controllerIdentifier viewControllerID
 @return viewController对象
 */
#define XPYViewControllerWithStoryboard(storyboardName, controllerIdentifier) [[UIStoryboard storyboardWithName:storyboardName bundle:nil] instantiateViewControllerWithIdentifier:controllerIdentifier]


/**
 获取本地化字符串

 @param aString key
 @return 字符串
 */
#define XPYLocalizedString(aString) NSLocalizedString(aString, nil)


/**
 带有透明度的RGB颜色

 @param r 红色数值
 @param g 绿色数值
 @param b 蓝色数值
 @param a 透明度数值
 @return UIColor
 */
#define XPYRGBColorWithAlpha(r, g, b, a) [UIColor colorWithRed:r/255.f green:g/255.f blue:b/255.f alpha:a]


/**
 透明度为1的RGB颜色
 @return UIColor
 */
#define XPYRGBColor(r, g, b) XPYRGBColorWithAlpha(r, g, b, 1)


/**
 十六进制颜色转RGB颜色（带透明度）

 @param aString 十六进制字符串
 @param aAlpha 透明度
 @return UIColor
 */
#define XPYColorWithHexStringAndAlpha(aString, aAlpha) [XPYUtilities colorWithHexString:aString alpha:aAlpha]


/**
 十六进制颜色转RGB颜色

 @param aString 十六进制字符串
 @return UIColor
 */
#define XPYColorWithHexString(aString) XPYColorWithHexStringAndAlpha(aString, 1)

/**
 系统字体

 @param aSize 字体大小
 @return UIFont
 */
#define XPYSystemFontOfSize(aSize) [UIFont systemFontOfSize:aSize]

/**
 系统加粗字体

 @param aSize 大小
 @return UIFont
 */
#define XPYBoldFontOfSize(aSize) [UIFont boldSystemFontOfSize:aSize]

/**
 加字重字体

 @param aSize 大小
 @param aWeight 字重
 @return UIFont
 */
#define XPYFontOfSizeWithWeight(aSize, aWeight) [UIFont systemFontOfSize:aSize weight:aWeight]

/**
 App DocumentDirectory文件夹路径
 */
#define XPYDocumentDirectory [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) lastObject]

/**
 判断空值

 @param anObject 传入值
 @return YES为空 NO非空
 */
#define XPYIsNullObject(anObject) [XPYUtilities isNullObject:anObject]

/**
 绘制带有圆角的图片

 @param aRadius 圆角弧度
 @param aSize 图片长宽
 @param anImage 原图片
 @return 目标图片
 */
#define XPYImageWithCornerRadius(aRadius, aSize, anImage) [XPYUtilities imageWithCornerRadius:aRadius size:aSize image:anImage]


/**
 判断是否正确的移动手机号

 @param aString 手机号字符串
 @return BOOL值
 */
#define XPYIsMobileNumber(aString) [XPYUtilities isMobileNumber:aString]
