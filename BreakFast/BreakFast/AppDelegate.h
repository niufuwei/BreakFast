//
//  AppDelegate.h
//  BreakFast
//
//  Created by admin on 15/2/15.
//  Copyright (c) 2015年 admin. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DDMenuController.h"
#import "A1_BFLeftViewController.h"
#import "A2_BFRightViewController.h"
#import "A0_BFCenterViewController.h"

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) DDMenuController *menuController;

@property (strong, nonatomic) UIWindow *window;

-(void)showLeft;
-(void)showRight;
-(void)toLogin:(UIViewController*)VC;
@end

