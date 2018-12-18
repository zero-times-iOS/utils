//
//  NSString+Extension.h
//  OC工具类
//
//  Created by 汤圆 on 2018/7/6.
//  Copyright © 2018年 汤圆. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface NSString (Extension)


/**
 *  截取字符串
 *  @param fromString  开始的字符串
 *  @param toString      结束的字符串
 *  @return 新的字符串（不包含fromString和toString）
 */
- (NSString *)cutFromString:(NSString *)fromString toString:(NSString *)toString;
/**
 *  文本宽度
 *  @param font 文本的字体大小
 *  @return 文本宽度
 */
- (CGFloat)textWidthWithFont:(UIFont *)font;
/**
 *  获取时差
 *  指定时间和现在时间相差
 */
- (NSString *)getDifferenceTime;
/**
 * 是否为空
 */
- (BOOL)isEmpty:(NSString *)string;
/**
 * 当前字符串是否只包含空白字符和换行符
 */
- (BOOL)isWhitespaceAndNewlines;
/**
 * 去除字符串前后的空白,不包含换行符
 */
- (NSString *)trim;
/**
 * 去除字符串中所有空白
 */
- (NSString *)removeWhiteSpace;
- (NSString *)removeNewLine;
/**
 * 将字符串以URL格式编码
 */
- (NSString *)stringByUrlEncoding;
/*
 * 大写第一个字符,格式化后的字符串
 */
- (NSString *)capitalize;
/*
 * 判断字符串是否相同，忽略大小写
 */
- (BOOL)equalsString:(NSString *)str;







@end
