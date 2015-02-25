//
//  A2_BFRightViewController.h
//  BreakFast
//
//  Created by admin on 15/2/15.
//  Copyright (c) 2015年 admin. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface A2_BFRightViewController :BFViewController<UITableViewDataSource,UITableViewDelegate>

@property (nonatomic,strong) UITableView * table;
@end
