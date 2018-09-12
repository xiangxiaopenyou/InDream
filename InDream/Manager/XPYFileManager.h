//
//  XPYFileManager.h
//  InDream
//
//  Created by 项小盆友 on 2018/9/11.
//  Copyright © 2018年 med-vision. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface XPYFileManager : NSObject
+ (NSFileManager *)fileManager;

/**
 路径是否存在
 */
+ (BOOL)isPathExist:(NSString *)path;

/**
 文件是否存在
 */
+ (BOOL)isFileExist:(NSString *)path;

/**
 文件夹是否存在
 */
+ (BOOL)isDirectoryExist:(NSString *)path;

/**
 移除文件
 */
+ (BOOL)removeFile:(NSString *)path;

/**
 创建目录
 */
+ (BOOL)createDirectoryAtPath:(NSString *)path;

/**
 文件个数
 */
+ (NSUInteger)fileCountInPath:(NSString *)path;

/**
 目录大小
 */
+ (unsigned long long)folderSizeAtPath:(NSString *)path;

@end
