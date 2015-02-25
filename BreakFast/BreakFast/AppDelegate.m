//
//  AppDelegate.m
//  BreakFast
//
//  Created by admin on 15/2/15.
//  Copyright (c) 2015年 admin. All rights reserved.
//

#import "AppDelegate.h"
#import "NavViewController.h"
#import "C0_BFLoginViewController.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];

    
    A0_BFCenterViewController *mainController = [[A0_BFCenterViewController alloc] init];
    NavViewController *navController = [[NavViewController alloc] initWithRootViewController:mainController];
    
    A1_BFLeftViewController *leftController = [[A1_BFLeftViewController alloc] init];
    
    A2_BFRightViewController *rightController = [[A2_BFRightViewController alloc] init];
    
    _menuController = [[DDMenuController alloc] initWithRootViewController:navController];
    
    _menuController.leftViewController = leftController;
    _menuController.rightViewController = rightController;

    
    self.window.rootViewController = _menuController;
    
    self.window.backgroundColor = [UIColor whiteColor];
    [self.window makeKeyAndVisible];
    return YES;
}

-(void)toLogin:(UIViewController*)VC
{
    C0_BFLoginViewController * login = [[C0_BFLoginViewController alloc] init];
    NavViewController * nav = [[NavViewController alloc] initWithRootViewController:login];
    [VC presentViewController:nav animated:YES completion:^{
        
    }];
}

-(void)showLeft
{
    [_menuController showLeftController:YES];
}

-(void)showRight
{
    [_menuController showRightController:YES];
}

- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
