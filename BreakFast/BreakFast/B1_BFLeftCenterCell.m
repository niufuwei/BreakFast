//
//  B1_BFLeftCenterCell.m
//  BreakFast
//
//  Created by admin on 15/2/15.
//  Copyright (c) 2015年 admin. All rights reserved.
//

#import "B1_BFLeftCenterCell.h"

@implementation B1_BFLeftCenterCell

- (void)awakeFromNib {
    
    _numberButton.layer.cornerRadius = 15;
    _numberButton.adjustsImageWhenDisabled = YES;
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
