//
//  IDConstant.h
//  InDream
//
//  Created by 项小盆友 on 2018/8/23.
//  Copyright © 2018年 med-vision. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "XPYFileManager.h"

#pragma mark - 枚举
typedef NS_ENUM(NSInteger, IDPickerImageType) {
    IDPickerImageTypeSingle,
    IDPickerImageTypeMultiple
};
typedef NS_ENUM(NSInteger, IDImagePickerSourceType) {
    IDImagePickerSourceTypeLibrary,
    IDImagePickerSourceTypeCamera
};

#pragma mark - 应用相关
//微信key
extern NSString * const IDWeChatKey;
//获取微信用户信息接口key
extern NSString * const IDFetchWechatUserInfoKey;

//验证码发送时间
extern NSUInteger const IDCaptchaFetchMaxtime;
//验证码位数
extern NSUInteger const IDCaptchaLength;
//社区scrollView tag
extern NSUInteger const IDCommunityScrollViewTag;
//相册多选最大照片数量
extern NSUInteger const IDPickImagesMaxAmount;

#pragma mark - Notification key
extern NSString * const IDChangeRootControllerNotificationKey;

extern NSString * const IDMinimumBirthDayDate;

#pragma mark - Define
//主文字颜色
#define IDMainTextColor XPYColorWithHexString(@"333333")
//副文字颜色
#define IDSubTextColor XPYColorWithHexString(@"666666")
//文字浅色
#define IDTintTextColor XPYColorWithHexString(@"999999")

//创建一个文件夹
static inline void IDCreateDirectoryAtPath(NSString *path) {
    BOOL isDir = NO;
    BOOL isExist = [[XPYFileManager fileManager] fileExistsAtPath:path isDirectory:&isDir];
    if (isExist) {
        if (!isDir) {
            [XPYFileManager removeFile:path];
            [XPYFileManager createDirectoryAtPath:path];
        }
    } else {
        [XPYFileManager createDirectoryAtPath:path];
    }
}
//获取重要数据路径
static inline NSString *IDFilePathFromInDreamDoc(NSString *filename) {
    NSString *docPath = [XPYDocumentDirectory stringByAppendingPathComponent:filename];
    IDCreateDirectoryAtPath(docPath);
    return [docPath stringByAppendingPathComponent:filename];
}

