//
//  IDHomepagePersonalViewController.m
//  InDream
//
//  Created by 项小盆友 on 2018/9/10.
//  Copyright © 2018年 med-vision. All rights reserved.
//

#import "IDHomepagePersonalViewController.h"
#import "IDPersonalHeaderView.h"
#import "IDPersonalFunctionsCollectionViewCell.h"

//static NSInteger const kIDPersonalCollectionItemsNumber = 9;
#define kIDFunctionItemWidth (XPYScreenWidth - 40.f) / 3.f

static CGFloat const kIDPersonalHeaderViewHeight = 260.f;

@interface IDHomepagePersonalViewController () <UICollectionViewDelegateFlowLayout, UICollectionViewDelegate, UICollectionViewDataSource>
@property (weak, nonatomic) IBOutlet UICollectionView *collectionView;
@property (nonatomic, strong) IDPersonalHeaderView *headerView;

@property (nonatomic, copy) NSArray *functionsArray;
@end

@implementation IDHomepagePersonalViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self setupViews];
}

#pragma mark - Setup
- (void)setupViews {
    self.navigationItem.title = nil;
    self.collectionView.contentInset = UIEdgeInsetsMake(kIDPersonalHeaderViewHeight - 64, 0, 0, 0);
    [self.collectionView addSubview:self.headerView];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Scroll view delegate
- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    CGFloat offsetY = scrollView.contentOffset.y;
    NSLog(@"%@", @(offsetY));
    if (offsetY < - kIDPersonalHeaderViewHeight) {
        self.headerView.frame = CGRectMake(0, offsetY, XPYScreenWidth, - offsetY);
    }
}

#pragma mark - Collection view data source
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return self.functionsArray.count;
}
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    IDPersonalFunctionsCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"PersonalFunctionsCollectionViewCell" forIndexPath:indexPath];
    cell.functionNameLabel.text = self.functionsArray[indexPath.row];
    return cell;
}
#pragma mark - Collection view delegate

#pragma mark - Collection view delegate flow layout
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath {
    return (CGSize){kIDFunctionItemWidth, kIDFunctionItemWidth};
}
- (UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout insetForSectionAtIndex:(NSInteger)section {
    return (UIEdgeInsets){20, 20, 20, 20};
}
- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout minimumLineSpacingForSectionAtIndex:(NSInteger)section {
    return 0;
}
- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout minimumInteritemSpacingForSectionAtIndex:(NSInteger)section {
    return 0;
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/
#pragma mark - Getters
- (IDPersonalHeaderView *)headerView {
    if (!_headerView) {
        _headerView = [[IDPersonalHeaderView alloc] initWithFrame:CGRectMake(0, - kIDPersonalHeaderViewHeight, XPYScreenWidth, kIDPersonalHeaderViewHeight)];
    }
    return _headerView;
}
- (NSArray *)functionsArray {
    if (!_functionsArray) {
        _functionsArray = [NSArray arrayWithObjects:XPYLocalizedString(@"personal_function_creations"),
                                                    XPYLocalizedString(@"personal_function_messages"),
                                                    XPYLocalizedString(@"personal_function_evaluation"),
                                                    XPYLocalizedString(@"personal_function_browse_records"),
                                                    XPYLocalizedString(@"personal_function_collections"),
                                                    XPYLocalizedString(@"personal_function_device_binding"),
                                                    XPYLocalizedString(@"personal_function_mall"),
                                                    XPYLocalizedString(@"personal_function_settings"),
                                                    XPYLocalizedString(@"personal_function_feedback") ,
                                                    nil];
    }
    return _functionsArray;
}

@end
