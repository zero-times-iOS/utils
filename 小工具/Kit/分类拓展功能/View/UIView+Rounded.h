//
//  UIView+Rounded.h
//  OC工具类
//
//  Created by 汤圆 on 2018/4/23.
//  Copyright © 2018年 汤圆. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <objc/runtime.h>



typedef void(^InciseScreenBlock)(NSString *str);

@interface UIView (Rounded)



/*******************************************
                 圆角相关
 *******************************************/
/**
 *  设置上半边为圆角
 *  @param cornerRadii 圆角的大小
 */
- (void)setCornerOnTopWithCornerRadii:(CGSize)cornerRadii;
/**
 *  设置下半边为圆角
 *  @param cornerRadii 圆角的大小
 */
- (void)setCornerOnBottomWithCornerRadii:(CGSize)cornerRadii;
/**
 *  设置左半边为圆角
 *  @param cornerRadii 圆角的大小
 */
- (void)setCornerOnLeftWithCornerRadii:(CGSize)cornerRadii;
/**
 *  设置右半边为圆角
 *  @param cornerRadii 圆角的大小
 */
- (void)setCornerOnRightWithCornerRadii:(CGSize)cornerRadii;
/**
 *  取消圆角设置
 */
- (void)setNoneCorner;
/**
 *  设置边框圆角
 *  @param cornerRadii 圆角大小
 */
- (void)setAllCornerRadii:(CGFloat)cornerRadii;


/*******************************************
                视图抖动
 *******************************************/
// 视图抖动
-(void)dynamicView:(UIView *)view;
// 停止视图抖动
-(void)dynamicStop:(UIView *)view;



/*******************************************
                视图阴影
 *******************************************/
/**
 *  设置阴影颜色
 *  color:颜色
 */
-(void)setShadowColor:(UIColor *)color;
/**
 *  设置阴影的透明度
 *  opacity:透明度
 */
-(void)setShadowOpacity:(CGFloat)opacity;
/**
 *  设置View阴影的偏移量
 *  size:偏移量
 */
-(void)setShadowOffset:(CGSize *)size;
/**
 *  设置View的透明度
 *  opacity:透明度
 */
-(void)setOpacity:(CGFloat)opacity;


/*******************************************
                屏幕切图
 *******************************************/
/**
 *  使用之前在"Info.plist"文件里面加入“Privacy - Photo Library Additions Usage Description”
 */
-(void)InciseScreen:(InciseScreenBlock)inciseScreen;







@end
