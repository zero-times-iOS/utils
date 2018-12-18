//
//  UIColor+Hex.h
//  GMYProj
//
//  Created by mango on 15/11/20.
//  Copyright (c) 2015年 gxh. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIColor (Hex)

+ (UIColor *)ColorWithHexString:(NSString *)color;

//从十六进制字符串获取颜色，
//color:支持@“#123456”、 @“0X123456”、 @“123456”三种格式
+ (UIColor *)ColorWithHexString:(NSString *)color alpha:(CGFloat)alpha;

@end
