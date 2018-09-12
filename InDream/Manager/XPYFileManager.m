//
//  XPYFileManager.m
//  InDream
//
//  Created by 项小盆友 on 2018/9/11.
//  Copyright © 2018年 med-vision. All rights reserved.
//

#import "XPYFileManager.h"

@implementation XPYFileManager
+ (NSFileManager *)fileManager
{
    return [NSFileManager defaultManager];
}
+ (BOOL)isPathExist:(NSString *)path
{
    return [[self fileManager] fileExistsAtPath:path];
}
+ (BOOL)isFileExist:(NSString *)path
{
    BOOL isDirectory;
    return [[self fileManager] fileExistsAtPath:path isDirectory:&isDirectory] && !isDirectory;
}
+ (BOOL)isDirectoryExist:(NSString *)path
{
    BOOL isDirectory;
    return [[self fileManager] fileExistsAtPath:path isDirectory:&isDirectory] && isDirectory;
}
+ (BOOL)removeFile:(NSString *)path
{
    return [[self fileManager] removeItemAtPath:path error:nil];
}
+ (BOOL)createDirectoryAtPath:(NSString *)path {
    return [[self fileManager] createDirectoryAtPath:path withIntermediateDirectories:YES attributes:nil error:nil];
}
+ (NSUInteger)fileCountInPath:(NSString *)path {
    NSUInteger count = 0;
    NSDirectoryEnumerator *fileEnumerator = [[self fileManager] enumeratorAtPath:path];
    for (__unused NSString *fileName in fileEnumerator) {
        count ++;
    }
    return count;
}
+ (unsigned long long)folderSizeAtPath:(NSString *)path {
    __block unsigned long long totalFileSize = 0;
    NSDirectoryEnumerator *fileEnumerator = [[self fileManager] enumeratorAtPath:path];
    for (NSString *filename in fileEnumerator) {
        NSString *filePath = [path stringByAppendingPathComponent:filename];
        NSDictionary *fileAttrs = [[self fileManager] attributesOfItemAtPath:filePath error:nil];
        totalFileSize += fileAttrs.fileSize;
    }
    return totalFileSize;
}

@end
