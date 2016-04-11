//
//  ConfigDefine.h
//  NeiTao
//
//  Created by 崔小雨 on .
//  Copyright (c) 2016年 . All rights reserved.
//


#define RGB(r, g, b)        [UIColor colorWithRed:(r)/255.f green:(g)/255.f blue:(b)/255.f alpha:1.f]
#define RGBA(r, g, b, a)    [UIColor colorWithRed:(r)/255.0f green:(g)/255.0f blue:(b)/255.0f alpha:a]
#define XMPP_DOMAIN @"121.41.21.184"







#define HUDDefaultShowTime 1.7  //HUD显示时间

#define NHverifyTime 60  //验证码发送倒计时

#define NHHttpRequsetTimeOutInterval 180    //网络请求时间限制




#define SYSTEM_VERSION_EQUAL_TO(v)                  ([[[UIDevice currentDevice] systemVersion] compare:v options:NSNumericSearch] == NSOrderedSame)
#define SYSTEM_VERSION_GREATER_THAN(v)              ([[[UIDevice currentDevice] systemVersion] compare:v options:NSNumericSearch] == NSOrderedDescending)
#define SYSTEM_VERSION_GREATER_THAN_OR_EQUAL_TO(v)  ([[[UIDevice currentDevice] systemVersion] compare:v options:NSNumericSearch] != NSOrderedAscending)
#define SYSTEM_VERSION_LESS_THAN(v)                 ([[[UIDevice currentDevice] systemVersion] compare:v options:NSNumericSearch] == NSOrderedAscending)
#define SYSTEM_VERSION_LESS_THAN_OR_EQUAL_TO(v)     ([[[UIDevice currentDevice] systemVersion] compare:v options:NSNumericSearch] != NSOrderedDescending)

#define OS_V_GREATER_OR_EQUAL_7 SYSTEM_VERSION_GREATER_THAN_OR_EQUAL_TO(@"7.0")
#define OS_V_GREATER_OR_EQUAL_8 SYSTEM_VERSION_GREATER_THAN_OR_EQUAL_TO(@"8.0")

#ifdef DEBUG
#define Log(format, ...) NSLog(format, ## __VA_ARGS__)
#else
#define Log(format, ...) //NSLog(format, ## __VA_ARGS__)
#endif

/***************************** 设备判断 ******************************/

//判断iphone6
#define ISIPhone6 ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(750, 1334), [[UIScreen mainScreen] currentMode].size) : NO)

// iphone6 476X667
// iphone6+ 414x736

//判断iphone6+
#define ISIPhone6Plus ([UIScreen mainScreen].bounds.size.width) == 414?YES:NO


/***************************** 通知名称 ******************************/



/***************************** UI相关 ******************************/
#define kWinSize [UIScreen mainScreen].bounds.size
#define NHKeyWindow  [UIApplication sharedApplication].keyWindow


/***************************** 错误提示 ****************************/
#define ErrorMsg_Network @"网络未连接，请检查您的网络"
#define ErrorMsg_Server @"服务器开了个小差, 请重新试一下咯!"



/***************************** 具体 ****************************/

#define PasswordLengthMax 15    //密码的最大长度
#define PasswordLengthMin 6 //密码的最小长度
#define NickLengthMax 10    //昵称的最大长度
#define NHPageSize 8    //每一页的大小
#define YNBarItemWidth  50  //默认navigationBarItem宽度


/***************************** 其他 ****************************/

//忽略 performSelector may cause a leak because its selector is unknown"警告
#define SuppressPerformSelectorLeakWarning(Stuff) \
do { \
_Pragma("clang diagnostic push") \
_Pragma("clang diagnostic ignored \"-Warc-performSelector-leaks\"") \
Stuff; \
_Pragma("clang diagnostic pop") \
} while (0)


