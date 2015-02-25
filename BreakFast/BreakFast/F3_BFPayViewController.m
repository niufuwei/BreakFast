//
//  F3_BFPayViewController.m
//  BreakFast
//
//  Created by admin on 15/2/18.
//  Copyright (c) 2015年 admin. All rights reserved.
//

#import "F3_BFPayViewController.h"
#import "F4_BFPayCell.h"
#import "G0_BFOrderSuccessViewController.h"

@interface F3_BFPayViewController ()<UITableViewDataSource,UITableViewDelegate>
{
    UIScrollView * scrollview;
    NSMutableDictionary * selectType;
    UITableView * table;
}

@end

@implementation F3_BFPayViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"付款";
    
    scrollview = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, phoneHeight)];
    [self.view addSubview:scrollview];
    
    selectType = [[NSMutableDictionary alloc]init];
    
    UILabel * label = [[UILabel alloc] initWithFrame:CGRectMake(10, 20, 100, 20)];
    label.text = @"赠送人";
    label.textColor = [UIColor blackColor];
    label.font = [UIFont systemFontOfSize:14];
    [scrollview addSubview:label];
    
    
    UILabel * nameLabel = [[UILabel alloc] initWithFrame:CGRectMake(10, label.frame.size.height+label.frame.origin.y+5, self.view.frame.size.width-20, 20)];
    nameLabel.text = @"小猫猫";
    nameLabel.textColor = [UIColor blackColor];
    nameLabel.font = [UIFont systemFontOfSize:17];
    [scrollview addSubview:nameLabel];
    
    UILabel * kaquan = [[UILabel alloc] initWithFrame:CGRectMake(10, nameLabel.frame.size.height+nameLabel.frame.origin.y+25, self.view.frame.size.width-20, 20)];
    kaquan.text = @"您有3张早餐券可以使用";
    kaquan.textColor = [UIColor blackColor];
    kaquan.font = [UIFont systemFontOfSize:17];
    [scrollview addSubview:kaquan];
    
    table = [[UITableView alloc] initWithFrame:CGRectMake(0, kaquan.frame.size.height+kaquan.frame.origin.y,self.view.frame.size.width, 3*44)];
    table.dataSource = self;
    table.delegate = self;
    [scrollview addSubview:table];
    
    [self loadBottomView];
    // Do any additional setup after loading the view.
}

-(void)loadBottomView
{
    UIView * view = [[UIView alloc] initWithFrame:CGRectMake(0, self.view.frame.size.height-64-60, self.view.frame.size.width, 60)];
    [view setBackgroundColor:[UIColor colorWithRed:0.0/255.0 green:0.0/255.0 blue:0.0/255.0 alpha:0.3]];
    [scrollview addSubview:view];
    
    UILabel * tishi = [[UILabel alloc] initWithFrame:CGRectMake(20, 10, 180, 20)];
    tishi.textColor = [UIColor whiteColor];
    tishi.font = [UIFont systemFontOfSize:14];
    tishi.text = @"*小礼物会在48小时内送达";
    [view addSubview:tishi];
    
    UILabel * price = [[UILabel alloc] initWithFrame:CGRectMake(20, tishi.frame.size.height+tishi.frame.origin.y+5, 100, 20)];
    price.textColor = [UIColor whiteColor];
    price.font = [UIFont systemFontOfSize:14];
    price.text = @"价格：159元";
    [view addSubview:price];
    
    UIButton * goPay =[UIButton buttonWithType:UIButtonTypeCustom];
    [goPay setBackgroundColor:[UIColor whiteColor]];
    goPay.frame = CGRectMake(self.view.frame.size.width-100, 10, 80, 40);
    [goPay setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
    [goPay setTitle:@"去付款" forState:UIControlStateNormal];
    [goPay addTarget:self action:@selector(onSuccessClick:) forControlEvents:UIControlEventTouchUpInside];
    [view addSubview:goPay];
    
    scrollview.contentSize = CGSizeMake(self.view.frame.size.width, phoneHeight+1);
    
}

-(void)onSuccessClick:(id)sender
{
    G0_BFOrderSuccessViewController * success = [[G0_BFOrderSuccessViewController alloc] init];
    [self.navigationController pushViewController:success animated:YES];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 3;
}

// Row display. Implementers should *always* try to reuse cells by setting each cell's reuseIdentifier and querying for available reusable cells with dequeueReusableCellWithIdentifier:
// Cell gets various attributes set automatically based on table (separators) and data source (accessory views, editing controls)

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString * strID = @"cell";
    F4_BFPayCell * payCell = [table dequeueReusableCellWithIdentifier:strID];
    if(!payCell)
    {
        payCell = [[[NSBundle mainBundle] loadNibNamed:@"F4_BFPayCell" owner:self options:nil] lastObject];
    }
    
    payCell.selectButton.tag = indexPath.row+1;
    [payCell.selectButton addTarget:self action:@selector(onClick:) forControlEvents:UIControlEventTouchUpInside];
    
    if([[selectType objectForKey:[NSString stringWithFormat:@"%d",indexPath.row+1]] isEqualToString:@"yes"])
    {
        [payCell.selectButton setBackgroundImage:[UIImage imageNamed:@"selected"] forState:UIControlStateNormal];
    }
    else
    {
        [payCell.selectButton setBackgroundImage:[UIImage imageNamed:@"noselect"] forState:UIControlStateNormal];

    }
    
    payCell.selectionStyle = UITableViewCellSelectionStyleNone;
    return payCell;
}

-(void)onClick:(id)sender
{
    UIButton * btn = (UIButton*)sender;
    F4_BFPayCell * payCell = (F4_BFPayCell*)[table cellForRowAtIndexPath:[NSIndexPath indexPathForRow:btn.tag-1 inSection:0]];
    
    if(![selectType objectForKey:[NSString stringWithFormat:@"%d",btn.tag
                                 ]])
    {
        [payCell.selectButton setBackgroundImage:[UIImage imageNamed:@"selected"] forState:UIControlStateNormal];
        [selectType setObject:@"yes" forKey:[NSString stringWithFormat:@"%d",btn.tag
                                             ]];

    }
    else if([[selectType objectForKey:[NSString stringWithFormat:@"%d",btn.tag
                                  ]] isEqualToString:@"yes"])
    {
        [payCell.selectButton setBackgroundImage:[UIImage imageNamed:@"noselect"] forState:UIControlStateNormal];
        [selectType setObject:@"no" forKey:[NSString stringWithFormat:@"%d",btn.tag
                                            ]];

    }
    else
    {
        [payCell.selectButton setBackgroundImage:[UIImage imageNamed:@"selected"] forState:UIControlStateNormal];
        [selectType setObject:@"yes" forKey:[NSString stringWithFormat:@"%d",btn.tag
                                            ]];

    }
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
