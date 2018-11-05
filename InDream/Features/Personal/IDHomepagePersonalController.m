//
//  IDHomepagePersonalController.m
//  InDream
//
//  Created by 项小盆友 on 2018/10/26.
//  Copyright © 2018年 med-vision. All rights reserved.
//

#import "IDHomepagePersonalController.h"
#import "IDPersonalHeaderView.h"
static CGFloat const kIDPersonalHeaderViewHeight = 260.f;

@interface IDHomepagePersonalController () <UITableViewDelegate, UITableViewDataSource>
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (nonatomic, strong) IDPersonalHeaderView *headerView;

@end

@implementation IDHomepagePersonalController
#pragma mark - Life cycle
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self setupViews];
}

#pragma mark - Setup
- (void)setupViews {
    self.navigationItem.title = nil;
    self.tableView.contentInset = (UIEdgeInsets){kIDPersonalHeaderViewHeight - 64, 0, 0, 0};
    [self.tableView addSubview:self.headerView];
}

#pragma mark - Scroll view delegate
- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    CGFloat offsetY = scrollView.contentOffset.y;
    if (offsetY < - kIDPersonalHeaderViewHeight) {
        self.headerView.frame = CGRectMake(0, offsetY, XPYScreenWidth, - offsetY);
    }
}

#pragma mark - Table view data source
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 3;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 3;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [UITableViewCell new];
    return cell;
}

#pragma mark - Table view delegate


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

@end
