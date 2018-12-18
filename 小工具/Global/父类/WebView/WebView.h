//
//  WebView.h
//  工具类
//
//  Created by 汤圆 on 2018/4/28.
//  Copyright © 2018年 汤圆. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "WebViewManage.h"


// RGB颜色透明度
#define RGBColor(r,g,b,a)   [UIColor colorWithRed:(r)/255.0 green:(g)/255.0 blue:(b)/255.0 alpha:(a)]
#define StatusHeight  [[UIApplication sharedApplication] statusBarFrame].size.height //状态栏高度
#define NavigaHeight (StatusHeight + 44.0) //整个导航栏高度
#define AppWidth       [UIScreen mainScreen].bounds.size.width
#define AppHeight      [UIScreen mainScreen].bounds.size.height


@interface WebView : UIViewController 

@property (nonatomic ,strong)WKWebView * wkWebView;// 主控件
@property (nonatomic ,strong)NSString *urlStr;// URL
@property (nonatomic,strong) UIButton * backButton;// 返回
@property (nonatomic,strong) UIButton * closeButton;// 关闭

/*  NO:禁止
 *  YES:不禁止
 */
@property (nonatomic ,assign)BOOL ZoomBool;// 是否禁止放大缩小
/*  NO:隐藏
 *  YES:不隐藏
 */
@property (nonatomic ,assign)BOOL ButBool;//  是否隐藏关闭按键



// 开载URL
-(void)requestUrl;
// 禁止页面放大缩小
- (void)banZoominOn;

// js交互  JS调用OC代码
- (void)JSExchangeNameArr:(NSArray *)name handle:(WebViewBlcok)Body;


/**OC调js方法  方法名、参数
 例：js方法名alertMobile()
 1.不需要参数： hanleName = @"alertMobile()"
 2.需要参数：
 如：参数  NSString * str = @"哈哈哈哈哈";
          hanleName = @"alertMobile('str')"
 */
// js交互  OC调用JS代码
-(void)OCExchangeOCString:(NSString *)Str;



@end
