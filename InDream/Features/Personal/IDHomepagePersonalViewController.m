//
//  IDHomepagePersonalViewController.m
//  InDream
//
//  Created by 项小盆友 on 2018/9/10.
//  Copyright © 2018年 med-vision. All rights reserved.
//

#import "IDHomepagePersonalViewController.h"

@interface IDHomepagePersonalViewController () <UICollectionViewDelegateFlowLayout, UICollectionViewDelegate, UICollectionViewDataSource>
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (weak, nonatomic) IBOutlet UICollectionView *collectionView;

@end

@implementation IDHomepagePersonalViewController
static NSInteger const kIDPersonalCollectionItemsNumber = 9;

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self setupViews];
}

#pragma mark - Setup
- (void)setupViews {
    //self.tableView.contentInset = UIEdgeInsetsMake(- 20, 0, 0, 0);
    //self.tableView.tableHeaderView.frame = CGRectMake(0, - 64, XPYScreenWidth, 260);
    self.tableView.tableFooterView.frame = CGRectMake(0, 0, XPYScreenWidth, XPYScreenWidth);
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Collection view data source
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return kIDPersonalCollectionItemsNumber;
}
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    UICollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"PersonalCollectionCell" forIndexPath:indexPath];
    return cell;
}
#pragma mark - Collection view delegate

#pragma mark - Collection view delegate flow layout

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
