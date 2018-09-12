//
//  IDUserManager.m
//  InDream
//
//  Created by 项小盆友 on 2018/9/11.
//  Copyright © 2018年 med-vision. All rights reserved.
//

#import "IDUserManager.h"
#import "XPYFileManager.h"
#import "IDUserModel.h"

@interface IDUserManager ()
@property (nonatomic, strong) IDUserModel *currentUser;
@end

@implementation IDUserManager
static NSString * const kIDUserDataFileName = @"id_user_data_file.data";
+ (instancetype)sharedInstance
{
    static IDUserManager *manager = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        manager = [[IDUserManager alloc] init];
    });
    return manager;
}

- (BOOL)saveUser:(IDUserModel *)user
{
    self.currentUser = user;
    BOOL saveStatus = [NSKeyedArchiver archiveRootObject:user toFile:IDFilePathFromInDreamDoc(kIDUserDataFileName)];
    NSLog(@"save status:%@", @(saveStatus));
    return saveStatus;
}
- (BOOL)removeUser:(IDUserModel *)user {
    self.currentUser = nil;
    BOOL removeStatus = [XPYFileManager removeFile:IDFilePathFromInDreamDoc(kIDUserDataFileName)];
    NSLog(@"remove status:%@", @(removeStatus));
    return removeStatus;
}
- (IDUserModel *)currentUser {
    if (!_currentUser) {
        _currentUser = [NSKeyedUnarchiver unarchiveObjectWithFile:IDFilePathFromInDreamDoc(kIDUserDataFileName)];
    }
    return _currentUser;
}


@end
