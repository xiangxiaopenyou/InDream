//
//  IDSelectQuestionsCell.h
//  InDream
//
//  Created by 项小盆友 on 2018/9/4.
//  Copyright © 2018年 med-vision. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface IDSelectQuestionsCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UILabel *questionTitleLabel;
@property (weak, nonatomic) IBOutlet UILabel *questionDetailLabel;
@property (weak, nonatomic) IBOutlet UIImageView *questionImageView;
@property (weak, nonatomic) IBOutlet UILabel *commentNumberLabel;
@property (weak, nonatomic) IBOutlet UILabel *likeNumberLabel;

@end
