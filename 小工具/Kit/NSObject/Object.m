//
//  Object.m
//  OC工具类
//
//  Created by 汤圆 on 2018/4/23.
//  Copyright © 2018年 汤圆. All rights reserved.
//

#import "Object.h"

@implementation Object


#pragma mark ================= Json字符串转字典
+(NSDictionary *)JsonStrToDic:(NSString *)JsonStr
{
    NSData *JSONData = [JsonStr dataUsingEncoding:NSUTF8StringEncoding];
    NSDictionary *responseJSON = [NSJSONSerialization JSONObjectWithData:JSONData options:NSJSONReadingMutableLeaves error:nil];
    return responseJSON;
}

#pragma mark ================= 数组转Json字符串
+ (NSString *)arrayToJson:(NSArray *)arr
{
    NSError *error = nil;
    //    NSMutableArray *muArray = [NSMutableArray array];
    //    for (NSString *userId in array) {
    //        [muArray addObject:[NSString stringWithFormat:@"\"%@\"", userId]];
    //    }
    NSData *jsonData = [NSJSONSerialization dataWithJSONObject:arr options:NSJSONWritingPrettyPrinted error:&error];
    NSString *jsonString = [[NSString alloc] initWithData:jsonData encoding:NSUTF8StringEncoding];
    //    NSString *jsonTemp = [jsonString stringByReplacingOccurrencesOfString:@"\n" withString:@""];
    //    NSString *jsonResult = [jsonTemp stringByReplacingOccurrencesOfString:@" " withString:@""];
    //    NSLog(@"json array is: %@", jsonResult);
    return jsonString;
}

#pragma mark ================= 字典转Json字符串
+ (NSString *)DicToJson:(NSDictionary *)dic
{
    NSError *error = nil;
    NSData *jsonData = [NSJSONSerialization dataWithJSONObject:dic options:NSJSONWritingPrettyPrinted error:&error];
    NSString *jsonString = [[NSString alloc] initWithData:jsonData encoding:NSUTF8StringEncoding];
    //    NSString *jsonTemp = [jsonString stringByReplacingOccurrencesOfString:@"\n" withString:@""];
    //    NSString *jsonResult = [jsonTemp stringByReplacingOccurrencesOfString:@" " withString:@""];
    return jsonString;
}

#pragma mark ================= 把字典和数组转换成json字符串
+ (NSString *)ObjToJson:(id)temps   
{
    NSData* jsonData =[NSJSONSerialization dataWithJSONObject:temps
                                                      options:NSJSONWritingPrettyPrinted error:nil];
    NSString *strs=[[NSString alloc] initWithData:jsonData encoding:NSUTF8StringEncoding];
    return strs;
}


#pragma mark ================= 获取当前时间 
+(NSString*)getTime
{
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    // 设置你想要的格式,hh与HH的区别:分别表示12小时制,24小时制
    [formatter setDateFormat:@"YYYY-MM-dd HH:mm:ss"];
//    [formatter setTimeZone:[NSTimeZone timeZoneForSecondsFromGMT:8]];//解决8小时时间差问题
    NSDate *datenow = [NSDate date];
    NSString *currentTimeString = [formatter stringFromDate:datenow];
    return currentTimeString;
}


#pragma mark ================= 获取昨天时间

+(NSString *)getYesterDay
{
	NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
	[formatter setDateFormat:@"yy/MM/dd"];
	NSString *nowTime = [formatter stringFromDate:[NSDate date]];
	return nowTime;
}

#pragma mark ================= 把NSDate转成Str
+(NSString *)DateChangeString:(NSDate *)date
{
    NSDateFormatter *dateFormatter=[[NSDateFormatter alloc]init];//创建一个日期格式化器
    [dateFormatter setDateFormat:@"YYYY-MM-dd HH:mm:ss"];
    [dateFormatter setTimeZone:[NSTimeZone timeZoneForSecondsFromGMT:8]];//解决8小时时间差问题
    return  [dateFormatter stringFromDate:date];//2015-11-20
}

#pragma mark ================= 把Str转成NSDate
+(NSDate *)StringChangeDate:(NSString *)time
{
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"YYYY-MM-dd HH:mm:ss"];
    [dateFormatter setTimeZone:[NSTimeZone timeZoneForSecondsFromGMT:8]];//解决8小时时间差问题
    NSDate *birthdayDate = [dateFormatter dateFromString:time];
    return birthdayDate;
}



#pragma mark ================= 把颜色变成一张图片
+(UIImage *)imageWithColor:(UIColor *)color size:(CGSize)size
{
    if (!color || size.width <= 0 || size.height <= 0) return nil;
    CGRect rect = CGRectMake(0.0f, 0.0f, size.width, size.height);
    UIGraphicsBeginImageContextWithOptions(rect.size, NO, 0);
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSetFillColorWithColor(context, color.CGColor);
    CGContextFillRect(context, rect);
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return image;
}



#pragma mark ================= 建立一个方法，传送一个图像参数，和一个缩放比例参数，实现将图像缩放至比例的功能
+(UIImage *)scaleFromImage:(UIImage *)image scaledToSize:(CGSize)size
{
    CGSize imagesize = image.size;
    //获得图片的大小，从而得到图片的宽度和高度
    CGFloat width = imagesize.width;
    CGFloat height = imagesize.height;
    
    //计算新图片和旧图片的宽，高比例
    CGFloat widthfactor = size.width / width;
    CGFloat heighFactor = size.height / height;
    
    //获取最小的那个比率
    CGFloat smoallFactor = (widthfactor < heighFactor? widthfactor: heighFactor);
    
    //计算图片新的宽度和高度
    CGFloat newwidth = width *smoallFactor;
    CGFloat newheigth = height * smoallFactor;
    
    //把新的宽度和高度构建成标准的CGSize对象
    CGSize newsize = CGSizeMake(newwidth, newheigth);
    
    
    //创建Quartz上下文
    UIGraphicsBeginImageContext(newsize);
    
    //把图片对象写入之前计算的新尺寸里
    [image drawInRect:CGRectMake(0, 0, newwidth, newheigth)];
    
    //获取上下文里的内容，把内容写入到新的图像对象
    UIImage *newimage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    
    return newimage;
}


#pragma mark ================= 强制横竖屏
// 横屏
+(void)AcrossScreen
{
    //横屏
    [self interfaceOrientation:UIInterfaceOrientationLandscapeRight];
}

// 竖屏
+(void)VerticalScreen
{
    //竖屏
    [self interfaceOrientation:UIInterfaceOrientationPortrait];
}

+(void)interfaceOrientation:(UIInterfaceOrientation)orientation
{
    if ([[UIDevice currentDevice] respondsToSelector:@selector(setOrientation:)]) {
        SEL selector             = NSSelectorFromString(@"setOrientation:");
        NSInvocation *invocation = [NSInvocation invocationWithMethodSignature:[UIDevice instanceMethodSignatureForSelector:selector]];
        [invocation setSelector:selector];
        [invocation setTarget:[UIDevice currentDevice]];
        int val                  = orientation;
        [invocation setArgument:&val atIndex:2];
        [invocation invoke];
    }
}





@end
