//
//  C1_BFForgetPasswordViewController.m
//  BreakFast
//
//  Created by admin on 15/2/17.
//  Copyright (c) 2015年 admin. All rights reserved.
//

#import "C1_BFForgetPasswordViewController.h"

@interface C1_BFForgetPasswordViewController ()<NavCustomDelegate>
{
    UIScrollView * backScrollview;
    NavCustom * custom;

}
@end

@implementation C1_BFForgetPasswordViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = _titleStr;
    
    backScrollview =[[UIScrollView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height)];
    [self.view addSubview:backScrollview];
    
    
    _phoneTextFiled = [[UITextField alloc] initWithFrame:CGRectMake(15, 20, self.view.frame.size.width-30, 45)];
    _phoneTextFiled.placeholder = @"请输入手机号";
    _phoneTextFiled.layer.borderColor = [UIColor grayColor].CGColor;
    _phoneTextFiled.layer.borderWidth =1;
    [backScrollview addSubview:_phoneTextFiled];
    
    _codeTextField = [[UITextField alloc] initWithFrame:CGRectMake(15, _phoneTextFiled.frame.size.height+_phoneTextFiled.frame.origin.y+10, self.view.frame.size.width-30-150, 45)];
    _codeTextField.placeholder = @"请输入验证码";
    _codeTextField.layer.borderColor = [UIColor grayColor].CGColor;
    _codeTextField.layer.borderWidth =1;
    [backScrollview addSubview:_codeTextField];
    
    _getCodeButton  = [UIButton buttonWithType:UIButtonTypeCustom];
    [_getCodeButton setTitle:@"获取验证码" forState:UIControlStateNormal];
    [_getCodeButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    _getCodeButton.frame = CGRectMake(_codeTextField.frame.size.width+_codeTextField.frame.origin.x+10, _phoneTextFiled.frame.size.height+_phoneTextFiled.frame.origin.y+10, 140, 45);
    [_getCodeButton setBackgroundColor:[UIColor grayColor]];
    [backScrollview addSubview:_getCodeButton];
    
    _passwordTextField = [[UITextField alloc] initWithFrame:CGRectMake(15, _codeTextField.frame.size.height+_codeTextField.frame.origin.y+10, self.view.frame.size.width-30, 45)];
    _passwordTextField.placeholder = _passwordStr;
    _passwordTextField.layer.borderColor = [UIColor grayColor].CGColor;
    _passwordTextField.layer.borderWidth =1;
    [backScrollview addSubview:_passwordTextField];

    
    custom = [[NavCustom alloc] init];
    [custom setNavRightBtnTitle:@"确定" mySelf:self width:50 height:20];
    custom.NavDelegate = self;
    
    // Do any additional setup after loading the view.
}

-(void)NavRightButtononClick
{
    [self.navigationController popViewControllerAnimated:YES];
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
