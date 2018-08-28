//
//  IDMainTabBarController.m
//  InDream
//
//  Created by 项小盆友 on 2018/8/27.
//  Copyright © 2018年 med-vision. All rights reserved.
//

#import "IDMainTabBarController.h"

@interface IDMainTabBarController ()

@end

@implementation IDMainTabBarController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self initChildViewController];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)initChildViewController {
    UIViewController *communityController = [[UIViewController alloc] init];
    communityController.title = XPYLocalizedString(@"tabbar_community");
    UIViewController *hypnoticController = [[UIViewController alloc] init];
    hypnoticController.title = XPYLocalizedString(@"tabbar_hypnotic");
    UIViewController *personalController = [[UIViewController alloc] init];
    personalController.title = XPYLocalizedString(@"tabbar_personal");
    self.viewControllers = @[communityController, hypnoticController, personalController];
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
