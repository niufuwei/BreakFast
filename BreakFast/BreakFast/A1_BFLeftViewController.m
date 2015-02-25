//
//  A1_BFLeftViewController.m
//  BreakFast
//
//  Created by admin on 15/2/15.
//  Copyright (c) 2015年 admin. All rights reserved.
//

#import "A1_BFLeftViewController.h"
#import "B1_BFLeftViewCell.h"
#import "B1_BFLeftCenterCell.h"

@interface A1_BFLeftViewController ()
{
    NSArray * dataArray;
}

@end

@implementation A1_BFLeftViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    _table= [[UITableView alloc] initWithFrame:CGRectMake(0, 0, 200, self.view.frame.size.height)];
    _table.delegate = self;
    _table.dataSource = self;
    _table.separatorStyle = UITableViewCellSeparatorStyleNone;
    [self.view addSubview:_table];
    
    dataArray = [[NSArray alloc] initWithObjects:@"我的消息",@"早餐日历",@"送餐记录",@"基本资料",@"账号安全",@"资格众筹",@"意见反馈",@"检查更新", nil];

    // Do any additional setup after loading the view.
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 2;
}

-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if(indexPath.section ==0)
    {
        static NSString * str=  @"cell";
        B1_BFLeftViewCell * cell = [tableView dequeueReusableCellWithIdentifier:str];
        if(!cell)
        {
            cell = [[[NSBundle mainBundle] loadNibNamed:@"B1_BFLeftViewCell" owner:self options:nil]lastObject];
        }
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        return cell;

    }
    else
    {
        static NSString * str=  @"cell11";
        B1_BFLeftCenterCell * cell = [tableView dequeueReusableCellWithIdentifier:str];
        if(!cell)
        {
            cell = [[[NSBundle mainBundle] loadNibNamed:@"B1_BFLeftCenterCell" owner:self options:nil]lastObject];
        }
        if(indexPath.row ==0)
        {
            cell.numberButton.hidden = NO;
            [cell.numberButton setTitle:@"10" forState:UIControlStateNormal];
        }
        else
        {
            cell.numberButton.hidden = YES;
        }
        cell.title.text = [dataArray objectAtIndex:indexPath.row];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        return cell;
    }
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if(section==0)
    {
        return 1;
    }
    else
    {
        return [dataArray count];
    }
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if(indexPath.section==0)
    {
        return 196;
    }
    return 50;
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
