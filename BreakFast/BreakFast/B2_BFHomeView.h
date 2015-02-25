//
//  B2_BFHomeView.h
//  BreakFast
//
//  Created by admin on 15/2/18.
//  Copyright (c) 2015年 admin. All rights reserved.
//

#import <UIKit/UIKit.h>


typedef void (^block)(NSInteger);
@interface B2_BFHomeView : UIView


@property (nonatomic,strong)block myBlock;
-(void)viewForArray:(NSArray *)arr type:(NSInteger)type height:(void(^)(NSInteger))height;

@end
