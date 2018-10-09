//
//  IDPhotoManager.h
//  InDream
//
//  Created by 项小盆友 on 2018/9/13.
//  Copyright © 2018年 med-vision. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface IDPhotoManager : NSObject
+ (instancetype)sharedInstance;
- (void)pickImage:(IDImagePickerSourceType)sourceType pickerType:(IDPickerImageType)pickerType viewController:(UIViewController *)controller;
@end
