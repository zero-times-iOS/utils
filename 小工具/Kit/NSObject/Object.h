//
//  Object.h
//  OC工具类
//
//  Created by 汤圆 on 2018/4/23.
//  Copyright © 2018年 汤圆. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "sys/utsname.h"

@interface Object : NSObject


/*****************************
            时间相关
 *****************************/
/**
 *  获取当前时间
 */
+(NSString*)getTime;
/**
 *  获取昨天时间
 */
+ (NSString *)getYesterDay;

/*****************************
            类型转换
 *****************************/
/**
 *  JSON字符串转字典
 */
+(NSDictionary *)JsonStrToDic:(NSString *)JsonStr;
/*
 *  数组转Json字符串
 */
+ (NSString *)arrayToJson:(NSArray *)arr;
/*
 *  字典转Json字符串
 */
+ (NSString *)DicToJson:(NSDictionary *)dic;
/*
 *  字典或数组转Json字符串
 */
+ (NSString *)ObjToJson:(id)temps;
/*
 *  把NSDate转成Str
 */
+(NSString *)DateChangeString:(NSDate *)date;
/*
 *  把Str转成NSDate
 */
+(NSDate *)StringChangeDate:(NSString *)time;

/*****************************
            图片处理
 *****************************/
/*
 *  图像缩放
 */
+(UIImage *)scaleFromImage:(UIImage *)image scaledToSize:(CGSize)size;
/*
 *  制作一张带颜色的图片
 */
+(UIImage *)imageWithColor:(UIColor *)color size:(CGSize)size;





/*****************************
            强制横竖屏
 *****************************/
/*
 *  横屏
 */
+(void)AcrossScreen;
/*
 *  竖屏
 */
+(void)VerticalScreen;











@end
