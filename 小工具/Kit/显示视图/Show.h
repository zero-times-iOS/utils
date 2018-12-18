//
//  ProgressView.h
//  画文字和图片
//
//  Created by Beyond on 16/9/9.
//  Copyright © 2016年 Beyond. All rights reserved.

#import <UIKit/UIKit.h>


typedef void(^MainBlock)(void);
@interface Show : UIView

// GIF动画间隔, 默认1.f
@property (nonatomic, assign) NSTimeInterval interval;
// 菊花和GIF的宽, 默认60.f, textLabel最大宽为imageWidth*2
@property (nonatomic, assign) CGFloat imageWidth;
// 周围间隔, 默认5.f
@property (nonatomic, assign) CGFloat space;
// 文字颜色, 默认白色
@property (nonatomic, strong) UIColor *textColor;
// 文字大小, 默认10.f
@property (nonatomic, strong) UIFont *textFont;
// 背景颜色, 默认0.3透明黑
@property (nonatomic, strong) UIColor *bgColor;
// 父视图, 默认keyWindow
@property (nonatomic, strong) UIView *superView;


/********************
    显示菊花
 ********************/
+ (void)showActivity;

/********************
    显示文字
 ********************/
+ (void)showText:(NSString *)text;

/********************
    显示菊花+文字
 ********************/
+ (void)showActivityWithText:(NSString *)text;

/********************
    显示GIF动画, 可传UIImage数组、ImageName数组、GIF名字NSString(例：图片命名为wulian_0、wulian_1、wulian_2, 传@"wulian_")
 ********************/
+ (void)showGIF:(id)gif;

/********************
    显示文字+GIF, gif可传UIImage数组、ImageName数组、GIF名字NSString(例：图片命名为wulian_0、wulian_1、wulian_2, 传@"wulian_")
 ********************/
+ (void)showGIF:(id)gif text:(NSString *)text;

/********************
    从一个视图里移除所有的hintView
 ********************/
+ (void)removeHintViewFromSuperview:(UIView *)superView duration:(NSTimeInterval)after;

        




@end
