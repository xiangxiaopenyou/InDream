//
//  IDHomepageCommunityViewController.m
//  InDream
//
//  Created by 项小盆友 on 2018/8/29.
//  Copyright © 2018年 med-vision. All rights reserved.
//

#import "IDHomepageCommunityViewController.h"
#import "IDHotArticlesCell.h"
#import "IDSelectQuestionsCell.h"
#import "IDCommunityTableHeaderView.h"
#import "IDCommunityHeaderCollectionViewCell.h"
#import "IDCommunitySearchView.h"

#import <UIImage+YYWebImage.h>

#define kIDTipLeadingWidth XPYScreenWidth / 4.f - 14.f
#define kIDTipChangedLeadingWidth 3 * XPYScreenWidth / 4.f - 14.f
static CGFloat const kIDTableHeaderHeight = 50.f;
static CGFloat const kIDHotArticleCellHeight = 114.f;
static CGFloat const kIDSelectQuestionCellHeight = 130.f;

@interface IDHomepageCommunityViewController () <UITableViewDelegate, UITableViewDataSource, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout>
@property (weak, nonatomic) IBOutlet UIScrollView *mainScrollView;
@property (weak, nonatomic) IBOutlet UIButton *recommendationButton;
@property (weak, nonatomic) IBOutlet UIButton *followingButton;
@property (weak, nonatomic) IBOutlet UIView *topSegView;
@property (nonatomic, strong) UIImageView *tipImageView;
@property (nonatomic, strong) IDCommunitySearchView *searchView;

@end

@implementation IDHomepageCommunityViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self initializeSearchView];
    [self initializeSlideView];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Setup
- (void)initializeSearchView {
    self.navigationItem.titleView = self.searchView;
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(searchTap:)];
    [self.searchView addGestureRecognizer:tap];
}
- (void)initializeSlideView {
    [self.navigationController.navigationBar setShadowImage:[UIImage new]];
    [self.topSegView addSubview:self.tipImageView];
    [self.tipImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.equalTo(self.topSegView.mas_bottom);
        make.size.mas_offset(CGSizeMake(28, 2));
        make.leading.equalTo(self.topSegView.mas_leading).with.mas_offset(kIDTipLeadingWidth);
    }];
}
- (void)updateTipConstraints:(CGFloat)leading {
    [self.tipImageView mas_updateConstraints:^(MASConstraintMaker *make) {
        make.leading.equalTo(self.topSegView.mas_leading).with.mas_offset(leading);
    }];
    [UIView animateWithDuration:0.2 animations:^{
        [self.view layoutIfNeeded];
    }];
}

#pragma mark - Action
- (IBAction)recommendationsAction:(id)sender {
    if (!self.recommendationButton.selected) {
        self.recommendationButton.selected = YES;
        self.followingButton.selected = NO;
        [self updateTipConstraints:kIDTipLeadingWidth];
        [self.mainScrollView setContentOffset:CGPointMake(0, 0) animated:YES];
    }
}
- (IBAction)followingAction:(id)sender {
    if (!self.followingButton.selected) {
        self.followingButton.selected = YES;
        self.recommendationButton.selected = NO;
        [self updateTipConstraints:kIDTipChangedLeadingWidth];
        [self.mainScrollView setContentOffset:CGPointMake(XPYScreenWidth, 0) animated:YES];
    }
}
- (void)searchTap:(UITapGestureRecognizer *)recognizer {
    
}

#pragma mark - Table view data source
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 2;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return section == 0 ? 3 : 2;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.section == 0) {
        IDHotArticlesCell *cell = [tableView dequeueReusableCellWithIdentifier:@"HotArticlesCell" forIndexPath:indexPath];
        cell.articleImageView.image = XPYImageWithCornerRadius(4.f, cell.articleImageView.frame.size, [UIImage imageNamed:@"login_background"]);
        return cell;
    } else {
        IDSelectQuestionsCell *cell = [tableView dequeueReusableCellWithIdentifier:@"SelectQuestionsCell" forIndexPath:indexPath];
        cell.questionImageView.image = XPYImageWithCornerRadius(4.f, cell.questionImageView.frame.size, [UIImage imageNamed:@"login_background"]);
        return cell;
    }
}

#pragma mark - Table view delegate
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return indexPath.section == 0 ? kIDHotArticleCellHeight : kIDSelectQuestionCellHeight;
}
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    return kIDTableHeaderHeight;
}
- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    IDCommunityTableHeaderView *headerView = [[IDCommunityTableHeaderView alloc] initWithFrame:CGRectMake(0, 0, XPYScreenWidth, kIDTableHeaderHeight)
                                                                                         image:nil
                                                                                         title:nil];
    headerView.headerTitle = section == 0 ? XPYLocalizedString(@"community_hot_articles") : XPYLocalizedString(@"community_select_questions");
    return headerView;
}

#pragma mark - Scroll view delegate
- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    if (scrollView.tag == IDCommunityScrollViewTag) {
        CGFloat offsetX = scrollView.contentOffset.x;
        if (offsetX >= 0 && offsetX <= XPYScreenWidth) {
            [self.tipImageView mas_updateConstraints:^(MASConstraintMaker *make) {
                make.leading.equalTo(self.topSegView.mas_leading).with.mas_offset(kIDTipLeadingWidth + offsetX / 2.f);
            }];
        }
    }
}
- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView {
    CGFloat offsetX = scrollView.contentOffset.x;
    if (offsetX == 0) {
        [self recommendationsAction:self.recommendationButton];
    } else if (offsetX == XPYScreenWidth) {
        [self followingAction:self.followingButton];
    }
}
#pragma mark - Collection view data source
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return 10;
}
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    IDCommunityHeaderCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"CommunityHeaderCollectionViewCell" forIndexPath:indexPath];
    cell.topicImageView.image = XPYImageWithCornerRadius(4.f, cell.topicImageView.frame.size, [UIImage imageNamed:@"login_background"]);
    return cell;
}

#pragma mark - Collection view delegate

#pragma mark - Collection view flow layout
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath {
    return (CGSize){156.f, 96.f};
}
- (UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout insetForSectionAtIndex:(NSInteger)section {
    return (UIEdgeInsets){20.f, 16.f, 19.5, 16.f};
}
- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout minimumInteritemSpacingForSectionAtIndex:(NSInteger)section {
    return 8.f;
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
- (UIImageView *)tipImageView {
    if (!_tipImageView) {
        _tipImageView = [[UIImageView alloc] init];
        _tipImageView.backgroundColor = XPYColorWithHexString(@"OD0606");
    }
    return _tipImageView;
}
- (IDCommunitySearchView *)searchView {
    if (!_searchView) {
        _searchView = [[IDCommunitySearchView alloc] initWithFrame:CGRectMake(0, 0, XPYScreenWidth - 32, 34)];
    }
    return _searchView;
}
@end
