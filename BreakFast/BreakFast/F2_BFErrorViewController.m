//
//  F2_BFErrorViewController.m
//  BreakFast
//
//  Created by admin on 15/2/18.
//  Copyright (c) 2015年 admin. All rights reserved.
//

#import "F2_BFErrorViewController.h"

@interface F2_BFErrorViewController ()
{
    UIScrollView * scrollview;
}

@end

@implementation F2_BFErrorViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"交易失败";
    scrollview = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, phoneHeight)];
    [self.view addSubview:scrollview];
    
    UILabel * label = [[UILabel alloc] initWithFrame:CGRectMake(10, 20, 100, 20)];
    label.text = @"很抱歉";
    label.textColor = [UIColor blackColor];
    label.font = [UIFont systemFontOfSize:17];
    [scrollview addSubview:label];
    
    UILabel * label2 = [[UILabel alloc] initWithFrame:CGRectMake(10, 50, self.view.frame.size.width-20, 40)];
    label2.text = @"小猫猫的所在地暂时无法配送，您可以提醒她发起众筹。";
    label2.textColor = [UIColor grayColor];
    label2.font = [UIFont systemFontOfSize:15];
    label2.lineBreakMode = NSLineBreakByWordWrapping;
    label2.numberOfLines = 0;
    [scrollview addSubview:label2];
    
    
    UIButton * button = [UIButton buttonWithType:UIButtonTypeCustom];
    [button setTitle:@"提醒她" forState:UIControlStateNormal];
    [button setTitleColor: [UIColor whiteColor] forState:UIControlStateNormal];
    [button setBackgroundColor:[UIColor grayColor]];
    button.frame = CGRectMake(20, label2.frame.size.height+label2.frame.origin.y+20, self.view.frame.size.width-40, 40);
    [button addTarget: self action:@selector(onClick) forControlEvents:UIControlEventTouchUpInside];
    [scrollview addSubview:button];
    
    scrollview.contentSize  =CGSizeMake(self.view.frame.size.width, phoneHeight+1);
    // Do any additional setup after loading the view.
}

-(void)onClick
{
    [BFMethods alertMessage:@"提醒成功"];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
