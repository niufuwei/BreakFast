//
//  XMMethods.m
//  XMProject
//
//  Created by admin on 14-3-17.
//  Copyright (c) 2014年 admin. All rights reserved.
//

#import "XMMethods.h"
//#import <CFNetwork/CFNetwork.h>
#include <ifaddrs.h>
#import <arpa/inet.h>
#include <sys/sysctl.h>
#include <net/if.h>
#include <net/if_dl.h>
#import "CBMBProgressHUD.h"
/*
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <unistd.h>
#include <sys/ioctl.h>
#include <sys/types.h>
#include <sys/socket.h>
#include <netinet/in.h>
#include <netdb.h>
#include <arpa/inet.h>
#include <sys/sockio.h>
#include <net/if.h>
#include <errno.h>
#include <net/if_dl.h>
*/






static DismissBlock _dismissBlock;
static CancleBlock _cancleBlock;
UIView * maskView;

@implementation XMMethods


+(NSString*)stringToReplace:(NSString*)str
{
    NSLog(@"%@",str);
    if([str length] ==0)
    {
        return @"";
    }
    else
    {
        NSRange range = [str rangeOfString:@"@"];
        
        NSString * strUsername = @"";
        if([self isMobilePhone:str])
        {
            //手机号
            strUsername = [str stringByReplacingCharactersInRange:NSMakeRange(3, 5) withString:@"*****"];
        }
        else if(range.location != NSNotFound)
        {
            NSString * string = [str substringToIndex:range.location];
            if([string length] >2)
            {
                string = [string substringToIndex:2];
            }
            else
            {
                string = [string substringToIndex:1];
            }
            string = [string stringByAppendingString:@"***"];
            
            NSString * string2222 = [str substringFromIndex:range.location];
            strUsername = [string stringByAppendingString:string2222];
        }
        else
        {
            //用户名
            strUsername = [str stringByReplacingCharactersInRange:NSMakeRange(0, str.length -1) withString:@"*"];
            
        }
        return strUsername;

    }
}


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
        sleep(1.2);
    } completionBlock:^{
        [indicator removeFromSuperview];
        
    }];
    
}
+(NSString *)getAppVersion{
    
    NSDictionary * dict = [[NSBundle mainBundle] infoDictionary];
    return [dict objectForKey:@"CFBundleShortVersionString"];
}

#pragma mark------view methods------

//移动view的x位置
+(void)moveX:(UIView *)view x:(CGFloat)x{
    CGRect frame = view.frame;
    frame.origin.x += x;
    view.frame = frame;
}

//移动view的y位置
+(void)moveY:(UIView *)view y:(CGFloat)y{
    CGRect frame = view.frame;
    frame.origin.y += y;
    view.frame = frame;
}

+(void)changeLength:(UIView *)view length:(CGFloat)length{

    CGRect frame = view.frame;
    frame.size.width += length;
    view.frame = frame;
}

+(void)changeLength:(UIView *)view toLength:(CGFloat)length{
    CGRect frame = view.frame;
    frame.size.width = length;
    view.frame = frame;
}

+(void)changeHeight:(UIView *)view height:(CGFloat)height{
    CGRect frame = view.frame;
    frame.size.height = height;
    view.frame = frame;
}

/*
+(void)view:(UIView *)view1 distance:(CGFloat)distance leftView:(UIView *)view2{
    
    CGRect view1Frame = view1.frame;
    CGRect view2Frame = view2.frame;
    

}
 */

+(void)view:(UIView *)view1 distance:(CGFloat)distance rightView:(UIView *)view2{
    
    CGRect view1Frame = view1.frame;
    CGRect view2Frame = view2.frame;
    view1Frame.origin.x = view2Frame.origin.x + view2Frame.size.width + distance;
    view1.frame = view1Frame;
    

}

+(void)view:(UIView *)view1 distance:(CGFloat)distance underView:(UIView *)view2{

    CGRect view1Frame = view1.frame;
    CGRect view2Frame = view2.frame;
    view1Frame.origin.y = view2Frame.origin.y + view2Frame.size.height + distance;
    view1.frame = view1Frame;
}

+(void)view:(UIView *)view1 distance:(CGFloat)distance upView:(UIView *)view2{

}

+(void)view:(UIView *)view1 distance:(CGFloat)distance leftView:(UIView *)view2{

}



+(CGPoint)centerPoint:(CGRect)rect{
    
    CGPoint point = CGPointZero;
    UIView *view = [[UIView alloc]initWithFrame:rect];
    point = view.center;
    return point;
}

+(CGSize)blankSizeWithBottomSize:(CGSize)bottomSize topSize:(CGSize)topSize{
    
    CGSize blankSize;
    blankSize.height = DEVICE_SIZE.height - topSize.height - bottomSize.height;
    blankSize.width = DEVICE_SIZE.width;
    return blankSize;
}

+(CGRect)blankRectWithBottomSize:(CGSize)bottomSize topSize:(CGSize)topSize{
    
    CGRect blankRect = CGRectZero;
    blankRect.origin.x = 0;
    blankRect.origin.y = topSize.height;
    blankRect.size = [self blankSizeWithBottomSize:bottomSize topSize:topSize];
    return blankRect;
}

+(UIImage *)toImageWithView:(UIView *)view{
    
    UIGraphicsBeginImageContext(view.frame.size);
    CGContextRef context = UIGraphicsGetCurrentContext();
    [view.layer renderInContext:context];
    UIImage * image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return image;
}


-(void)ssss
{
    
}


+(void)showActivityViewInView:(UIView *)view{
//    [UIApplication sharedApplication].networkActivityIndicatorVisible = YES;
//    UIActivityIndicatorView *activityView = [[UIActivityIndicatorView alloc]initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleWhiteLarge];
//    activityView.frame = CGRectMake(0, 0, 80, 80);
//    activityView.center = [UIApplication sharedApplication].keyWindow.center;
//    activityView.color = DARKGRAY;
//    [view addSubview:activityView];
//    [activityView startAnimating];
//
    
    UIView * AnimaionView = [[UIView alloc] initWithFrame:CGRectMake(view.frame.size.width/2-50, view.frame.size.height/2-10, 100, 20)];
    [AnimaionView setBackgroundColor:[UIColor clearColor]];
    AnimaionView.tag = 10808;
    [view addSubview:AnimaionView];
    
    UIImageView * cicleImageView = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"refresh_circle"]];
    cicleImageView.frame = CGRectMake(0,2, 17.5, 17.5);
    cicleImageView.backgroundColor = CLEARCOLOR;
    [AnimaionView addSubview:cicleImageView];

    
    CABasicAnimation *animation = [CABasicAnimation animationWithKeyPath:@"transform"];
    animation.toValue = [NSValue valueWithCATransform3D:CATransform3DMakeRotation(M_PI / 2 , 0, 0, 1.0)];
    animation.duration = 0.3;
    animation.autoreverses = NO;
    animation.cumulative = YES;
    animation.repeatCount = INT_MAX;
    animation.fillMode = kCAFillModeBackwards;
    [cicleImageView.layer addAnimation:animation forKey:@"animation"];
    
    
    UILabel * label = [[UILabel alloc] initWithFrame:CGRectMake(cicleImageView.frame.size.width+cicleImageView.frame.origin.x+2, 2, 80, 18)];
    label.text = @"正在加载中...";
    label.textColor = UIColorFromRGB(0xcdcdcd);
    label.backgroundColor = [UIColor clearColor];
    label.font = [UIFont systemFontOfSize:13];
    [AnimaionView addSubview:label];

}

+(void)removeActivityViewInView:(UIView *)view{
//    [UIApplication sharedApplication].networkActivityIndicatorVisible = NO;
    for (UIView *subView in view.subviews) {
        if (subView.tag == 10808) {
            [subView removeFromSuperview];
            break;
        }
    }
}

+(void)showActivityViewInWindow{
    [UIApplication sharedApplication].networkActivityIndicatorVisible = YES;
    [XMMethods showActivityViewInView:[UIApplication sharedApplication].keyWindow];
}

+(void)removeActivityViewInWindow{
    [UIApplication sharedApplication].networkActivityIndicatorVisible = NO;
    [XMMethods removeActivityViewInView:[UIApplication sharedApplication].keyWindow];
}

+(void)showActivityViewInWindowAndMask
{
    [UIApplication sharedApplication].networkActivityIndicatorVisible = YES;
    [XMMethods showActivityViewInWindowAndMask:[UIApplication sharedApplication].keyWindow];
}

+(void)removeActivityViewInWindowAndMask
{
    [UIApplication sharedApplication].networkActivityIndicatorVisible = YES;
    [XMMethods removeActivityViewInWindowAndMask:[UIApplication sharedApplication].keyWindow];
}

+(void)showActivityViewInWindowAndMask:(UIView*)view
{
    
    maskView = [[UIView alloc] initWithFrame:view.frame];
    maskView.backgroundColor = [UIColor clearColor];
    [view addSubview:maskView];
    
    [UIApplication sharedApplication].networkActivityIndicatorVisible = YES;
    UIActivityIndicatorView *activityView = [[UIActivityIndicatorView alloc]initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleWhiteLarge];
    activityView.frame = CGRectMake(0, 0, 80, 80);
    activityView.center = [UIApplication sharedApplication].keyWindow.center;
    activityView.color = DARKGRAY;
    [view addSubview:activityView];
    [activityView startAnimating];
}

+(void)removeActivityViewInWindowAndMask:(UIView*)view
{
    [UIApplication sharedApplication].networkActivityIndicatorVisible = NO;
    for (UIView *subView in view.subviews) {
        if ([subView isKindOfClass:[UIActivityIndicatorView class]]) {
            UIActivityIndicatorView *activityView = (UIActivityIndicatorView *)subView;
            [activityView stopAnimating];
            [activityView removeFromSuperview];
            break;
        }
    }
    [maskView removeFromSuperview];
}

+(CGFloat)label:(UILabel *)label widthByString:(NSString *)str{
    
    CGSize size = [str sizeWithFont:label.font constrainedToSize:CGSizeMake(MAXFLOAT,label.frame.size.width) lineBreakMode:NSLineBreakByWordWrapping];
    return size.width;
}

+(CGFloat)label:(UILabel *)label heightByString:(NSString *)str{
   
    CGSize size = [str sizeWithFont:label.font constrainedToSize:CGSizeMake(label.frame.size.width, MAXFLOAT) lineBreakMode:NSLineBreakByWordWrapping];
    return size.height ? size.height : 44;
}

+(CGFloat)font:(UIFont *)font heightByString:(NSString *)str withWidth:(CGFloat)width{
    
    CGSize size = [str sizeWithFont:font constrainedToSize:CGSizeMake(width, MAXFLOAT) lineBreakMode:NSLineBreakByWordWrapping];
    return size.height ? size.height : 44;
}

#pragma mark------fileManager filePath methods------

+(NSString *)documentPath{
    
    NSArray *doucumentsArray = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *doucumentPath   = [doucumentsArray objectAtIndex:0];
    return doucumentPath;
}

+(NSString *)documentPathOfFile:(NSString *)fileName{
    
    NSString *documentPath = [self documentPath];
    return [documentPath stringByAppendingPathComponent:fileName];
}

#pragma mark-
#pragma mark-------date methods------

+(NSDate *)test:(NSString *)test{

    return [self strToDate:test withFormat:DATE_TEST];
}

+(NSString *)dateToStr:(NSDate *)date withFormat:(NSString *)format{
    if (nil == date)
        return nil;
    if (nil == format)
        format = DATE_SHORT;
    NSDateFormatter *f = [[NSDateFormatter alloc]init];
    [f setDateFormat:format];
    NSString *str = [f stringFromDate:date];
    return str;
}

+(NSDate *)strToDate:(NSString *)str withFormat:(NSString *)format{
    
    if (nil == str)
        return nil;
    if (nil == format)
        format = DATE_SHORT;
    NSDateFormatter *f = [[NSDateFormatter alloc]init];
    [f setDateFormat:format];
    NSDate *date = [f dateFromString:str];
    return date;
}

+(NSString *)dateToStrShort:(NSDate *)date{
    return [self dateToStr:date withFormat:DATE_SHORT];
}

+(NSString *)dateToStrLong:(NSDate *)date{
    return [self dateToStr:date withFormat:DATE_LONG];
}

+(NSDate *)strShortToDate:(NSString *)str{
    return [self strToDate:str withFormat:DATE_SHORT];
}

+(NSDate *)strLongToDate:(NSString *)str{
    return [self strToDate:str withFormat:DATE_LONG];
}

+(NSString *)dateToStrShortChina:(NSDate *)date{
    return [self dateToStr:date withFormat:DATE_CHINA_SHORT];
}

+(NSString *)dateToStrLongChina:(NSDate *)date{
    return [self dateToStr:date withFormat:DATE_CHINA_LONG];
}

+(NSDate *)strShortChinaToDate:(NSString *)str{
    return [self strToDate:str withFormat:DATE_CHINA_SHORT];
}

+(NSDate *)strLongChinaToDate:(NSString *)str{
    return [self strToDate:str withFormat:DATE_CHINA_LONG];
}

+(BOOL)dateLessOrEqualWithStart:(NSDate *)start end:(NSDate *)end{
    
    if (nil == start || nil == end)
        return NO;
    NSCalendar *calendar = [[NSCalendar alloc]initWithCalendarIdentifier:NSGregorianCalendar];
    NSInteger unitFlags =   NSYearCalendarUnit |
    NSMonthCalendarUnit |
    NSDayCalendarUnit |
    NSWeekdayCalendarUnit |
    NSHourCalendarUnit |
    NSMinuteCalendarUnit |
    NSSecondCalendarUnit;
    NSDateComponents *startComps = [calendar components:unitFlags fromDate:start];
    NSInteger startYear = [startComps year];
    NSInteger startMonth = [startComps month];
    NSInteger startDay = [startComps day];
    
    NSDateComponents *endComps = [calendar components:unitFlags fromDate:end];
    NSInteger endYear = [endComps year];
    NSInteger endMonth = [endComps month];
    NSInteger endDay = [endComps day];
    
    if (startYear == endYear) {
        if (startMonth == endMonth) {
            if (startDay > endDay) {
                return NO;
            }
        }else if(startMonth > endMonth){
            return NO;
        }
    }else if (startYear > endYear){
        return NO;
    }
    return YES;
}

+(BOOL)dateInRangeWithStart:(NSDate *)start end:(NSDate *)end months:(NSInteger)months{
    
    if (nil == start || nil == end)
        return NO;
    NSCalendar *calendar = [[NSCalendar alloc]initWithCalendarIdentifier:NSGregorianCalendar];
    NSInteger unitFlags =   NSYearCalendarUnit |
    NSMonthCalendarUnit |
    NSDayCalendarUnit |
    NSWeekdayCalendarUnit |
    NSHourCalendarUnit |
    NSMinuteCalendarUnit |
    NSSecondCalendarUnit;
    NSDateComponents *startComps = [calendar components:unitFlags fromDate:start];
    NSInteger startYear = [startComps year];
    NSInteger startMonth = [startComps month];
    NSInteger startDay = [startComps day];
    
    NSDateComponents *endComps = [calendar components:unitFlags fromDate:end];
    NSInteger endYear = [endComps year];
    NSInteger endMonth = [endComps month];
    NSInteger endDay = [endComps day];
    
    if (startYear == endYear) {
        if (startMonth == endMonth) {
            if (startDay > endDay) {
                return NO;
            }
        }else if(startMonth > endMonth){
            return NO;
        }
    }else if (startYear > endYear){
        return NO;
    }
    NSInteger count = (endYear - startYear) * 12 + (endMonth - startMonth);
    if (count > months) {
        return NO;
    }else if (count == months)
        return startDay >= endDay;
    else
        return YES;
}

+(BOOL)dateInHalfYearWithStart:(NSDate *)start end:(NSDate *)end{
    return [self dateInRangeWithStart:start end:end months:6];
}

+(BOOL)dateInOneYearWithStart:(NSDate *)start end:(NSDate *)end{
    return [self dateInRangeWithStart:start end:end months:12];
}

+(NSString *)weekNameFromDate:(NSDate *)date{
    NSCalendar *calendar = [NSCalendar currentCalendar];
    NSDateComponents *comps = [calendar components:NSWeekdayCalendarUnit fromDate:date];
    NSInteger weekDay = [comps week];
    switch (weekDay) {
        case 1:return @"星期日";break;
        case 2:return @"星期一";break;
        case 3:return @"星期二";break;
        case 4:return @"星期三";break;
        case 5:return @"星期四";break;
        case 6:return @"星期五";break;
        case 7:return @"星期六";break;
        default:return @"星期八！！";break;
    }
}

+(NSString *)daysBetween:(NSString *)start end:(NSString *)end{

    if (nil == start) {
        return nil;
    }
    if (nil == end) {
       end = [XMMethods dateToStr:[NSDate date] withFormat:DATE_SHORT];
    }
    
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc]init];
    [dateFormatter setDateFormat:DATE_SHORT];
    NSDate *endDate = [dateFormatter  dateFromString:end];
    NSDate *starDate = [dateFormatter dateFromString:start];
    NSTimeInterval time = [starDate timeIntervalSinceDate:endDate];
    return [NSString stringWithFormat:@"%llu",(long long)time / (3600 * 24)];
}



#pragma mark-animation methods------

+(void)ShakeView:(UIView *)view
{
	CAKeyframeAnimation *keyAn = [CAKeyframeAnimation animationWithKeyPath:@"position"];
	[keyAn setDuration:0.5f];
	NSArray *array = [[NSArray alloc] initWithObjects:
					  [NSValue valueWithCGPoint:CGPointMake(view.center.x, view.center.y)],
					  [NSValue valueWithCGPoint:CGPointMake(view.center.x-5, view.center.y)],
					  [NSValue valueWithCGPoint:CGPointMake(view.center.x+5, view.center.y)],
					  [NSValue valueWithCGPoint:CGPointMake(view.center.x, view.center.y)],
					  [NSValue valueWithCGPoint:CGPointMake(view.center.x-5, view.center.y)],
					  [NSValue valueWithCGPoint:CGPointMake(view.center.x+5, view.center.y)],
					  [NSValue valueWithCGPoint:CGPointMake(view.center.x, view.center.y)],
					  [NSValue valueWithCGPoint:CGPointMake(view.center.x-5, view.center.y)],
					  [NSValue valueWithCGPoint:CGPointMake(view.center.x+5, view.center.y)],
					  [NSValue valueWithCGPoint:CGPointMake(view.center.x, view.center.y)],
					  nil];
	[keyAn setValues:array];
	NSArray *times = [[NSArray alloc]initWithObjects:
					  [NSNumber numberWithFloat:0.1f],
					  [NSNumber numberWithFloat:0.2f],
					  [NSNumber numberWithFloat:0.3f],
					  [NSNumber numberWithFloat:0.4f],
					  [NSNumber numberWithFloat:0.5f],
					  [NSNumber numberWithFloat:0.6f],
					  [NSNumber numberWithFloat:0.7f],
					  [NSNumber numberWithFloat:0.8f],
					  [NSNumber numberWithFloat:0.9f],
					  [NSNumber numberWithFloat:1.0f],
					  nil];
	[keyAn setKeyTimes:times];
	[view.layer addAnimation:keyAn forKey:@"TextFieldShake"];
}

#pragma mark-data methods------

+(NSString *)addComma:(NSString *)srcString{
    
    NSInteger srcLength=srcString.length;
    
    NSString* str=nil;
    
    if(srcLength>3)
    {
        int mod = srcLength % 3;
        if(mod>0)
            str=[srcString substringWithRange:NSMakeRange(0, mod)];
        
        int threeCount=srcLength/3;
        
        for(int i=0;i < threeCount;i++){
            if((mod==0)&&(i==0))
                str=[srcString substringWithRange:NSMakeRange(0,3)];
            else{
                int end=3;
                
                if(mod+3*i+3>srcLength)
                    end=mod+3*i+3-srcLength;
                
                str=[str stringByAppendingFormat:@",%@",[srcString substringWithRange:NSMakeRange(mod+3*i, end)]];
                
            }
        }
        return str;
    }
    else
        return srcString;
}

//为金额添加，分隔符和.分隔符
+(NSString *)toCashWithCommaAndDot:(NSString *)cash decimlCount:(NSInteger)count
{
    if([cash floatValue] < 0.00)
    {
        return @"0.00";
    }
    NSLog(@"%@",cash);
    double d=[cash doubleValue];
    //获取小数部分
    NSString *changeStr=[NSString stringWithFormat:@"%lf",d];
    NSString* dot=@".";
    NSRange indexOf=[changeStr rangeOfString:dot];
    int location =indexOf.location;
    NSRange range=NSMakeRange(location,count+1);
    NSString *decimalNum = [changeStr substringWithRange:range];
    NSString *integerCash = [changeStr substringToIndex:range.location];
   
    NSLog(@"%@",integerCash);
  
    NSString *zero =@"0";
    if([integerCash isEqualToString: zero]){
        
        return [@"0" stringByAppendingFormat:@"%@",decimalNum];
        
    }   
  
    return [[XMMethods addComma:[NSString stringWithFormat:@"%@", integerCash]] stringByAppendingFormat:@"%@",decimalNum] ;
}

+(NSString *)toCashWithCommaAndDot:(NSString *)cash{
    return [self toCashWithCommaAndDot:cash decimlCount:2];
}

+(NSString *) toChineseCash:(NSString *)cash {
    if ( cash == nil || cash.length == 0 ) {
        return @"";
    }
    float noCommaCash = [[self removeComma:cash] floatValue];
    if ( noCommaCash == 0 ) {
        return @"";
    }
    NSRange range = [cash rangeOfString:@"."];
    if( range.location == NSNotFound) {
        NSString *chinese = [[NSString alloc] initWithFormat:@"%@整", [self convertIntegerToChineseCash:cash]];
        return chinese ;
    }
    
    NSString *integerCash = [cash substringToIndex:range.location];
    NSString *decimalCash = [cash substringFromIndex:NSMaxRange(range)];
    
    NSString *chinese = [[NSString alloc] initWithFormat:@"%@%@", [self convertIntegerToChineseCash:integerCash], [self convertDecimalToChineseCash:decimalCash]];
    return chinese ;
}
+(NSString *) convertIntegerToChineseCash:(NSString *) cash {
    if ( [cash floatValue] == 0 )
        return @"";
    NSArray *nums = [[NSArray alloc] initWithObjects:@"零", @"壹", @"贰", @"叁", @"肆", @"伍", @"陆", @"柒", @"捌", @"玖", nil];
    NSArray *digits = [[NSArray alloc] initWithObjects:@"", @"拾", @"佰", @"仟", nil];
    NSArray *units = [[NSArray alloc] initWithObjects:@"", @"万", @"亿", @"万亿", @"仟兆", nil];
    
    NSMutableString *chineseCash = [[NSMutableString alloc] initWithString:@""];
    
    int p = 0; //字符位置指针
    int m = cash.length % 4; //取模
    
    // 四位一组得到组数
    NSInteger k = m > 0 ? cash.length / 4 + 1 : cash.length / 4;
    // 外层循环在所有组中循环
    // 从左到右 高位到低位 四位一组 逐组处理
    // 每组最后加上一个单位: "[万亿]","[亿]","[万]"
    for (NSInteger i = k; i > 0; i--) {
        int L = 4;
        if (i == k && m != 0) {
            L = m;
        }
        // 得到一组四位数 最高位组有可能不足四位
        NSString *s = [cash substringWithRange:NSMakeRange(p, L) ];//.substring(p, p + L);
        NSInteger l = s.length;
        
        // 内层循环在该组中的每一位数上循环 从左到右 高位到低位
        for (int j = 0;j < l;j++) {
            int n =  [s characterAtIndex:j] - 48;//parseInt(s.substring(j, j+1));
            if (n == 0) {
                if (j < l - 1 &&  [s characterAtIndex:j+1] - 48 > 0) //后一位(右低)
                {
                    [chineseCash appendString:  [nums objectAtIndex:n]];
                }else{}
            }
            else
            {
                [chineseCash appendString:[nums objectAtIndex:n]];
                [chineseCash appendString:[digits objectAtIndex:l - j - 1]];
            }
        }
        p += L;
        // 每组最后加上一个单位: [万],[亿] 等
        //不是最高位的一组
        if (i < k) {
            if ( [s intValue] != 0) {
                //如果所有 4 位不全是 0 则加上单位 [万],[亿] 等
                [chineseCash appendString:[units objectAtIndex:i - 1]];
                //S += Units[i - 1];
            }
        }
        else {
            //处理最高位的一组,最后必须加上单位
            [chineseCash appendString:[units objectAtIndex:i - 1]];
            //S += Units[i - 1];
        }
    }
    NSString *chinese = [[NSString alloc] initWithFormat:@"%@圆", chineseCash];
    return chinese;
}

+(NSString *)floatToStr:(CGFloat)v dotLen:(NSInteger)dotLen splitLen:(NSInteger)splitLen{
    return @"";
}

+(NSString *)removeComma:(NSString *)srcString{
    
    srcString=[srcString stringByReplacingOccurrencesOfString:@"," withString:@""];
    
    return srcString;
}
+(NSString *) convertDecimalToChineseCash:(NSString *) cash {
    if ( [cash floatValue] == 0 )
        return @"整";
    else {
        NSMutableString *chineseCash = [[NSMutableString alloc] initWithString:@""] ;
        NSArray *nums = [[NSArray alloc] initWithObjects:@"零", @"壹", @"贰", @"叁", @"肆", @"伍", @"陆", @"柒", @"捌", @"玖", nil];
        int intValue = 0;
        if (cash.length > 0) {
            intValue = [cash characterAtIndex:0] - 48;
        }
        if ( intValue != 0 )
            [chineseCash appendFormat:@"%@角", [nums objectAtIndex:intValue]];
        int nextValue = 0;
        if (cash.length > 1) {
            nextValue = [cash characterAtIndex:1] - 48;
        }
        if ( nextValue != 0 )
            [chineseCash appendFormat:@"%@分", [nums objectAtIndex:nextValue]];
        if (intValue == 0 && nextValue == 0) {
            return @"整";
        }
        NSString *chinese = [[NSString alloc] initWithString:chineseCash];
        return chinese;
    }
}

+(NSString *)stringToNoComma:(NSString *)str{

    NSArray *array = [str componentsSeparatedByString:@","];
    NSString *result = [array componentsJoinedByString:@""];
    return result;
}

+(BOOL)isNull:(NSString *)str{
    if(nil == str || [str isEqualToString:@""] || [str isEqualToString:@" "])
    {
        
    return YES;
    }
    return NO;
}

+(BOOL)isNullWithEmpty:(NSString *)str
{
    if (nil == str) 
    {
        return YES;
    }
    return NO;
}
+(NSString *)hidePhoneNumber:(NSString *)number{

    return [XMMethods hideString:number fromIndex:3 count:4];
}

+(NSString *)hideString:(NSString *)str fromIndex:(NSUInteger)index count:(NSInteger)count{

    if ([XMMethods isNull:str]) {
        return str;
    }
    NSMutableString *newStr = [NSMutableString stringWithString:str];
    
    NSMutableString *starStr = [@"" mutableCopy];
    for (int i = 0; i < count; i++) {
        [starStr appendString:@"*"];
    }
    
    [newStr replaceCharactersInRange:NSMakeRange(index, count) withString:starStr];
    
    /*
    NSInteger strLength = [newStr length];

    NSMutableString *starStr = [NSMutableString stringWithCapacity:5];
    
    for ( int i = 0; i < strLength; ++i) {
        [starStr appendString:@"*"];
    }
    [newStr replaceCharactersInRange:NSMakeRange(0, 0) withString:starStr];
    */
    return newStr;
}

#pragma mark-
#pragma mark------正则表达式------

+(BOOL)predicateMatchWithString:(NSString *)str regex:(NSString *)regex{
    
    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"SELF MATCHES %@",regex];
    return [predicate evaluateWithObject:str];
}

+(BOOL)isMobilePhone:(NSString *)mobileNumber{

    if(!mobileNumber)
        return 0;
    NSString *regex = @"^1[3|4|5|8|7]\\d{9}$";
    return [XMMethods predicateMatchWithString:mobileNumber regex:regex];
}

+(BOOL)isEmail:(NSString *)email{
    if (!email) {
        return 0;
    }
    NSString *regex = @"^[\\w-]+(\\.[\\w-]+)*@[\\w-]+(\\.[\\w-]+)+$";
    return [XMMethods predicateMatchWithString:email regex:regex];
}

+(BOOL)isMoneyAvailable:(NSString *)money{

    if (!money) {
        return 0;
    }
    NSString *regx = @"^((\\d+)(\\.\\d{0,2})?)$";
    return [XMMethods predicateMatchWithString:money regex:regx];
}

+(BOOL)isNumber:(NSString *)number{
    if ([XMMethods isNull:number]) {
        return NO;
    }
    
    NSString *regx = @"^[0-9]*$";
    return [XMMethods predicateMatchWithString:number regex:regx];
}

+(BOOL)isEnglishCharactor:(NSString *)englishCharactor{
    
    if (!englishCharactor) {
        return 0;
    }
    NSString *regx = @"^[a-zA-Z]*$";
    return [XMMethods predicateMatchWithString:englishCharactor regex:regx];
}

+(BOOL)isEnglishCharactorAndNumbers:(NSString *)target{

    if (!target) {
        return 0;
    }
    NSString *regx = @"^[A-Za-z0-9]+$";
    return [XMMethods predicateMatchWithString:target regex:regx];
}

+(BOOL)isPasswordsAvailable:(NSString *)passwords{

    if(!passwords){
        return 0;
    }
    NSString *regx = @"^(?=.*[0-9].*)(?=.*[a-zA-Z].*).{6,}$";
    return [XMMethods predicateMatchWithString:passwords regex:regx];
}

+(BOOL)isMoneyRight:(NSString *)money{
    if(!money){
        return 0;
    }
    NSString *regx = @"^(([0-9]+.[0-9]*[1-9][0-9]*)|([0-9]*[1-9][0-9]*.[0-9]+)|([0-9]*[1-9][0-9]*))$";
    return [XMMethods predicateMatchWithString:money regex:regx];
    
}


#pragma mark-
#pragma mark------创建类的一些方法------

+(id)objeFromName:(NSString *)name{

    if ([XMMethods isNull:name]) {
        return nil;
    }
    id obj = [[NSClassFromString(name) alloc]init];
    return obj;
}

+(SEL)selFromName:(NSString *)name{
    
    if ([XMMethods isNull:name]) {
        return nil;
    }
    SEL sel = NSSelectorFromString(name);
    return sel;
}


#pragma mark-
#pragma mark------DeviceMethods------

+(BOOL)call:(NSString *)num{
    
    return [[UIApplication sharedApplication] openURL:[NSURL URLWithString:[NSString stringWithFormat:@"tel://%@",num]]];
}

+(BOOL)callXiaoMaBank{

    return [XMMethods call:@"4008-160-111"];
}

+(NSArray *)arrayFromDictionary:(NSDictionary *)dic withKeyRank:(NSArray *)rankKeys{
    
    if (rankKeys.count > [dic allKeys].count) {
        return nil;
    }
    NSMutableArray *array = [NSMutableArray array];
    
    for (int i = 0; i < rankKeys.count; i++) {
        NSString *obj = [dic objectForKey:[rankKeys objectAtIndex:i]];
        [array addObject:obj];
    }
    return [NSArray arrayWithArray:array];
}


//获取内网IP
+(NSString *)getIPAdress
{
    NSString *address = @"error";
    struct ifaddrs *interfaces = NULL;
    struct ifaddrs *temp_addr = NULL;
    int success = 0;
    success = getifaddrs(&interfaces);
    if (success == 0) {
        temp_addr = interfaces;
        while (temp_addr !=NULL) {
            if (temp_addr->ifa_addr->sa_family==AF_INET) {
                if ([[NSString stringWithUTF8String:temp_addr->ifa_name] isEqualToString:@"en0"]) {
                    address = [NSString stringWithUTF8String:inet_ntoa(((struct sockaddr_in *)temp_addr->ifa_addr)->sin_addr)];
                }
            }
            temp_addr = temp_addr->ifa_next;
        }
    }
    freeifaddrs(interfaces);
    return address;
}


//获取外网IP
+(NSString *)getWANIIPAdress
{
    NSString *IP = @"0.0.0.0";
    NSURL *url = [NSURL URLWithString:@"http://ifconfig.me/ip"];
    NSURLRequest *request = [NSURLRequest requestWithURL:url cachePolicy:NSURLRequestUseProtocolCachePolicy timeoutInterval:8.0];
    
    NSURLResponse *response = nil;
    NSError *error = nil;
    NSData *data = [NSURLConnection sendSynchronousRequest:request returningResponse:&response error:&error];
    if (error) {
        NSLog(@"Failed to get WAN IP Address!\n%@", error);
        [[[UIAlertView alloc] initWithTitle:@"获取外网 IP 地址失败" message:[error localizedFailureReason] delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil] show];
    } else {
        NSString *responseStr = [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
        IP = responseStr;
    }
    
    return IP;
}

+ (NSString *)getMacAddress
{
    int                 mgmtInfoBase[6];
    char                *msgBuffer = NULL;
    size_t              length;
    unsigned char       macAddress[6];
    struct if_msghdr    *interfaceMsgStruct;
    struct sockaddr_dl  *socketStruct;
    NSString            *errorFlag = NULL;
    
    // Setup the management Information Base (mib)
    mgmtInfoBase[0] = CTL_NET;        // Request network subsystem
    mgmtInfoBase[1] = AF_ROUTE;       // Routing table info
    mgmtInfoBase[2] = 0;
    mgmtInfoBase[3] = AF_LINK;        // Request link layer information
    mgmtInfoBase[4] = NET_RT_IFLIST;  // Request all configured interfaces
    
    // With all configured interfaces requested, get handle index
    if ((mgmtInfoBase[5] = if_nametoindex("en0")) == 0)
        errorFlag = @"if_nametoindex failure";
    else
    {
        // Get the size of the data available (store in len)
        if (sysctl(mgmtInfoBase, 6, NULL, &length, NULL, 0) < 0)
            errorFlag = @"sysctl mgmtInfoBase failure";
        else
        {
            // Alloc memory based on above call
            if ((msgBuffer = malloc(length)) == NULL)
                errorFlag = @"buffer allocation failure";
            else
            {
                // Get system information, store in buffer
                if (sysctl(mgmtInfoBase, 6, msgBuffer, &length, NULL, 0) < 0)
                    errorFlag = @"sysctl msgBuffer failure";
            }
        }
    }
    
    // Befor going any further...
    if (errorFlag != NULL)
    {
        NSLog(@"Error: %@", errorFlag);
        return errorFlag;
    }
    
    // Map msgbuffer to interface message structure
    interfaceMsgStruct = (struct if_msghdr *) msgBuffer;
    
    // Map to link-level socket structure
    socketStruct = (struct sockaddr_dl *) (interfaceMsgStruct + 1);
    
    // Copy link layer address data in socket structure to an array
    memcpy(&macAddress, socketStruct->sdl_data + socketStruct->sdl_nlen, 6);
    
    // Read from char array into a string object, into traditional Mac address format
    NSString *macAddressString = [NSString stringWithFormat:@"%02X:%02X:%02X:%02X:%02X:%02X",
                                  macAddress[0], macAddress[1], macAddress[2],
                                  macAddress[3], macAddress[4], macAddress[5]];
    NSLog(@"Mac Address: %@", macAddressString);
    
    // Release the buffer memory
    free(msgBuffer);
    
    return macAddressString;
}


@end
