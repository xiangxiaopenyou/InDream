//
//  IDUserManager.h
//  InDream
//
//  Created by 项小盆友 on 2018/9/11.
//  Copyright © 2018年 med-vision. All rights reserved.
//

#import <Foundation/Foundation.h>
@class IDUserModel;

@interface IDUserManager : NSObject
+ (instancetype)sharedInstance;

- (BOOL)saveUser:(IDUserModel *)user;
- (BOOL)removeUser:(IDUserModel *)user;
- (IDUserModel *)currentUser;

@end
