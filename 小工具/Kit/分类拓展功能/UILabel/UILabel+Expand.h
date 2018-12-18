//
//  UILabel+Expand.h
//  工具类
//
//  Created by 汤圆 on 2018/7/7.
//  Copyright © 2018年 汤圆. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UILabel (Expand)

/**
 *  获取文本高度
 *  @return 文本高度
 */
-(CGFloat)textHight;

/**
 *  获取文本宽度
 *  @return 文本宽度
 */
-(CGFloat)textWidth;
/**
 *  设置左上对齐
 */
- (void) textLeftTopAlign;
/**
 *  范围文字设置字体
 *  @param font    字体
 *  @param range   范围
 */
-(void)fuwenbenLabelFontNumber:(UIFont *)font andRange:(NSRange)range;
/**
 *  范围文字设置颜色
 *  @param range   范围
 *  @param vaColor 颜色
 */
-(void)fuwenbenLabelColor:(UIColor *)vaColor andRange:(NSRange)range;

/**
 *  文本添加中划线线
 */
-(void)textDeleteLine;

/**
 *  调整部分文本的字体大小
 *  @param font  字体大小
 *  @param range 范围区间
 */
- (void)adjustFont:(UIFont *)font range:(NSRange)range;

/**
 *  改变行间距
 */
- (void)changeLineSpace:(float)space;

/**
 *  改变字间距
 */
- (void)changeWordSpace:(float)space;

/*
 *  改变行间距和字间距
 */
- (void)changeLineSpace:(float)lineSpace WordSpace:(float)wordSpace;


/*
 *  初始化
 */
-(instancetype)initWithFrame:(CGRect)frame font:(UIFont *)font inView:(UIView *)view;






@end
