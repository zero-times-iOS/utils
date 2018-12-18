//
//  UIImage+Expand.h
//  工具类
//
//  Created by 汤圆 on 2018/7/7.
//  Copyright © 2018年 汤圆. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImage (Expand)



/**
 *  改变图片宽高
 *  @param width  宽
 *  @param height 高
 */
-(UIImage*)transformWidth:(CGFloat)width height:(CGFloat)height;
/*
 * 圆角图片
 */
-(UIImage *)ll_roundImageSize:(CGSize)size radius:(NSInteger)radius;
/**
 * 压缩图片，并转换为 nsdata
 */
-(NSData *)compressImage:(UIImage *)image;
/**
 * 截取长宽一致的图
 */
-(UIImage *)getPartOfImage:(UIImage *)img;
/**
 * 根据尺寸截取不拉伸的图
 */
-(UIImage *)partOfImage:(UIImage *)img size:(CGSize)size;
/**
 * 拉伸图片的部份
 */
-(UIImage *)TensileImage:(UIEdgeInsets)insets;
/**
 *  取图片某一点的颜色
 *  point 某一点
 */
- (UIColor *)colorAtPoint:(CGPoint )point;
/**
 *  取某一像素的颜色
 */
- (UIColor *)colorAtPixel:(CGPoint)point;
/**
 *  返回该图片是否有透明度通道
 */
- (BOOL)hasAlphaChannel;




@end
