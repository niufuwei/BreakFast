//
//  BFMetthods.m
//  BreakFast
//
//  Created by admin on 15/2/18.
//  Copyright (c) 2015年 admin. All rights reserved.
//

#import "BFMethods.h"
#import "CBMBProgressHUD.h"

@implementation BFMethods
+(void)alertMessage:(NSString *)message{
    
    //    UIAlertView *alert = [[UIAlertView alloc]initWithTitle:@"提示"
    //                                                   message:message
    //                                                  delegate:nil
    //                                         cancelButtonTitle:@"确定"
    //                                         otherButtonTitles:nil, nil];
    //    [alert show];
    
    UIWindow *window = [[UIApplication sharedApplication].windows objectAtIndex:[[UIApplication sharedApplication].windows count]-1];
    CBMBProgressHUD *indicator = [[CBMBProgressHUD alloc] initWithWindow:window];
    indicator.labelText = message;
    
    indicator.mode = MBProgressHUDModeText;
    [window addSubview:indicator];
    [indicator showAnimated:YES whileExecutingBlock:^{
        sleep(2);
    } completionBlock:^{
        [indicator removeFromSuperview];
        
    }];
    
}

@end
