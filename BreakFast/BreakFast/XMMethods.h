//
//  XMMethods.h
//  XMProject
//
//  Created by admin on 14-3-17.
//  Copyright (c) 2014年 admin. All rights reserved.
//

#define COLOR(R,G,B)      [UIColor colorWithRed:R/255.0f green:G/255.0f blue:B/255.0f alpha:1]
#define COLORA(R,G,B,A)   [UIColor colorWithRed:R/255.0f green:G/255.0f blue:B/255.0f alpha:A]

#define WHITECOLOR        [UIColor whiteColor]
#define BLACKCOLOR        [UIColor blackColor]
#define YELLOWCOLOR       [UIColor yellowColor]
#define GRAYCOLOR         [UIColor grayColor]
#define DARKGRAY          [UIColor darkGrayColor]
#define LIGHTGRAY         [UIColor lightGrayColor]
#define BLUECOLOR         [UIColor blueColor]
#define REDCOLOR          [UIColor redColor]
#define BROWNCOLOR        [UIColor brownColor]
#define GREENCOLOR        [UIColor greenColor]
#define CLEARCOLOR        [UIColor clearColor]


#define SYSTME_VERSION [UIDevice currentDevice].systemVersion.floatValue
#define DEVICE_BOUNDS [[UIScreen mainScreen] bounds]
#define DEVICE_SIZE [[UIScreen mainScreen] bounds].size
#define iPhone5 ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(640, 1136), [[UIScreen mainScreen] currentMode].size) : NO)

#define XIAO_MA_VERSION [[[NSBundle mainBundle]infoDictionary]objectForKey:@"CFBundleShortVersionString"]



#define NSLOG_RECT(A)  NSLog(@"%@",NSStringFromCGRect(A))
#define NSLOG_POINT(A) NSLog(@"%@",NSStringFromCGPoint(A))
#define NSLOG_SIZE(A) NSLog(@"%@",NSStringFromCGSize(A))

#define DATE_CHINA_SHORT @"yyyy年MM月dd日"
#define DATE_CHINA_LONG @"yyyy年MM月dd日HH时mm分ss秒"
#define DATE_SHORT @"yyyy-MM-dd"
#define DATE_LONG @"yyyy-MM-dd HH:mm:ss"
#define DATE_SIMPLE_SHORT @"yyyyMMdd"
#define DATE_SIMPLE_LONG @"yyyyMMddHHmmss"

#define DATE_TEST @"dd:HH:mm:ss"


#define DIC(TITLE,CONTENT) [NSDictionary dictionaryWithObjectsAndKeys:TITLE,@"title",CONTENT,@"content", nil]

#define REFRESH_HEADER_HEIGHT 52.0f

typedef void(^DismissBlock)(int buttonIndex);
typedef void(^CancleBlock)();


@interface XMMethods : NSObject<UIAlertViewDelegate>


+(NSDate *)test:(NSString *)test;

#pragma mark-
#pragma mark------视图相关的方法------
/*视图相关的方法
 *
 */
+(void)alertMessage:(NSString *)message;
//移动view的x位置
+(void)moveX:(UIView *)view x:(CGFloat)x;

//移动view的y位置
+(void)moveY:(UIView *)view y:(CGFloat)y;
//改变view的长度
+(void)changeLength:(UIView *)view length:(CGFloat)length;
//将view的长度变成
+(void)changeLength:(UIView *)view toLength:(CGFloat)length;
//试图相对于另外一个试图的下方坐标
+(void)view:(UIView *)view1 distance:(CGFloat)distance underView:(UIView *)view2;
//试图相对于另外一个试图的上方坐标
+(void)view:(UIView *)view1 distance:(CGFloat)distance upView:(UIView *)view2;
//试图相对于另外一个试图的左边坐标
+(void)view:(UIView *)view1 distance:(CGFloat)distance leftView:(UIView *)view2;
//试图相对于另外一个试图的右边坐标
+(void)view:(UIView *)view1 distance:(CGFloat)distance rightView:(UIView *)view2;


//活得特定rect的中点
+(CGPoint)centerPoint:(CGRect)rect;

//获得空白区域的尺寸
+(CGSize)blankSizeWithBottomSize:(CGSize)bottomSize topSize:(CGSize)topSize;
//获得空白区域的rect
+(CGRect)blankRectWithBottomSize:(CGSize)bottomSize topSize:(CGSize)topSize;
//将视图保存为图片
+(UIImage *)toImageWithView:(UIView *)view;
//添加网络指示器
+(void)showActivityViewInView:(UIView *)view;
//移除网络指示器
+(void)removeActivityViewInView:(UIView *)view;

//添加带透明遮罩网络指示器
+(void)showActivityViewInViewAndMask:(UIView *)view;
//移除带透明遮罩网络指示器
+(void)removeActivityViewInViewAndMask:(UIView *)view;

//添加网络指示器到window上是状态栏上的那个小的一笔的网络指示器
+(void)showActivityViewInWindow;
//从window上移除网络指示器
+(void)removeActivityViewInWindow;

//添加带透明遮罩网络指示器到window上是状态栏上的那个小的一笔的网络指示器
+(void)showActivityViewInWindowAndMask;
//从window上移除带透明遮罩网络指示器
+(void)removeActivityViewInWindowAndMask;

//固定高度下根据字数和font得到label的长度
+(CGFloat)label:(UILabel *)label widthByString:(NSString *)str;
//固定长度下根据字数和font得到label的高度
+(CGFloat)label:(UILabel *)label heightByString:(NSString *)str;

//固定高度下根据字数和font得到label的高度
+(CGFloat)font:(UIFont *)font heightByString:(NSString *)str withWidth:(CGFloat)width;


#pragma mark-
#pragma mark------date------
/*时间相关的方法
 *
 */
//处理时间的相关方法
//将NSDate转换成NSString
+(NSString *)dateToStr:(NSDate *)date withFormat:(NSString *)format;
//将NSString转换成NSDate
+(NSDate *)strToDate:(NSString *)str withFormat:(NSString *)format;
//转换时间的便捷方法
+(NSString *)dateToStrShort:(NSDate *)date;
+(NSString *)dateToStrLong:(NSDate *)date;
+(NSDate *)strShortToDate:(NSString *)str;
+(NSDate *)strLongToDate:(NSString *)str;
+(NSString *)dateToStrShortChina:(NSDate *)date;
+(NSString *)dateToStrLongChina:(NSDate *)date;
+(NSDate *)strShortChinaToDate:(NSString *)str;
+(NSDate *)strLongChinaToDate:(NSString *)str;
//将日期转换成星期几
+(NSString *)weekNameFromDate:(NSDate *)date;
//比较两个日期的大小
+(BOOL)dateLessOrEqualWithStart:(NSDate *)start end:(NSDate *)end;
//判断起始日期距离终止日期的时间是否在month内
+(BOOL)dateInRangeWithStart:(NSDate *)start end:(NSDate *)end months:(NSInteger)months;
//起始日期在终止日期的半年内
+(BOOL)dateInHalfYearWithStart:(NSDate *)start end:(NSDate *)end;
//起始日期在终止日期的1年内
+(BOOL)dateInOneYearWithStart:(NSDate *)start end:(NSDate *)end;

//两个时间之间一共还有多少天
+(NSString *)daysBetween:(NSString *)start end:(NSString *)end;


#pragma mark-
#pragma mark------文件相关的方法------
/*文件相关的方法
 *
 */
//document目录路径
+(NSString *)documentPath;
+(NSString *)documentPathOfFile:(NSString *)fileName;


#pragma mark-
#pragma mark------动画相关的方法------
/*动画相关的方法
 *
 */
//抖动
+(void)ShakeView:(UIView *)view;


#pragma mark-
#pragma mark------数据处理相关的方法------
/*数据处理相关的方法
 *
 */
//为金额添加，分隔符和.分隔符，count控制小数点后位数
+(NSString *)toCashWithCommaAndDot:(NSString *)cash decimlCount:(NSInteger)count;
//为金额添加,和.小数点后默认两位
+(NSString *)toCashWithCommaAndDot:(NSString *)cash;
//将金额转换成中文金额
+(NSString *) toChineseCash:(NSString *)cash ;
//判断str是否为空，包括空格，NULL,@""
+(BOOL)isNull:(NSString *)str;
+(BOOL)isNullWithEmpty:(NSString *)str;
//隐藏部分字符用*号代替
+(NSString *)hideString:(NSString *)str count:(NSInteger)count;
//隐藏手机号码
+(NSString *)hidePhoneNumber:(NSString *)number;
//将小数转化为字符串，小数位数为dotLen，整数部分每隔spliLen用逗号分开
+(NSString *)floatToStr:(CGFloat)v dotLen:(NSInteger) dotLen splitLen:(NSInteger) splitLen;

//将代逗号的字符串转成不带字符串的
+(NSString *)stringToNoComma:(NSString *)str;
#pragma mark-
#pragma mark------正则表达式的相关方法------

/*正则表达式的通用方法
 *参数：str为需要匹配的字符串，regex为匹配规则
 *返回值：BOOL值，匹配是否成功
 */
+(BOOL)predicateMatchWithString:(NSString *)str regex:(NSString *)regex;
+(BOOL)isMobilePhone:(NSString *)mobileNumber;//判断是否是手机号，目前判断的号段为13，15，18，17号段
+(BOOL)isEmail:(NSString *)email;//判断是否是邮箱
+(BOOL)isMoneyAvailable:(NSString *)money;//判断钱输入是否正确,最多输入小数点后2位
+(BOOL)isNumber:(NSString *)number;//判断是否全部为数字
+(BOOL)isEnglishCharactor:(NSString *)englishCharactor;//判断是否全部是英文
+(BOOL)isEnglishCharactorAndNumbers:(NSString *)target;//判断是否全部是英文和数字的集合
+(BOOL)isPasswordsAvailable:(NSString *)passwords;
+(BOOL)isMoneyRight:(NSString *)money;//判断金额的格式是否正确
+(NSString*)stringToReplace:(NSString*)str;//手机号或者用户名，替换*号

#pragma mark------
#pragma mark------创建类的一些方法------

+(id)objeFromName:(NSString *)name;
+(SEL)selFromName:(NSString *)name;

#pragma mark-
#pragma mark------设备的一些方法------
+(BOOL)callXiaoMaBank;

+(NSString *)getWANIIPAdress;//获取外网IP

+(NSString *)getIPAdress;//获取内网IP
+ (NSString *)getMacAddress;//获取mac地址
+(NSString *)addComma:(NSString *)srcString;
+(NSArray *)arrayFromDictionary:(NSDictionary *)dic withKeyRank:(NSArray *)rankKeys;
@end
