//
//  TYDefine.h
//  TYDaily
//
//  Created by laoniu on 14-10-2.
//
//

#ifndef TYDaily_TYDefine_h
#define TYDaily_TYDefine_h

#import "UIImageView+WebCache.h"
#import "BFViewController.h"
#import "AppDelegate.h"

#define iPhone5 ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(640, 1136), [[UIScreen mainScreen] currentMode].size) : NO)
#define IOS_VERSION [[[UIDevice currentDevice] systemVersion] floatValue]
#define UIColorFromRGB(rgbValue) [UIColor colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 green:((float)((rgbValue & 0xFF00) >> 8))/255.0 blue:((float)(rgbValue & 0xFF))/255.0 alpha:1.0]

#define appDelegate ((AppDelegate *)[[UIApplication sharedApplication] delegate])
#define TYDaily_color(rgbValue)   [UIColor colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 green:((float)((rgbValue & 0xFF00) >> 8))/255.0 blue:((float)(rgbValue & 0xFF))/255.0 alpha:1.0]

#define phoneHeight  self.view.frame.size.height-64
#endif
