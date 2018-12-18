//
//  AppMacro.h
//  小工具
//
//  Created by qianhaiboshan on 2018/12/4.
//  Copyright © 2018年 大炮. All rights reserved.
//


#ifndef AppMacro_h
#define AppMacro_h


/*===================================
              App信息
 ===================================*/
/*
#define App           [UIApplication sharedApplication]
#define AppDelegate   ((AppDelegate *)[UIApplication sharedApplication].delegate)
#define AppVersion    [[[NSBundle mainBundle] infoDictionary] objectForKey:@"CFBundleShortVersionString"]
#define AppName       [[[NSBundle mainBundle] infoDictionary] objectForKey:@"CFBundleDisplayName"]
#define Window        [UIApplication sharedApplication].keyWindow
*/


/*===================================
               屏幕宽高
 ===================================*/
#define AppWidth       [UIScreen mainScreen].bounds.size.width
#define AppHeight      [UIScreen mainScreen].bounds.size.height
#define AppBounds      [UIScreen mainScreen].bounds
#define AppRatio       (AppWidth/375.0f)


/*===================================
           状态，导航，TabBar
 ===================================*/
#define StatusH        [[UIApplication sharedApplication] statusBarFrame].size.height //状态高度
#define NavigaBarH     self.navigationController.navigationBar.frame.size.height
#define NavigaH        (StatusH + NavigaBarH) //整个导航栏高度
#define TabbarH        AppHeight > 811.0 ? 83.0 : 49.0 //TabBar高度
#define App(s,g)       (s)-(g)


/*===================================
            手机屏幕尺寸
 ===================================*/
#define iPhone4       (AppWidth == 320 && AppHeight == 480)
#define iPhone5       (AppWidth == 320 && AppHeight == 568)
#define iPhone6       (AppWidth == 375 && AppHeight == 667)
#define iPhone7       (AppWidth == 375 && AppHeight == 667)
#define iPhone8       (AppWidth == 375 && AppHeight == 667)
#define iPhone6P      (AppWidth == 414 && AppHeight == 736)
#define iPhone7P      (AppWidth == 414 && AppHeight == 736)
#define iPhone8P      (AppWidth == 414 && AppHeight == 736)
#define iPhoneX       (AppWidth == 375 && AppHeight == 812)
#define iPhoneXS      (AppWidth == 375 && AppHeight == 812)
#define iPhoneXR      (AppWidth == 414 && AppHeight == 896)
#define iPhoneXSMax   (AppWidth == 414 && AppHeight == 896)



/*===================================
                设备版本
 ===================================*/

#define IOS7             ([[[UIDevice currentDevice] systemVersion] floatValue]>=7.0)
#define IOS8             ([[[UIDevice currentDevice] systemVersion] floatValue]>=8.0)
#define IOS9             ([[[UIDevice currentDevice] systemVersion] floatValue]>=9.0)
#define IOS10            ([[[UIDevice currentDevice] systemVersion] floatValue]>=10.0)
#define IOS11            ([[[UIDevice currentDevice] systemVersion] floatValue]>=11.0)
#define IOS12            ([[[UIDevice currentDevice] systemVersion] floatValue]>=12.0)

/*===================================
               适配大小
 ====================================*/
#define RectMake(x, y, width, height)      CGRectMake((x)*AppRatio, (y)*AppRatio, (width)*AppRatio, (height)*AppRatio)
#define SizeMake(width, height)            CGSizeMake((width)*AppRatio, (height)*AppRatio)
#define PointMake(x, y)                    CGPointMake((x)*AppRatio, (y)*AppRatio)


/*===================================
              数据解析
 ===================================*/
#define Json_list           dic[@"data"][@"info"][@"list"]
#define Json_ret            [dic[@"ret"] intValue]
#define Json_code           [dic[@"data"][@"code"] intValue]


/*===================================
			  软引用self
 ===================================*/
#define Weak_self               __weak typeof(self)      Self = self;


/*===================================
                 颜色
 ===================================*/
// 随机色
#define  RandomColor(a)     [UIColor colorWithRed:arc4random()%256/255.0 green:arc4random()%256/255.0 blue:arc4random()%256/255.0 alpha:(a)]
// RGB颜色
#define RGBColor(r,g,b,a)   [UIColor colorWithRed:(r)/255.0 green:(g)/255.0 blue:(b)/255.0 alpha:(a)]
// 系统白
#define White      [UIColor whiteColor]
// 系统黑
#define Black      [UIColor blackColor]
// 系统灰
#define Gray       [UIColor grayColor]
// 系统轻灰
#define LGray      [UIColor lightGrayColor]
// 红字
#define Red        [UIColor redColor]
// 透明色（无色）
#define Clear      [UIColor clearColor]


/*===================================
                字体大小
 ====================================*/
// 字体
#define Font(s)      [UIFont systemFontOfSize:(s)*AppRatio]
// 粗体
#define BoldFont(s)  [UIFont boldSystemFontOfSize:(s)*AppRatio]


/*===================================
            ActivityView
 ===================================*/
#define Request_Miss     [GCD asyncMainQueue:^{[Show removeHintViewFromSuperview:Window duration:0.3];}];
#define Request_Load     [GCD asyncMainQueue:^{[Show showActivity];}];


/*===================================
               通知Key
 ====================================*/
#define NoticeKey_One       @""
#define NoticeKey_Two       @""


/*===================================
               第三方
 ====================================*/
// 友盟key
#define kUMeng_key        @""
// 微信appid
#define WX_AppID          @"wx0bdef9970ab17333"
// 微信appSecret
#define kWX_appSecret     @""
// QQ_id
#define QQ_AppID          @"101447731"
// QQ_key
#define kQQ_appKey        @""
// 新浪key
#define kWeibo_appKey     @""
// 新浪appSecret
#define kWeibo_appSecret  @""
// 分享标题
#define kShare_title      @""
// 分享内容
#define kShare_contrent   @""
// 分享url
#define kShare_link       @""


/*===================================
              通知Key
 ====================================*/







































#endif
