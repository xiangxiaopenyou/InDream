//
//  IDHotArticlesCell.h
//  InDream
//
//  Created by 项小盆友 on 2018/9/4.
//  Copyright © 2018年 med-vision. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface IDHotArticlesCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UILabel *articleTitleLabel;
@property (weak, nonatomic) IBOutlet UIImageView *articleImageView;
@property (weak, nonatomic) IBOutlet UILabel *commentNumberLabel;
@property (weak, nonatomic) IBOutlet UILabel *likeNumberLabel;

@end
