//
//  HDAlertView.h
//  Seven
//
//  Created by HeDong on 16/9/1.
//  Copyright © 2016年 hedong. All rights reserved.
//

#import <UIKit/UIKit.h>


#ifdef __cplusplus
#define HD_EXTERN        extern "C" __attribute__((visibility ("default")))
#else
#define HD_EXTERN            extern __attribute__((visibility ("default")))
#endif



#define weakSelf(weakSelf) __weak typeof(self)weakSelf = self;
#define strongSelf(strongSelf) __strong typeof(weakSelf)strongSelf = weakSelf; if (!strongSelf) return;


// 由角度获取弧度
#define HDDegreesToRadian(x) (M_PI * (x) / 180.0)
// 由弧度获取角度
#define HDRadianToDegrees(radian) (radian * 180.0) / (M_PI)


#define HDNotificationCenter [NSNotificationCenter defaultCenter]
#define HDUserDefaults [NSUserDefaults standardUserDefaults]
#define HDFirstWindow [UIApplication sharedApplication].windows.firstObject
#define HDRootViewController HDFirstWindow.rootViewController


/******* 效验对象是否是空 *******/
#define HDStringIsEmpty(str) ([str isKindOfClass:[NSNull class]] || str == nil || [str length] < 1 ? YES : NO )
#define HDArrayIsEmpty(array) (array == nil || [array isKindOfClass:[NSNull class]] || array.count == 0)
#define HDDictionaryIsEmpty(dic) (dic == nil || [dic isKindOfClass:[NSNull class]] || dic.allKeys == 0)
#define HDObjectIsEmpty(_object) (_object == nil \
|| [_object isKindOfClass:[NSNull class]] \
|| ([_object respondsToSelector:@selector(length)] && [(NSData *)_object length] == 0) \
|| ([_object respondsToSelector:@selector(count)] && [(NSArray *)_object count] == 0))
/******* 效验对象是否是空 *******/


/******* APP_INFO *******/
/** APP版本号 */
#define HDAppVersion [[[NSBundle mainBundle] infoDictionary] objectForKey:@"CFBundleShortVersionString"]
/** APP BUILD 版本号 */
#define HDAppBuildVersion [[[NSBundle mainBundle] infoDictionary] objectForKey:@"CFBundleVersion"]
/** APP名字 */
#define HDAppDisplayName [[NSBundle mainBundle] objectForInfoDictionaryKey:@"CFBundleDisplayName"]
/** 当前语言 */
#define HDLocalLanguage [[NSLocale currentLocale] objectForKey:NSLocaleLanguageCode]
/** 当前国家 */
#define HDLocalCountry [[NSLocale currentLocale] objectForKey:NSLocaleCountryCode]
/******* APP_INFO *******/


/******* 回到主线程 *******/
#define dispatch_main_sync_safe(block)\
if ([NSThread isMainThread]) {\
block();\
} else {\
dispatch_sync(dispatch_get_main_queue(), block);\
}

#define dispatch_main_async_safe(block)             \
if ([NSThread isMainThread]) {                      \
block();                                            \
} else {                                            \
dispatch_async(dispatch_get_main_queue(), block);   \
}
/******* 回到主线程 *******/


/******* RGB颜色 *******/
#define HDColorAlpha(r, g, b, a) [UIColor colorWithRed:(r) / 255.0 green:(g) / 255.0  blue:(b) / 255.0  alpha:a]
#define HDColor(r, g, b) HDColorAlpha(r, g, b, 1.0)

#define HDColorFromHexAlpha(rgbValue, a) [UIColor colorWithRed:((float)((rgbValue & 0xFF0000) >> 16)) / 255.0 green:((float)((rgbValue & 0xFF00) >> 8)) / 255.0 blue:((float)(rgbValue & 0xFF)) / 255.0 alpha:a]
#define HDColorFromHex(rgbValue) HDColorFromHexAlpha(rgbValue, 1.0)
/******* RGB颜色 *******/


/******* 屏幕尺寸 *******/
#define HDMainScreenWidth [UIScreen mainScreen].bounds.size.width
#define HDMainScreenHeight [UIScreen mainScreen].bounds.size.height
#define HDMainScreenBounds [UIScreen mainScreen].bounds
/******* 屏幕尺寸 *******/


/******* 屏幕系数 *******/
#define HDiPhone6WidthCoefficient(width) (width / 375.0)    // 以苹果6为准的系数
#define HDiPhone6HeightCoefficient(height) (height / 667.0) // 以苹果6为准的系数
#define HDiPhone6ScaleWidth(width) (HDiPhone6WidthCoefficient(width) * HDMainScreenWidth)     // 以苹果6为准的系数得到的宽
#define HDiPhone6ScaleHeight(height) (HDiPhone6HeightCoefficient(height) * HDMainScreenHeight) // 以苹果6为准的系数得到的高
/******* 屏幕系数 *******/


/******* 设备型号和系统 *******/
/** 检查系统版本 */
#define HDSYSTEM_VERSION_EQUAL_TO(v)                  ([[[UIDevice currentDevice] systemVersion] compare:v options:NSNumericSearch] == NSOrderedSame)
#define HDSYSTEM_VERSION_GREATER_THAN(v)              ([[[UIDevice currentDevice] systemVersion] compare:v options:NSNumericSearch] == NSOrderedDescending)
#define HDSYSTEM_VERSION_GREATER_THAN_OR_EQUAL_TO(v)  ([[[UIDevice currentDevice] systemVersion] compare:v options:NSNumericSearch] != NSOrderedAscending)
#define HDSYSTEM_VERSION_LESS_THAN(v)                 ([[[UIDevice currentDevice] systemVersion] compare:v options:NSNumericSearch] == NSOrderedAscending)
#define HDSYSTEM_VERSION_LESS_THAN_OR_EQUAL_TO(v)     ([[[UIDevice currentDevice] systemVersion] compare:v options:NSNumericSearch] != NSOrderedDescending)

#define iOS5_OR_LATER  HDSYSTEM_VERSION_GREATER_THAN_OR_EQUAL_TO(@"5.0")
#define iOS6_OR_LATER  HDSYSTEM_VERSION_GREATER_THAN_OR_EQUAL_TO(@"6.0")
#define iOS7_OR_LATER  HDSYSTEM_VERSION_GREATER_THAN_OR_EQUAL_TO(@"7.0")
#define iOS8_OR_LATER  HDSYSTEM_VERSION_GREATER_THAN_OR_EQUAL_TO(@"8.0")
#define iOS9_OR_LATER  HDSYSTEM_VERSION_GREATER_THAN_OR_EQUAL_TO(@"9.0")
#define iOS10_OR_LATER HDSYSTEM_VERSION_GREATER_THAN_OR_EQUAL_TO(@"10.0")

/** 系统和版本号 */
#define HDDevice [UIDevice currentDevice]
#define HDDeviceName HDDevice.name                           // 设备名称
#define HDDeviceModel HDDevice.model                         // 设备类型
#define HDDeviceLocalizedModel HDDevice.localizedModel       // 本地化模式
#define HDDeviceSystemName HDDevice.systemName               // 系统名字
#define HDDeviceSystemVersion HDDevice.systemVersion         // 系统版本
#define HDDeviceOrientation HDDevice.orientation             // 设备朝向
//#define HDDeviceUUID HDDevice.identifierForVendor.UUIDString // UUID // 使用苹果不让上传App Store!!!
#define HDiOS8 ([HDDeviceSystemVersion floatValue] >= 8.0)   // iOS8以上
#define HDiPhone ([HDDeviceModel rangeOfString:@"iPhone"].length > 0)
#define HDiPod ([HDDeviceModel rangeOfString:@"iPod"].length > 0)
#define HDiPad (HDDevice.userInterfaceIdiom == UIUserInterfaceIdiomPad)
/******* 设备型号和系统 *******/


/******* 日志打印替换 *******/
//#import <CocoaLumberjack/CocoaLumberjack.h>
#ifdef DEBUG

//#define HDLog(frmt, ...) LOG_MAYBE(LOG_ASYNC_ENABLED, LOG_LEVEL_DEF, DDLogFlagVerbose, 0, nil, __PRETTY_FUNCTION__, frmt, ##__VA_ARGS__)
//
//#define HDLogError(frmt, ...)   LOG_MAYBE(NO,                LOG_LEVEL_DEF, DDLogFlagError,   0, nil, __PRETTY_FUNCTION__, frmt, ##__VA_ARGS__)
//
//#define HDLogWarn(frmt, ...)    LOG_MAYBE(LOG_ASYNC_ENABLED, LOG_LEVEL_DEF, DDLogFlagWarning, 0, nil, __PRETTY_FUNCTION__, frmt, ##__VA_ARGS__)
//
//#define HDLogInfo(frmt, ...)    LOG_MAYBE(LOG_ASYNC_ENABLED, LOG_LEVEL_DEF, DDLogFlagInfo,    0, nil, __PRETTY_FUNCTION__, frmt, ##__VA_ARGS__)
//
//#define HDLogDebug(frmt, ...)   LOG_MAYBE(LOG_ASYNC_ENABLED, LOG_LEVEL_DEF, DDLogFlagDebug,   0, nil, __PRETTY_FUNCTION__, frmt, ##__VA_ARGS__)
//
//#define HDLogVerbose(frmt, ...) LOG_MAYBE(LOG_ASYNC_ENABLED, LOG_LEVEL_DEF, DDLogFlagVerbose, 0, nil, __PRETTY_FUNCTION__, frmt, ##__VA_ARGS__)


#define HDAssert(...) NSAssert(__VA_ARGS__)
#define HDParameterAssert(condition) NSAssert((condition), @"Invalid parameter not satisfying: %@", @#condition)

//static const int ddLogLevel = LOG_LEVEL_VERBOSE;

#else

#define HDLog(...)
#define HDLogError(frmt, ...)
#define HDLogWarn(frmt, ...)
#define HDLogInfo(frmt, ...)
#define HDLogDebug(frmt, ...)

#define HDAssert(...)
#define HDParameterAssert(condition)
//static const int ddLogLevel = LOG_LEVEL_OFF;

#endif
/******* 日志打印替换 *******/


/******* 归档解档 *******/
#define HDCodingImplementation                              \
- (void)encodeWithCoder:(NSCoder *)aCoder {                 \
unsigned int count = 0;                                     \
Ivar *ivars = class_copyIvarList([self class], &count);     \
for (int i = 0; i < count; i++) {                           \
Ivar ivar = ivars[i];                                       \
const char *name = ivar_getName(ivar);                      \
NSString *key = [NSString stringWithUTF8String:name];       \
id value = [self valueForKey:key];                          \
[aCoder encodeObject:value forKey:key];                     \
}                                                           \
free(ivars);                                                \
}                                                           \
\
- (instancetype)initWithCoder:(NSCoder *)aDecoder {         \
if (self = [super init]) {                                  \
unsigned int count = 0;                                     \
Ivar *ivars = class_copyIvarList([self class], &count);     \
for (int i = 0; i < count; i++) {                           \
Ivar ivar = ivars[i];                                       \
const char *name = ivar_getName(ivar);                      \
NSString *key = [NSString stringWithUTF8String:name];       \
id value = [aDecoder decodeObjectForKey:key];               \
[self setValue:value forKey:key];                           \
}                                                           \
free(ivars);                                                \
}                                                           \
return self;                                                \
}
/******* 归档解档 *******/








HD_EXTERN NSString *const HDAlertViewWillShowNotification;
HD_EXTERN NSString *const HDAlertViewDidShowNotification;
HD_EXTERN NSString *const HDAlertViewWillDismissNotification;
HD_EXTERN NSString *const HDAlertViewDidDismissNotification;

typedef NS_ENUM(NSInteger, HDAlertViewStyle) {
    HDAlertViewStyleAlert = 0,  // 默认
    HDAlertViewStyleActionSheet
};

typedef NS_ENUM(NSInteger, HDAlertViewButtonType) {
    HDAlertViewButtonTypeDefault = 0,   // 字体默认蓝色
    HDAlertViewButtonTypeDestructive,   // 字体默认红色
    HDAlertViewButtonTypeCancel         // 字体默认绿色
};

typedef NS_ENUM(NSInteger, HDAlertViewBackgroundStyle) {
    HDAlertViewBackgroundStyleSolid = 0,    // 平面的
    HDAlertViewBackgroundStyleGradient      // 聚光的
};

typedef NS_ENUM(NSInteger, HDAlertViewButtonsListStyle) {
    HDAlertViewButtonsListStyleNormal = 0,
    HDAlertViewButtonsListStyleRows // 每个按钮都是一行
};

typedef NS_ENUM(NSInteger, HDAlertViewTransitionStyle) {
    HDAlertViewTransitionStyleFade = 0,             // 渐退
    HDAlertViewTransitionStyleSlideFromTop,         // 从顶部滑入滑出
    HDAlertViewTransitionStyleSlideFromBottom,      // 从底部滑入滑出
    HDAlertViewTransitionStyleBounce,               // 弹窗效果
    HDAlertViewTransitionStyleDropDown              // 顶部滑入底部滑出
};

@class HDAlertView;
typedef void(^HDAlertViewHandler)(HDAlertView *alertView);

@interface HDAlertView : UIView

/** 是否支持旋转 */
@property (nonatomic, assign) BOOL isSupportRotating;

/** 图标的名字 */
@property (nonatomic, copy) NSString *imageName;

@property (nonatomic, copy) NSString *title; // ActionSheet模式最多2行
@property (nonatomic, copy) NSString *message;
@property (nonatomic, assign) NSTextAlignment titleTextAlignment;
@property (nonatomic, assign) NSTextAlignment messageTextAlignment;


@property (nonatomic, assign) HDAlertViewStyle alertViewStyle;              // 默认是HDAlertViewStyleAlert
@property (nonatomic, assign) HDAlertViewTransitionStyle transitionStyle;   // 默认是 HDAlertViewTransitionStyleFade
@property (nonatomic, assign) HDAlertViewBackgroundStyle backgroundStyle;   // 默认是 HDAlertViewBackgroundStyleSolid
@property (nonatomic, assign) HDAlertViewButtonsListStyle buttonsListStyle; // 默认是 HDAlertViewButtonsListStyleNormal

@property (nonatomic, copy) HDAlertViewHandler willShowHandler;
@property (nonatomic, copy) HDAlertViewHandler didShowHandler;
@property (nonatomic, copy) HDAlertViewHandler willDismissHandler;
@property (nonatomic, copy) HDAlertViewHandler didDismissHandler;

@property (nonatomic, strong) UIColor *viewBackgroundColor          UI_APPEARANCE_SELECTOR; // 默认是clearColor
@property (nonatomic, strong) UIColor *titleColor                   UI_APPEARANCE_SELECTOR; // 默认是blackColor
@property (nonatomic, strong) UIColor *messageColor                 UI_APPEARANCE_SELECTOR; // 默认是darkGrayColor
@property (nonatomic, strong) UIColor *defaultButtonTitleColor      UI_APPEARANCE_SELECTOR; // 默认是blueColor
@property (nonatomic, strong) UIColor *cancelButtonTitleColor       UI_APPEARANCE_SELECTOR; // 默认是greenColor
@property (nonatomic, strong) UIColor *destructiveButtonTitleColor  UI_APPEARANCE_SELECTOR; // 默认是redColor
@property (nonatomic, strong) UIFont *titleFont                     UI_APPEARANCE_SELECTOR; // 默认是bold 18.0
@property (nonatomic, strong) UIFont *messageFont                   UI_APPEARANCE_SELECTOR; // 默认是system 16.0
@property (nonatomic, strong) UIFont *buttonFont                    UI_APPEARANCE_SELECTOR; // 默认是bold buttonFontSize
@property (nonatomic, assign) CGFloat cornerRadius                  UI_APPEARANCE_SELECTOR; // 默认是10.0


/**
 *  设置默认按钮图片和状态
 */
- (void)setDefaultButtonImage:(UIImage *)defaultButtonImage forState:(UIControlState)state  UI_APPEARANCE_SELECTOR;

/**
 *  设置取消按钮图片和状态
 */
- (void)setCancelButtonImage:(UIImage *)cancelButtonImage forState:(UIControlState)state    UI_APPEARANCE_SELECTOR;

/**
 *  设置毁灭性按钮图片和状态
 */
- (void)setDestructiveButtonImage:(UIImage *)destructiveButtonImage forState:(UIControlState)state  UI_APPEARANCE_SELECTOR;

/**
 *  初始化一个弹窗提示
 */
- (instancetype)initWithTitle:(NSString *)title andMessage:(NSString *)message;
+ (instancetype)alertViewWithTitle:(NSString *)title andMessage:(NSString *)message;

/**
 *  添加按钮点击时候和处理
 *
 *  @param title   按钮名字
 *  @param type    按钮类型
 *  @param handler 点击按钮处理事件
 */
- (void)addButtonWithTitle:(NSString *)title type:(HDAlertViewButtonType)type handler:(HDAlertViewHandler)handler;

/**
 *  显示弹窗提示
 */
- (void)show;

/**
 *  移除视图
 */
- (void)removeAlertView;

/**
 快速弹窗
 
 @param title 标题
 @param message 消息体
 @param cancelButtonTitle 取消按钮文字
 @param otherButtonTitles 其他按钮
 @param block 回调
 @return 返回HDAlertView对象
 */
+ (HDAlertView *)showAlertViewWithTitle:(NSString *)title message:(NSString *)message cancelButtonTitle:(NSString *)cancelButtonTitle otherButtonTitles:(NSArray<NSString *> *)otherButtonTitles handler:(void (^)(HDAlertView *alertView, NSInteger buttonIndex))block;

/**
 ActionSheet样式弹窗
 
 @param title 标题
 @return 返回HBAlertView对象
 */
+ (HDAlertView *)showActionSheetWithTitle:(NSString *)title;
















































/*
=======================================================
样式一
HDAlertView *alertView = [HDAlertView showActionSheetWithTitle:@"是否退出XXX是否退出XXX是否退出XXX是否退出XXX是否退出XXX是否退出XXX是否退出XXX是否退出XXX是否退出XXX是否退出XXX是否退出XXX是否退出XXX是否退出XXX是否退出XXX是否退出XXX是否退出XXX是否退出XXX是否退出XXX是否退出XXX是否退出XXX"];
[alertView addButtonWithTitle:@"退出" type:HDAlertViewButtonTypeCancel handler:^(HDAlertView *alertView) {
    
}];
[alertView addButtonWithTitle:@"确定" type:HDAlertViewButtonTypeDefault handler:^(HDAlertView *alertView) {
    
}];
[alertView addButtonWithTitle:@"好的" type:HDAlertViewButtonTypeDefault handler:^(HDAlertView *alertView) {
    
}];
[alertView show];

=======================================================
样式二
[HDAlertView showAlertViewWithTitle:nil message:@"是否退出XXX是否退出XXX是否退出XXX是否退出XXX是否退出XXX是否退出XXX是否退出XXX是否退出XXX是否退出XXX是否退出XXX" cancelButtonTitle:@"取消" otherButtonTitles:@[@"好的", @"好的", @"好的"] handler:^(HDAlertView *alertView, NSInteger buttonIndex) {
    
}];

=======================================================
样式三
HDAlertView *alertView = [HDAlertView alertViewWithTitle:@"样式1" andMessage:@"~\(≧▽≦)/~啦啦啦"];
alertView.isSupportRotating = YES;
[alertView addButtonWithTitle:@"确定" type:HDAlertViewButtonTypeDefault handler:^(HDAlertView *alertView) {
    NSLog(@"styleOne");
}];
[alertView show];

=======================================================
样式四
HDAlertView *alertView = [HDAlertView alertViewWithTitle:@"样式2" andMessage:@"~\(≧▽≦)/~啦啦啦"];
alertView.isSupportRotating = YES;
[alertView addButtonWithTitle:@"确定" type:HDAlertViewButtonTypeDefault handler:^(HDAlertView *alertView) {
    NSLog(@"styleTwo 确定");
}];
[alertView addButtonWithTitle:@"取消" type:HDAlertViewButtonTypeDefault handler:^(HDAlertView *alertView) {
    NSLog(@"styleTwo 取消");
}];
[alertView show];


=======================================================
样式五
HDAlertView *alertView = [HDAlertView alertViewWithTitle:@"样式3" andMessage:@"~\(≧▽≦)/~啦啦啦"];
alertView.buttonsListStyle = HDAlertViewButtonsListStyleRows;
alertView.isSupportRotating = YES;

[alertView addButtonWithTitle:@"确定" type:HDAlertViewButtonTypeDefault handler:^(HDAlertView *alertView) {
    NSLog(@"styleThree 确定");
}];

[alertView addButtonWithTitle:@"取消" type:HDAlertViewButtonTypeDefault handler:^(HDAlertView *alertView) {
    NSLog(@"styleThree 取消");
}];

[alertView show];

=======================================================
样式六
HDAlertView *alertView = [HDAlertView alertViewWithTitle:@"样式4" andMessage:@"~\(≧▽≦)/~啦啦啦~\(≧▽≦)/~啦啦啦~\(≧▽≦)/~啦啦啦~\(≧▽≦)/~啦啦啦~\(≧▽≦)/~啦啦啦~\(≧▽≦)/~啦啦啦~\(≧▽≦)/~啦啦啦~\(≧▽≦)/~啦啦啦~\(≧▽≦)/~啦啦啦~\(≧▽≦)/~啦啦啦"];
alertView.isSupportRotating = YES;

[alertView addButtonWithTitle:@"确定" type:HDAlertViewButtonTypeDefault handler:^(HDAlertView *alertView) {
    NSLog(@"styleFour 确定");
}];
[alertView addButtonWithTitle:@"取消" type:HDAlertViewButtonTypeDefault handler:^(HDAlertView *alertView) {
    NSLog(@"styleFour 取消");
}];
[alertView addButtonWithTitle:@"来呀" type:HDAlertViewButtonTypeDefault handler:^(HDAlertView *alertView) {
    NSLog(@"styleFour 来呀");
}];
[alertView addButtonWithTitle:@"互相" type:HDAlertViewButtonTypeCancel handler:^(HDAlertView *alertView) {
    NSLog(@"styleFour 互相");
}];
[alertView addButtonWithTitle:@"伤害" type:HDAlertViewButtonTypeDestructive handler:^(HDAlertView *alertView) {
    NSLog(@"styleFour 伤害");
}];
[alertView show];



=======================================================
样式七
HDAlertView *alertView = [HDAlertView alertViewWithTitle:@"样式5" andMessage:@"其他的自己写着玩吧~~~"];
alertView.transitionStyle = HDAlertViewTransitionStyleDropDown;
alertView.backgroundStyle = HDAlertViewBackgroundStyleGradient;
alertView.isSupportRotating = YES;
[alertView addButtonWithTitle:@"确定" type:HDAlertViewButtonTypeDefault handler:^(HDAlertView *alertView) {
    NSLog(@"styleFive");
}];
[alertView show];


=======================================================
样式八
HDAlertView *alertView = [HDAlertView alertViewWithTitle:@"真的没了" andMessage:@"不骗你, 真的最后一个了"];
alertView.transitionStyle = HDAlertViewTransitionStyleFade;
alertView.isSupportRotating = YES;

[alertView addButtonWithTitle:@"确定" type:HDAlertViewButtonTypeDefault handler:^(HDAlertView *alertView) {
    NSLog(@"styleSix 1");
}];

[alertView show];

=======================================================
样式九
HDAlertView *alertView1 = [HDAlertView alertViewWithTitle:@"最后一个" andMessage:@"点了就没了"];
alertView1.transitionStyle = HDAlertViewTransitionStyleSlideFromTop;
alertView1.isSupportRotating = YES;

[alertView1 addButtonWithTitle:@"确定" type:HDAlertViewButtonTypeDefault handler:^(HDAlertView *alertView) {
    NSLog(@"styleSix 2");
}];

[alertView1 show];


=======================================================
样式十
HDAlertView *alertView2 = [HDAlertView alertViewWithTitle:@"没有惊喜" andMessage:@"哈哈, 骗你的, 没有惊喜"];
alertView2.transitionStyle = HDAlertViewTransitionStyleSlideFromBottom;
alertView2.isSupportRotating = YES;

[alertView2 addButtonWithTitle:@"确定" type:HDAlertViewButtonTypeDefault handler:^(HDAlertView *alertView) {
    NSLog(@"styleSix 3");
}];

[alertView2 show];


=======================================================
样式十一
HDAlertView *alertView3 = [HDAlertView alertViewWithTitle:@"惊喜往往在后面" andMessage:@"再次点击就告诉你"];
alertView3.isSupportRotating = YES;
alertView3.transitionStyle = HDAlertViewTransitionStyleBounce;
alertView3.backgroundStyle = HDAlertViewBackgroundStyleGradient;

[alertView3 addButtonWithTitle:@"确定" type:HDAlertViewButtonTypeDefault handler:^(HDAlertView *alertView) {
    NSLog(@"styleSix 4");
}];

[alertView3 show];


=======================================================
样式十二
HDAlertView *alertView4 = [HDAlertView alertViewWithTitle:@"有个秘密告诉你" andMessage:@"确定之后会有意外惊喜"];
alertView4.transitionStyle = HDAlertViewTransitionStyleDropDown;
alertView4.backgroundStyle = HDAlertViewBackgroundStyleGradient;
alertView4.isSupportRotating = YES;

[alertView4 addButtonWithTitle:@"确定" type:HDAlertViewButtonTypeDefault handler:^(HDAlertView *alertView) {
    NSLog(@"styleSix 5");
}];

[alertView4 show];

*/












@end
