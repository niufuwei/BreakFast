//
//  B2_BFHomeView.m
//  BreakFast
//
//  Created by admin on 15/2/18.
//  Copyright (c) 2015年 admin. All rights reserved.
//

#import "B2_BFHomeView.h"
#import <CoreText/CoreText.h>

@implementation B2_BFHomeView


-(void)viewForArray:(NSArray *)arr type:(NSInteger)type height:(void (^)(NSInteger))height
{
    _myBlock= height;
    NSString * ty;
    UIColor * color;
    if(type ==100)
    {
        ty = @"xingqu";
        color = UIColorFromRGB(0x73cab7);
    }
    else if(type==200)
    {
        ty = @"video";
        color = UIColorFromRGB(0x7e93cc);

    }
    else
    {
        ty = @"reader";
        color = UIColorFromRGB(0xf18903);

    }
    UIImageView * image = [[UIImageView alloc] initWithFrame:CGRectMake(10, 10, 30,30)];
    [image setImage:[UIImage imageNamed:[ty stringByAppendingString:@"Image"]]];
    [self addSubview:image];
    
    NSInteger xx = image.frame.size.width+image.frame.origin.x+20;
    NSInteger yy = 10;
    
    for(int i = 0;i<[arr count] ;i++)
    {
        UIButton * button = [UIButton buttonWithType:UIButtonTypeCustom];
        [button setBackgroundImage:[UIImage imageNamed:[ty stringByAppendingString:@"Button"]] forState:UIControlStateNormal];
        [button setTitle:[arr objectAtIndex:i] forState:UIControlStateNormal];
        button.titleLabel.font = [UIFont systemFontOfSize:13];
        [button setTitleColor:color forState:UIControlStateNormal];
        button.frame = CGRectMake(xx, 10, 40, 30);
        button.tag = i+1;
        
        NSDictionary *attribute = @{NSFontAttributeName: [UIFont systemFontOfSize:13]};
        CGSize size = [[arr objectAtIndex:i] boundingRectWithSize:CGSizeMake(MAXFLOAT, button.frame.size.height) options:NSStringDrawingTruncatesLastVisibleLine attributes:attribute context:nil].size;
        //根据计算结果重新设置UILabel的尺寸
        
        
        
        if(size.width > 40)
        {
            [button setFrame:CGRectMake(xx, yy, size.width+10, button.frame.size.height)];
            
        }
        else
        {
            [button setFrame:CGRectMake(xx, yy, size.width+10, button.frame.size.height)];

        }
        if(button.frame.size.width+button.frame.origin.x >self.frame.size.width-10)
        {
            xx =image.frame.size.width+image.frame.origin.x+20;
            yy = button.frame.size.height+button.frame.origin.y+10;
            [button setFrame:CGRectMake(xx, yy, size.width+10, button.frame.size.height)];

        }
        else
        {
        }

        xx = button.frame.size.width+button.frame.origin.x+10;

        [self addSubview:button];
    }
    
    _myBlock(yy+40);
    
    UIImageView * imageHeng = [[UIImageView alloc] initWithFrame:CGRectMake(0, yy+40, self.frame.size.width, 1)];
    [imageHeng setBackgroundColor:[UIColor colorWithRed:0.0/255.0 green:0.0/255.0 blue:0.0/255.0 alpha:0.1]];
    [self addSubview:imageHeng];

}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
