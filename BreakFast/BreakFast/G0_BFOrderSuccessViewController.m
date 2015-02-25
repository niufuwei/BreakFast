//
//  G0_BFOrderSuccessViewController.m
//  BreakFast
//
//  Created by admin on 15/2/18.
//  Copyright (c) 2015年 admin. All rights reserved.
//

#import "G0_BFOrderSuccessViewController.h"

@interface G0_BFOrderSuccessViewController ()<NavCustomDelegate>
{
    UIScrollView * scrollview;
    NavCustom * custom;
}

@end

@implementation G0_BFOrderSuccessViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"付款成功";
    scrollview = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, phoneHeight)];
    [self.view addSubview:scrollview];
    
    UILabel * label = [[UILabel alloc] initWithFrame:CGRectMake(10, 20, 200, 20)];
    label.text = @"恭喜你 下单成功";
    label.textColor = [UIColor blackColor];
    label.font = [UIFont systemFontOfSize:17];
    [scrollview addSubview:label];
    
    UILabel * label2 = [[UILabel alloc] initWithFrame:CGRectMake(10, 50, self.view.frame.size.width-20, 40)];
    label2.text = @"您的订单已经通知到对方，相信对方会很快给您答复的哦，敬请期待吧~";
    label2.textColor = [UIColor grayColor];
    label2.font = [UIFont systemFontOfSize:15];
    label2.lineBreakMode = NSLineBreakByWordWrapping;
    label2.numberOfLines = 0;
    [scrollview addSubview:label2];
    
    custom = [[NavCustom alloc] init];
    custom.NavDelegate =self;
    [custom setNavRightBtnTitle:@"返回首页" mySelf:self width:80 height:20];
    // Do any additional setup after loading the view.
}

-(void)NavRightButtononClick
{
    [self.navigationController popToRootViewControllerAnimated:YES];
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
