//
//  B1_BFHomePageViewController.m
//  BreakFast
//
//  Created by admin on 15/2/17.
//  Copyright (c) 2015年 admin. All rights reserved.
//

#import "B1_BFHomePageViewController.h"
#import "B2_BFHomeView.h"

@interface B1_BFHomePageViewController ()
{
    UIScrollView * scrollview;
    UIView * BottomView;
}

@end

@implementation B1_BFHomePageViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"水蛋蛋";
    
    scrollview = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height)];
    [self.view addSubview:scrollview];
    
    UIImageView * image = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, 200)];
    [image setImage:[UIImage imageNamed:@"4.jpg"]];
    [scrollview addSubview:image];
    
    UIButton * zaodianyue = [UIButton buttonWithType:UIButtonTypeCustom];
//    [zaodianyue setTitle:@"早点约" forState:UIControlStateNormal];
//    [zaodianyue setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
//    [zaodianyue setBackgroundColor:[UIColor colorWithRed:255.0/255.0 green:255.0/255.0 blue:255.0/255.0 alpha:0.3]];
    [zaodianyue setBackgroundImage:[UIImage imageNamed:@"zaodianyue"] forState:UIControlStateNormal];
    zaodianyue.frame = CGRectMake(20, 150, 120, 40);
    [scrollview addSubview:zaodianyue];
    
    UIButton * shaodaishou = [UIButton buttonWithType:UIButtonTypeCustom];
//    [shaodaishou setTitle:@"捎带手" forState:UIControlStateNormal];
//    [shaodaishou setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
//    [shaodaishou setBackgroundColor:[UIColor colorWithRed:255.0/255.0 green:255.0/255.0 blue:255.0/255.0 alpha:0.3]];
    [shaodaishou setBackgroundImage:[UIImage imageNamed:@"shaodaishou"] forState:UIControlStateNormal];
    shaodaishou.frame = CGRectMake(self.view.frame.size.width-20-120, 150, 120, 40);
    [scrollview addSubview:shaodaishou];
    
    
    //名字
    UILabel * name = [[UILabel alloc] initWithFrame:CGRectMake(20, image.frame.size.height+image.frame.origin.y+10, self.view.frame.size.width-40, 20)];
    name.backgroundColor = [UIColor clearColor];
    name.font = [UIFont systemFontOfSize:13];
    name.textColor = [UIColor blackColor];
    name.textAlignment = NSTextAlignmentCenter;
    name.text = @"水蛋蛋";
    [scrollview addSubview:name];
    
    
    UIImageView * imageEga = [[UIImageView alloc] initWithFrame:CGRectMake(30, name.frame.size.height+name.frame.origin.y+13, 13, 13)];
    [imageEga setImage:[UIImage imageNamed:@"imageEga"]];
    [scrollview addSubview:imageEga];
    
    //年龄
    UILabel * ega = [[UILabel alloc] initWithFrame:CGRectMake(imageEga.frame.size.width+imageEga.frame.origin.x+3 , name.frame.size.height+name.frame.origin.y+10,50, 20)];
    ega.backgroundColor = [UIColor clearColor];
    ega.font = [UIFont systemFontOfSize:13];
    ega.textColor = [UIColor grayColor];
    ega.textAlignment = NSTextAlignmentLeft;
    ega.text = @"23岁";
    [scrollview addSubview:ega];
    
    
    UIImageView * imageShengri = [[UIImageView alloc] initWithFrame:CGRectMake(self.view.frame.size.width/2-20, name.frame.size.height+name.frame.origin.y+13, 13, 13)];
    [imageShengri setImage:[UIImage imageNamed:@"imageShengri"]];
    [scrollview addSubview:imageShengri];
    
    //生日
    UILabel * shengri = [[UILabel alloc] initWithFrame:CGRectMake(imageShengri.frame.size.width+imageShengri.frame.origin.x+3,  name.frame.size.height+name.frame.origin.y+10, 50, 20)];
    shengri.backgroundColor = [UIColor clearColor];
    shengri.font = [UIFont systemFontOfSize:13];
    shengri.textColor = [UIColor grayColor];
    shengri.textAlignment = NSTextAlignmentLeft;
    shengri.text = @"魔蝎座";
    [scrollview addSubview:shengri];
    
    UIImageView * imageZhiye = [[UIImageView alloc] initWithFrame:CGRectMake(self.view.frame.size.width-20-70, name.frame.size.height+name.frame.origin.y+13, 13, 13)];
    [imageZhiye setImage:[UIImage imageNamed:@"imageZhiye"]];
    [scrollview addSubview:imageZhiye];
    
    //职业
    UILabel * zhiye = [[UILabel alloc] initWithFrame:CGRectMake(imageZhiye.frame.size.width+imageZhiye.frame.origin.x+3, name.frame.size.height+name.frame.origin.y+10, 50, 20)];
    zhiye.backgroundColor = [UIColor clearColor];
    zhiye.font = [UIFont systemFontOfSize:13];
    zhiye.textColor = [UIColor grayColor];
    zhiye.textAlignment = NSTextAlignmentLeft;
    zhiye.text = @"学生";
    [scrollview addSubview:zhiye];
    
    UIImageView * imageHeng = [[UIImageView alloc] initWithFrame:CGRectMake(0, zhiye.frame.size.height+zhiye.frame.origin.y+15, self.view.frame.size.width, 1)];
    [imageHeng setBackgroundColor:[UIColor colorWithRed:0.0/255.0 green:0.0/255.0 blue:0.0/255.0 alpha:0.1]];
    [scrollview addSubview:imageHeng];
    
    
    B2_BFHomeView * homeXingqu = [[B2_BFHomeView alloc] initWithFrame:CGRectMake(0, imageHeng.frame.size.height+imageHeng.frame.origin.y, self.view.frame.size.width, 50)];
    NSArray * arr= [[NSArray alloc] initWithObjects:@"登山",@"游泳", nil];
    [homeXingqu viewForArray:arr type:100 height:^(NSInteger height) {
        CGRect hhh = homeXingqu.frame;
        hhh.size.height = height;
        homeXingqu.frame = hhh;
        
    }];
    [scrollview addSubview:homeXingqu];
    
    B2_BFHomeView * homeVideo = [[B2_BFHomeView alloc] initWithFrame:CGRectMake(0, homeXingqu.frame.size.height+homeXingqu.frame.origin.y, self.view.frame.size.width, 50)];
    NSArray * arr2= [[NSArray alloc] initWithObjects:@"肖申克的救赎",@"冷山",@"老男孩",@"费城往事",@"末路狂花", nil];
    [homeVideo viewForArray:arr2 type:200 height:^(NSInteger height) {
        CGRect hhh = homeVideo.frame;
        hhh.size.height = height;
        homeVideo.frame = hhh;
        
    }];
    [scrollview addSubview:homeVideo];
    
    B2_BFHomeView * homeReader = [[B2_BFHomeView alloc] initWithFrame:CGRectMake(0, homeVideo.frame.size.height+homeVideo.frame.origin.y, self.view.frame.size.width, 50)];
    NSArray * arr3= [[NSArray alloc] initWithObjects:@"深夜食堂", nil];
    [homeReader viewForArray:arr3 type:300 height:^(NSInteger height) {
        CGRect hhh = homeReader.frame;
        hhh.size.height = height;
        homeReader.frame = hhh;
        
    }];
    [scrollview addSubview:homeReader];
   
    
    //手机
    UILabel * tishi= [[UILabel alloc] initWithFrame:CGRectMake(0, homeReader.frame.size.height+homeReader.frame.origin.y+20, self.view.frame.size.width, 15)];
    tishi.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"ziliaobeijing.png"]];
    tishi.font = [UIFont systemFontOfSize:11];
    tishi.textColor = [UIColor whiteColor];
    tishi.textAlignment = NSTextAlignmentLeft;
    tishi.text = @"*姑娘的联系方式暂时对你保密，快送上一份爱心早餐给她，她或许就会对你开放哦~";
    [scrollview addSubview:tishi];

    
    [self getView:CGRectMake(0, tishi.frame.size.height+tishi.frame.origin.y, self.view.frame.size.width, 60) type:0 text:@"手机号码" aw:@""];
    
    [self getView:CGRectMake(0, tishi.frame.size.height+tishi.frame.origin.y+60, self.view.frame.size.width, 60) type:0 text:@"QQ" aw:@""];

    
    [self getView:CGRectMake(0, tishi.frame.size.height+tishi.frame.origin.y+120, self.view.frame.size.width, 60) type:0 text:@"微信号" aw:@""];

    scrollview.contentSize = CGSizeMake(self.view.frame.size.width, tishi.frame.size.height+tishi.frame.origin.y+240);

    [self popBottomView];
    
    [NSTimer scheduledTimerWithTimeInterval:3 target:self selector:@selector(onShow) userInfo:nil repeats:NO];    // Do any additional setup after loading the view.
}

-(UIView*)getView:(CGRect)rect type:(NSInteger)type text:(NSString *)text aw:(NSString*)aw
{
    UIView * view = [[UIView alloc] initWithFrame:rect];
    [scrollview addSubview:view];
    
    //手机
    UILabel * phone= [[UILabel alloc] initWithFrame:CGRectMake(20,10, 80, 40)];
    phone.backgroundColor = [UIColor clearColor];
    phone.font = [UIFont systemFontOfSize:17];
    phone.textColor = [UIColor grayColor];
    phone.textAlignment = NSTextAlignmentLeft;
    phone.text =text;
    [view addSubview:phone];

    
    if(type ==0)
    {
        //未开放
        UIImageView * icon = [[UIImageView alloc] initWithFrame:CGRectMake(phone.frame.size.width+phone.frame.origin.x+10, 45/2, 13, 15)];
        [icon setImage:[UIImage imageNamed:@"suo"]];
        [view addSubview:icon];
    }
    else
    {
        //手机
        UILabel * ask= [[UILabel alloc] initWithFrame:CGRectMake(phone.frame.size.width+phone.frame.origin.x+10,10, 80, 40)];
        ask.backgroundColor = [UIColor clearColor];
        ask.font = [UIFont systemFontOfSize:17];
        ask.textColor = [UIColor grayColor];
        ask.textAlignment = NSTextAlignmentLeft;
        ask.text =aw;
        [view addSubview:ask];

    }
    
    UIImageView * imageHeng = [[UIImageView alloc] initWithFrame:CGRectMake(0, 59, self.view.frame.size.width, 1)];
    [imageHeng setBackgroundColor:[UIColor colorWithRed:0.0/255.0 green:0.0/255.0 blue:0.0/255.0 alpha:0.1]];
    [view addSubview:imageHeng];
    
    return view;
    
}

-(void)onShow
{
    [UIView animateWithDuration:0.5 animations:^{
       
        CGRect yyy = BottomView.frame;
        yyy.origin.y = self.view.frame.size.height-80;
        BottomView.frame = yyy;
    }];
}

-(void)onHiden
{
    [UIView animateWithDuration:0.5 animations:^{
        
        CGRect yyy = BottomView.frame;
        yyy.origin.y = self.view.frame.size.height+150;
        BottomView.frame = yyy;
    }];
}

-(void)popBottomView{
    
    BottomView = [[UIView alloc] initWithFrame:CGRectMake(0, self.view.frame.size.height+150, self.view.frame.size.width, 80)];
    [BottomView setBackgroundColor:[UIColor colorWithRed:0.0/255.0 green:0.0/255.0 blue:0.0/255.0 alpha:0.3]];
    [self.view addSubview:BottomView];
    
    UILabel * tishi = [[UILabel alloc] initWithFrame:CGRectMake(20, 5, self.view.frame.size.width-40, 20)];
    tishi.textColor = [UIColor whiteColor];
    tishi.font = [UIFont systemFontOfSize:14];
    tishi.textAlignment = NSTextAlignmentCenter;
    tishi.text = @"将许文生给你点了一份早餐";
    [BottomView addSubview:tishi];
    
    
    UIButton * jieshou =[UIButton buttonWithType:UIButtonTypeCustom];
    [jieshou setBackgroundColor:[UIColor whiteColor]];
    jieshou.frame = CGRectMake(20, tishi.frame.size.height+tishi.frame.origin.y+10, 120, 40);
    [jieshou setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
    [jieshou setTitle:@"接受" forState:UIControlStateNormal];
    [jieshou addTarget:self action:@selector(onJSClick) forControlEvents:UIControlEventTouchUpInside];
    [BottomView addSubview:jieshou];

    
    UIButton * jujue =[UIButton buttonWithType:UIButtonTypeCustom];
    [jujue setBackgroundColor:[UIColor whiteColor]];
    jujue.frame = CGRectMake(self.view.frame.size.width-20-120, tishi.frame.size.height+tishi.frame.origin.y+10, 120, 40);
    [jujue setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
    [jujue setTitle:@"拒绝" forState:UIControlStateNormal];
    [jujue addTarget:self action:@selector(onJJClick) forControlEvents:UIControlEventTouchUpInside];
    [BottomView addSubview:jujue];
}

-(void)onJSClick
{
    [BFMethods alertMessage:@"您的接受请求，系统已通知到将许文生。"];
    [self onHiden];
}

-(void)onJJClick
{
    [BFMethods alertMessage:@"您的拒绝请求，系统已通知到将许文生。"];
    [self onHiden];
    
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
