//
//  B2_BFRightCell.m
//  BreakFast
//
//  Created by admin on 15/2/15.
//  Copyright (c) 2015年 admin. All rights reserved.
//

#import "B2_BFRightCell.h"

@implementation B2_BFRightCell
-(id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    if(self=  [super initWithStyle:style reuseIdentifier:reuseIdentifier])
    {
        _imageButton = [UIButton buttonWithType:UIButtonTypeCustom];
        _imageButton.frame = CGRectMake(15, 15, 70, 70);
        _imageButton.layer.cornerRadius = 35;
        [self.contentView addSubview:_imageButton];
        
        _icon = [[UIImageView alloc] initWithFrame:CGRectMake(100-25, 17, 6, 6)];
        _icon.layer.cornerRadius = 3;
        [self.contentView addSubview:_icon];
    }
    return self;
}
- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
