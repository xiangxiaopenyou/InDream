//
//  IDMainTabBarController.m
//  InDream
//
//  Created by 项小盆友 on 2018/8/27.
//  Copyright © 2018年 med-vision. All rights reserved.
//

#import "IDMainTabBarController.h"
#import "IDHomepageCommunityViewController.h"
#import "IDHomepagePersonalViewController.h"
#import "IDHomepagePersonalNavigationController.h"

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
    //社区
    IDHomepageCommunityViewController *communityController = XPYViewControllerWithStoryboard(@"IDCommunity", @"IDHomepageCommunity");
    communityController.title = XPYLocalizedString(@"tabbar_community");
    UINavigationController *communityNavigationController = [[UINavigationController alloc] initWithRootViewController:communityController];
    
    UIViewController *hypnoticController = [[UIViewController alloc] init];
    hypnoticController.title = XPYLocalizedString(@"tabbar_hypnotic");
    
    //我的
    IDHomepagePersonalViewController *personalController = XPYViewControllerWithStoryboard(@"IDPersonal", @"IDHomepagePersonal");
    personalController.title = XPYLocalizedString(@"tabbar_personal");
    IDHomepagePersonalNavigationController *personalNavigationController = [[IDHomepagePersonalNavigationController alloc] initWithRootViewController:personalController];
    self.viewControllers = @[communityNavigationController, hypnoticController, personalNavigationController];
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
