//
//  UIButton+Expand.h
//  小工具
//
//  Created by qianhaiboshan on 2018/12/7.
//  Copyright © 2018年 大炮. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <objc/runtime.h>


typedef void (^BLOCK) (UIButton *sener);
@interface UIButton (Expand)

/**
 * 初始化But
 */
-(instancetype)initWithFrame:(CGRect)frame Title:(NSString *)title TitleColor:(UIColor *)titleClor Fout:(CGFloat)fout BgColor:(UIColor *)bgClor
	BgImage:(UIImage *)image inView:(UIView *)view;

/**
 * But点击事件
 */
-(void)initEventWithHandler:(BLOCK)handler;




@end


