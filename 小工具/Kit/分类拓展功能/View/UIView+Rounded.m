//
//  UIView+Rounded.m
//  OC工具类
//
//  Created by 汤圆 on 2018/4/23.
//  Copyright © 2018年 汤圆. All rights reserved.
//

#import "UIView+Rounded.h"


#define AppWidth       [UIScreen mainScreen].bounds.size.width
#define AppHeight      [UIScreen mainScreen].bounds.size.height
#define AppBounds      [UIScreen mainScreen].bounds
#define AppRatio       (AppWidth/375.0f)

static id key;
@implementation UIView (Rounded)


/*******************************************
                 圆角相关
 *******************************************/
- (void)setCornerOnTopWithCornerRadii:(CGSize)cornerRadii{
    UIBezierPath *maskPath;
    maskPath = [UIBezierPath bezierPathWithRoundedRect:self.bounds
                                     byRoundingCorners:(UIRectCornerTopLeft | UIRectCornerTopRight)
                                           cornerRadii:cornerRadii];
    CAShapeLayer *maskLayer = [[CAShapeLayer alloc] init];
    maskLayer.frame = self.bounds;
    maskLayer.path = maskPath.CGPath;
    self.layer.mask = maskLayer;
}
- (void)setCornerOnBottomWithCornerRadii:(CGSize)cornerRadii{
    UIBezierPath *maskPath;
    maskPath = [UIBezierPath bezierPathWithRoundedRect:self.bounds
                                     byRoundingCorners:(UIRectCornerBottomLeft | UIRectCornerBottomRight)
                                           cornerRadii:cornerRadii];
    CAShapeLayer *maskLayer = [[CAShapeLayer alloc] init];
    maskLayer.frame = self.bounds;
    maskLayer.path = maskPath.CGPath;
    self.layer.mask = maskLayer;
}
- (void)setCornerOnLeftWithCornerRadii:(CGSize)cornerRadii{
    UIBezierPath *maskPath;
    maskPath = [UIBezierPath bezierPathWithRoundedRect:self.bounds
                                     byRoundingCorners:(UIRectCornerTopLeft | UIRectCornerBottomLeft)
                                           cornerRadii:cornerRadii];
    CAShapeLayer *maskLayer = [[CAShapeLayer alloc] init];
    maskLayer.frame = self.bounds;
    maskLayer.path = maskPath.CGPath;
    self.layer.mask = maskLayer;
}
- (void)setCornerOnRightWithCornerRadii:(CGSize)cornerRadii{
    UIBezierPath *maskPath;
    maskPath = [UIBezierPath bezierPathWithRoundedRect:self.bounds
                                     byRoundingCorners:(UIRectCornerTopRight | UIRectCornerBottomRight)
                                           cornerRadii:cornerRadii];
    CAShapeLayer *maskLayer = [[CAShapeLayer alloc] init];
    maskLayer.frame = self.bounds;
    maskLayer.path = maskPath.CGPath;
    self.layer.mask = maskLayer;
}

- (void)setAllCornerRadii:(CGFloat)cornerRadii{
    self.layer.cornerRadius = cornerRadii * AppRatio;       // 方法一
//    [self.layer setCornerRadius:cornerRadii * AppRatio];    // 方法二
    self.layer.masksToBounds = YES;
}

- (void)setAllCorner{
    UIBezierPath *maskPath;
    maskPath = [UIBezierPath bezierPathWithRoundedRect:self.bounds
                                          cornerRadius:10];
    CAShapeLayer *maskLayer = [[CAShapeLayer alloc] init];
    maskLayer.frame = self.bounds;
    maskLayer.path = maskPath.CGPath;
    self.layer.mask = maskLayer;
}
- (void)setNoneCorner{
    self.layer.mask = nil;
}


/*******************************************
                视图抖动
 *******************************************/
// 视图抖动
-(void)dynamicView:(UIView *)view
{
    //抖动
    CAKeyframeAnimation *rotationAni = [CAKeyframeAnimation animation];
    rotationAni.keyPath = @"transform.rotation";
    //计算好转动弧度
    CGFloat angle = M_PI_2 * 0.2;
    //设置 旋转路径
    rotationAni.values = @[@(-angle),@(angle),@(-angle)];
    //默认只有一次  可以设置次数
    rotationAni.repeatCount = 5;
    //    rotationAni.repeatCount = MAXFLOAT;//无限抖动

    //加到图片上去
    [view.layer addAnimation:rotationAni forKey:@"shake"];
}

// 停止视图抖动
-(void)dynamicStop:(UIView *)view
{
    //通过Key 把动画移去
    [view.layer removeAnimationForKey:@"shake"];
}



/*******************************************
                视图阴影
 *******************************************/
// 设置阴影颜色
-(void)setShadowColor:(UIColor *)color
{
    [self.layer setShadowColor:color.CGColor];
}
//设置阴影的透明度
-(void)setShadowOpacity:(CGFloat)opacity
{
    [self.layer setShadowOpacity:opacity];
}
//设置View的透明度
-(void)setOpacity:(CGFloat)opacity
{
    [self.layer setOpacity:opacity];
}
//设置View阴影的偏移量
-(void)setShadowOffset:(CGSize *)size
{
    [self.layer setShadowOffset:*size];
}


/*******************************************
                屏幕切图
 *******************************************/
-(void)InciseScreen:(InciseScreenBlock)inciseScreen
{
    objc_setAssociatedObject(self, &key, inciseScreen, OBJC_ASSOCIATION_COPY);
    //使用位图上下文
    //开启位图上下文
    UIGraphicsBeginImageContext(self.bounds.size);
    //当前控制器的View画在位图上下文
    [self.layer renderInContext:UIGraphicsGetCurrentContext()];
    //获取图片
    UIImage *captureimage = UIGraphicsGetImageFromCurrentImageContext();
    //结束位图编辑
    UIGraphicsEndImageContext();
    //访问系统相册，把图片保存到相册
    UIImageWriteToSavedPhotosAlbum(captureimage, self, @selector(imageSavedToPhotosAlbum:didFinishSavingWithError:contextInfo:), nil);
}


- (void)imageSavedToPhotosAlbum:(UIImage *)image didFinishSavingWithError:(NSError *)error contextInfo:(void *)contextInfo
{
    InciseScreenBlock block = (InciseScreenBlock)objc_getAssociatedObject(self, &key);
    
    if (!error) {
        if (block) {
            block(@"成功保存到相册");
        }
    }else
    {
        if (block) {
            block([error description]);
        }
    }
    
}















@end
