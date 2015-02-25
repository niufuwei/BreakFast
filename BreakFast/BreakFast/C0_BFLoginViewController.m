//
//  C0_BFLoginViewController.m
//  BreakFast
//
//  Created by admin on 15/2/17.
//  Copyright (c) 2015年 admin. All rights reserved.
//

#import "C0_BFLoginViewController.h"
#import "C1_BFForgetPasswordViewController.h"

@interface C0_BFLoginViewController ()<NavCustomDelegate>
{
    UIScrollView * backScrollview;
    NavCustom * custom ;
}

@end

@implementation C0_BFLoginViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title= @"登录";
    
    
    custom = [[NavCustom alloc] init];
    custom.NavDelegate  =self;
    [custom setNavLeftBtnImage:@"close_press" LeftBtnSelectedImage:@"" mySelf:self width:20 height:20];
    
    backScrollview =[[UIScrollView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height)];
    [self.view addSubview:backScrollview];
    
    
    _phoneTextFiled = [[UITextField alloc] initWithFrame:CGRectMake(15, 20, self.view.frame.size.width-30, 45)];
    _phoneTextFiled.placeholder = @"请输入手机号";
    _phoneTextFiled.layer.borderColor = [UIColor grayColor].CGColor;
    _phoneTextFiled.layer.borderWidth =1;
    [backScrollview addSubview:_phoneTextFiled];
    
    _passwordTextField = [[UITextField alloc] initWithFrame:CGRectMake(15, _phoneTextFiled.frame.size.height+_phoneTextFiled.frame.origin.y+10, self.view.frame.size.width-30, 45)];
    _passwordTextField.placeholder = @"请输入密码";
    _passwordTextField.layer.borderColor = [UIColor grayColor].CGColor;
    _passwordTextField.layer.borderWidth =1;
    [backScrollview addSubview:_passwordTextField];
    
    
    UIButton * registerButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [registerButton setTitle:@"注册" forState:UIControlStateNormal];
    [registerButton setBackgroundColor:[UIColor clearColor]];
    registerButton.frame = CGRectMake(15, _passwordTextField.frame.size.height+_passwordTextField.frame.origin.y+5, 80, 30);
    [registerButton setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
    registerButton.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft;
    registerButton.tag = 101;
    [registerButton addTarget:self action:@selector(onClick:) forControlEvents:UIControlEventTouchUpInside];
    [backScrollview addSubview:registerButton];
    
    UIButton * foundPassword = [UIButton buttonWithType:UIButtonTypeCustom];
    [foundPassword setTitle:@"忘记密码?" forState:UIControlStateNormal];
    [foundPassword setBackgroundColor:[UIColor clearColor]];
    foundPassword.frame = CGRectMake(self.view.frame.size.width-15-100, _passwordTextField.frame.size.height+_passwordTextField.frame.origin.y+5, 100, 30);
    [foundPassword setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
    foundPassword.contentHorizontalAlignment = UIControlContentHorizontalAlignmentRight;
    foundPassword.tag = 102;
    [foundPassword addTarget:self action:@selector(onClick:) forControlEvents:UIControlEventTouchUpInside];
    [backScrollview addSubview:foundPassword];

    backScrollview.contentSize = CGSizeMake(self.view.frame.size.width, self.view.frame.size.height+1);
    // Do any additional setup after loading the view.
}

-(void)NavLeftButtononClick
{
    [self dismissViewControllerAnimated:YES completion:^{
        
    }];
}

-(void)onClick:(id)sender
{
    C1_BFForgetPasswordViewController * forget = [[C1_BFForgetPasswordViewController alloc] init];
    UIButton * btn = (UIButton*)sender;
    switch (btn.tag) {
        case 101:
        {
            forget.passwordStr = @"请输入密码";
            forget.titleStr = @"注册";
        }
            break;
        case 102:
        {
            forget.passwordStr= @"请输入新密码";
            forget.titleStr = @"重设密码";
        }
            break;
        default:
            break;
    }
    [self.navigationController pushViewController:forget animated:YES];

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
