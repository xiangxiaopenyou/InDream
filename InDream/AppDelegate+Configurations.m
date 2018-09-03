//
//  AppDelegate+Configure.m
//  InDream
//
//  Created by 项小盆友 on 2018/8/24.
//  Copyright © 2018年 med-vision. All rights reserved.
//

#import "AppDelegate+Configurations.h"
#import <IQKeyboardManager.h>
#import <UIImage+YYWebImage.h>

@implementation AppDelegate (Configurations)
- (void)initConfigurations:(UIApplication *)application options:(NSDictionary *)launchOptions {
    [[IQKeyboardManager sharedManager] setEnable:YES];
    [[IQKeyboardManager sharedManager] setEnableAutoToolbar:NO];
    [[IQKeyboardManager sharedManager] setShouldResignOnTouchOutside:YES];
    
    [[UINavigationBar appearance] setBackgroundImage:[UIImage yy_imageWithColor:[UIColor whiteColor]] forBarMetrics:UIBarMetricsDefault];
}

@end
