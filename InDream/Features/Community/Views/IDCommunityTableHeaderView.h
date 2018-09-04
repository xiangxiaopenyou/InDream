//
//  IDCommunityTableHeaderView.h
//  InDream
//
//  Created by 项小盆友 on 2018/9/4.
//  Copyright © 2018年 med-vision. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface IDCommunityTableHeaderView : UIView
@property (nonatomic, strong) UIImage *headerImage;
@property (nonatomic, copy) NSString *headerTitle;

- (instancetype)initWithFrame:(CGRect)frame image:(UIImage *)image title:(NSString *)title;

@end
