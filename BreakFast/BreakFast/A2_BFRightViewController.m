//
//  A2_BFRightViewController.m
//  BreakFast
//
//  Created by admin on 15/2/15.
//  Copyright (c) 2015年 admin. All rights reserved.
//

#import "A2_BFRightViewController.h"
#import "B2_BFRightCell.h"
#import "B1_BFHomePageViewController.h"

@interface A2_BFRightViewController ()

@end

@implementation A2_BFRightViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    _table= [[UITableView alloc] initWithFrame:CGRectMake(0, 0, 100, self.view.frame.size.height)];
    _table.delegate = self;
    _table.dataSource = self;
    _table.separatorStyle = UITableViewCellSeparatorStyleNone;
    [self.view addSubview:_table];
    // Do any additional setup after loading the view.
}

-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString * str=  @"cell";
    B2_BFRightCell * cell = [tableView dequeueReusableCellWithIdentifier:str];
    if(!cell)
    {
        cell = [[B2_BFRightCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:str];
    }

    [cell.imageButton setBackgroundColor:[UIColor greenColor]];
    cell.imageButton.tag = indexPath.row +1;
    [cell.imageButton addTarget:self action:@selector(onClick:) forControlEvents:UIControlEventTouchUpInside];
    if(indexPath.row %3==0)
    {
        [cell.icon setBackgroundColor:[UIColor redColor]];
    }
    else
    {
        [cell.icon setBackgroundColor:[UIColor clearColor]];
    }
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    return cell;
}

-(void)onClick:(id)sender
{
//    UIButton * btn = (UIButton *)sender;
    B1_BFHomePageViewController * home = [[B1_BFHomePageViewController alloc] init];

    [appDelegate.menuController pushViewController:home animated:YES];
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 10;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 100;
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
