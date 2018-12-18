//
//  UIView+StrPicker.h
//  OC工具类
//
//  Created by 汤圆 on 2018/5/23.
//  Copyright © 2018年 汤圆. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <objc/runtime.h>


#define AppWidth       [UIScreen mainScreen].bounds.size.width
#define AppHeight      [UIScreen mainScreen].bounds.size.height
#define AppBounds      [UIScreen mainScreen].bounds
#define AppRatio       (AppWidth/375.0f)
#define Window        [UIApplication sharedApplication].keyWindow

#define RGBColor(r,g,b,a)   [UIColor colorWithRed:(r)/255.0 green:(g)/255.0 blue:(b)/255.0 alpha:(a)]

// PickerTime回调
typedef void(^PickTime)(NSString *str);
@interface UIView (StrPicker) <UIPickerViewDelegate,UIPickerViewDataSource>









/*******************************************
                PickerTime
 *******************************************/
-(void)showPickerTime:(PickTime)pickTime;

/*******************************************
                PickerStr
 *******************************************/
-(void)showPickerStyArray:(NSArray *)arr PickStr:(PickTime)pickStr;

/*******************************************
                PickerAddress
 *******************************************/
-(void)showAddress:(PickTime)pickaddress;



@end
