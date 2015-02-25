//
//  C1_BFForgetPasswordViewController.h
//  BreakFast
//
//  Created by admin on 15/2/17.
//  Copyright (c) 2015年 admin. All rights reserved.
//

#import "BFViewController.h"

@interface C1_BFForgetPasswordViewController : BFViewController
@property (nonatomic,strong) UITextField * phoneTextFiled;
@property (nonatomic,strong) UITextField * passwordTextField;
@property (nonatomic,strong) UITextField * codeTextField;
@property (nonatomic,strong) UIButton * getCodeButton;


@property (nonatomic,strong) NSString * titleStr;
@property (nonatomic,strong) NSString * passwordStr;

@end
