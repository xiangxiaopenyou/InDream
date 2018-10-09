//
//  IDPhotoManager.m
//  InDream
//
//  Created by 项小盆友 on 2018/9/13.
//  Copyright © 2018年 med-vision. All rights reserved.
//

#import "IDPhotoManager.h"
#import <TZImagePickerController.h>
@interface IDPhotoManager () <UIImagePickerControllerDelegate, UINavigationControllerDelegate, TZImagePickerControllerDelegate>

@end

@implementation IDPhotoManager
+ (instancetype)sharedInstance
{
    static IDPhotoManager *instance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        instance = [[IDPhotoManager alloc] init];
    });
    return instance;
}
- (void)pickImage:(IDImagePickerSourceType)sourceType pickerType:(IDPickerImageType)pickerType viewController:(UIViewController *)controller
{
    if (pickerType == IDPickerImageTypeSingle) { //单选
        UIImagePickerController *pickerController = [[UIImagePickerController alloc] init];
        pickerController.delegate = self;
        pickerController.allowsEditing = YES;
        pickerController.sourceType = sourceType == IDImagePickerSourceTypeLibrary ? UIImagePickerControllerSourceTypePhotoLibrary : UIImagePickerControllerSourceTypeCamera;
        [controller presentViewController:pickerController animated:YES completion:nil];
    } else {                                     //多选
        TZImagePickerController *pickerController = [[TZImagePickerController alloc] initWithMaxImagesCount:IDPickImagesMaxAmount delegate:self];
        pickerController.allowPickingVideo = NO;
        [controller presentViewController:pickerController animated:YES completion:nil];
    }
}

#pragma mark - Image picker controller delegate
- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary<NSString *,id> *)info
{
    
}

- (void)imagePickerController:(TZImagePickerController *)picker didFinishPickingPhotos:(NSArray<UIImage *> *)photos sourceAssets:(NSArray *)assets isSelectOriginalPhoto:(BOOL)isSelectOriginalPhoto infos:(NSArray<NSDictionary *> *)infos {
    
}


@end
