//
//  B1_LeftViewCell.m
//  BreakFast
//
//  Created by admin on 15/2/15.
//  Copyright (c) 2015年 admin. All rights reserved.
//

#import "B1_BFLeftViewCell.h"

@implementation B1_BFLeftViewCell

- (void)awakeFromNib {
    [_imageButton.layer setCornerRadius:35];
    _qianming.numberOfLines = 0;
    _qianming.lineBreakMode = NSLineBreakByWordWrapping;
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
