//
//  D1_BFShoppingCartViewController.m
//  BreakFast
//
//  Created by admin on 15/2/18.
//  Copyright (c) 2015年 admin. All rights reserved.
//

#import "D1_BFShoppingCartViewController.h"
#import "F1_BFShoppingCell.h"
#import "F2_BFErrorViewController.h"
#import "F3_BFPayViewController.h"

@interface D1_BFShoppingCartViewController ()<UITableViewDataSource,UITableViewDelegate>
{
    NSMutableArray * dataArray;
}
@property (nonatomic,strong) UITableView * table;
@end

@implementation D1_BFShoppingCartViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"购物车";
    
    dataArray = [[NSMutableArray alloc] initWithObjects:@"1",@"1",@"1",@"1",@"1",@"1",@"1",@"1",@"1",@"1", nil];
    
    [appDelegate.menuController.leftViewController removeFromParentViewController];
    [appDelegate.menuController.rightViewController removeFromParentViewController];
    
    UILabel * label = [[UILabel alloc] initWithFrame:CGRectMake(10, 10, self.view.frame.size.width-20, 20)];
    label.backgroundColor = [UIColor clearColor];
    label.text = @"   订购产品                    价格                 个数";
    label.textColor = [UIColor grayColor];
    label.font = [UIFont systemFontOfSize:14];
    [self.view addSubview:label];
    
    
    _table = [[UITableView alloc] initWithFrame:CGRectMake(0, label.frame.size.height+label.frame.origin.y, self.view.frame.size.width, self.view.frame.size.height-64-60-label.frame.size.height-label.frame.origin.y)];
    _table.delegate =self;
    _table.dataSource = self;   
    [self.view addSubview:_table];
    
    //加载底部视图
    [self loadBottomView];
    // Do any additional setup after loading the view.
}

-(void)loadBottomView
{
    UIView * view = [[UIView alloc] initWithFrame:CGRectMake(0, self.view.frame.size.height-64-60, self.view.frame.size.width, 60)];
    [view setBackgroundColor:[UIColor colorWithRed:0.0/255.0 green:0.0/255.0 blue:0.0/255.0 alpha:0.3]];
    [self.view addSubview:view];
    
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
    [goPay addTarget:self action:@selector(onClick:) forControlEvents:UIControlEventTouchUpInside];
    [view addSubview:goPay];

}

-(void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle==UITableViewCellEditingStyleDelete) {
        //        获取选中删除行索引值
        NSInteger row = [indexPath row];
        //        通过获取的索引值删除数组中的值
        
        [dataArray removeObjectAtIndex:row];
        //        删除单元格的某一行时，在用动画效果实现删除过程
        [tableView deleteRowsAtIndexPaths:[NSArray arrayWithObject:indexPath] withRowAnimation:UITableViewRowAnimationAutomatic];
    }
}

- (NSString *)tableView:(UITableView *)tableView titleForDeleteConfirmationButtonForRowAtIndexPath:(NSIndexPath *)indexPath{
    return @"删除该商品";
}

-(UITableViewCellEditingStyle)tableView:(UITableView *)tableView editingStyleForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return UITableViewCellEditingStyleDelete;
}

-(BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    return YES;
}

-(void)onClick:(id)sender
{
    NSInteger index = rand()%2;
    if(index<1)
    {
        F3_BFPayViewController * pay = [[F3_BFPayViewController alloc] init];
        [self.navigationController pushViewController:pay animated:YES];
    }
    else
    {
        F2_BFErrorViewController * error = [[F2_BFErrorViewController alloc] init];
        [self.navigationController pushViewController:error animated:YES];

    }
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [dataArray count];
}

// Row display. Implementers should *always* try to reuse cells by setting each cell's reuseIdentifier and querying for available reusable cells with dequeueReusableCellWithIdentifier:
// Cell gets various attributes set automatically based on table (separators) and data source (accessory views, editing controls)

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString * strCell = @"cell";
    F1_BFShoppingCell * cell = [tableView dequeueReusableCellWithIdentifier:strCell];
    if(!cell)
    {
        cell = [[[NSBundle mainBundle] loadNibNamed:@"F1_BFShoppingCell" owner:self options:nil] lastObject];
    }
    
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    cell.addButton.tag = indexPath.row+1;
    cell.minButton.tag = indexPath.row+1;
    [cell.addButton addTarget:self action:@selector(onAdd:) forControlEvents:UIControlEventTouchUpInside];
    [cell.minButton addTarget:self action:@selector(onMin:) forControlEvents:UIControlEventTouchUpInside];
    
    cell.numberLabel.tag = indexPath.row+1;
    return cell;
}

-(void)onAdd:(id)sender
{
    UIButton * btn = (UIButton*)sender;
    F1_BFShoppingCell * cell = (F1_BFShoppingCell*)[_table cellForRowAtIndexPath:[NSIndexPath indexPathForRow:btn.tag-1 inSection:0]];
    UILabel * number =(UILabel*)[cell viewWithTag:btn.tag];
    [number setText:[NSString stringWithFormat:@"%d",[number.text integerValue]+1]];
}

-(void)onMin:(id)sender
{
    UIButton * btn = (UIButton*)sender;
    F1_BFShoppingCell * cell = (F1_BFShoppingCell*)[_table cellForRowAtIndexPath:[NSIndexPath indexPathForRow:btn.tag-1 inSection:0]];
    UILabel * number =(UILabel*)[cell viewWithTag:btn.tag];
    [number setText:[NSString stringWithFormat:@"%d",[number.text integerValue]-1]];
    
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 44;
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
