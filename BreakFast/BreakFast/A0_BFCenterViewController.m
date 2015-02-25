//
//  A0_BFCenterViewController.m
//  BreakFast
//
//  Created by admin on 15/2/15.
//  Copyright (c) 2015年 admin. All rights reserved.
//

#import "A0_BFCenterViewController.h"
#import "B0_BFCenterCell.h"
#import "B1_BFHomePageViewController.h"
#import "D1_BFShoppingCartViewController.h"

@interface A0_BFCenterViewController ()<NavCustomDelegate,UITableViewDelegate,UITableViewDataSource>
{
    NavCustom * customNav;
}

@property (nonatomic,strong) UITableView * table;
@property (nonatomic,strong) UIButton * buttonG;
@end


@implementation A0_BFCenterViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"美丽约";
    
    customNav = [[NavCustom alloc] init];
    customNav.NavDelegate = self;
    [customNav setNavLeftBtnImage:@"leftMenu" LeftBtnSelectedImage:@"" mySelf:self width:20 height:20];
    [customNav setNavRightBtnImage:@"message" RightBtnSelectedImage:@"" mySelf:self width:23 height:20];
    _table = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, phoneHeight)];
    _table.delegate =self;
    _table.dataSource = self;
    _table.separatorStyle = UITableViewCellSeparatorStyleNone;
    [self.view addSubview:_table];
    
    
    _buttonG = [UIButton buttonWithType:UIButtonTypeCustom];
    _buttonG.frame = CGRectMake(20, self.view.frame.size.height-64-80, 50, 50);
    [_buttonG addTarget:self action:@selector(onGou:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:_buttonG];
    [_buttonG setBackgroundImage:[UIImage imageNamed:@"gouwuche"] forState:UIControlStateNormal];
    [_buttonG bringSubviewToFront:self.view];
    
    
    // Do any additional setup after loading the view.
}

-(void)onGou:(id)sender
{
    D1_BFShoppingCartViewController * shopping =[[D1_BFShoppingCartViewController alloc] init];
    [self.navigationController pushViewController:shopping animated:YES];
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 10;
}

-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString * strCell = @"cell";
    B0_BFCenterCell * cell = [tableView dequeueReusableCellWithIdentifier:strCell];
    if(!cell)
    {
        cell = [[[NSBundle mainBundle] loadNibNamed:@"B0_BFCenterCell" owner:self options:nil]lastObject];
    }
    
    return cell;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 180;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    B0_BFCenterCell * cell = (B0_BFCenterCell*)[tableView cellForRowAtIndexPath:indexPath];
    cell.selected = NO;
    
    B1_BFHomePageViewController * home= [[B1_BFHomePageViewController alloc] init];
    [self.navigationController pushViewController:home animated:YES];
    
}

-(void)NavRightButtononClick
{
    [appDelegate showRight];
}

-(void)NavLeftButtononClick
{
//    [appDelegate toLogin:self];
    [appDelegate showLeft];
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
