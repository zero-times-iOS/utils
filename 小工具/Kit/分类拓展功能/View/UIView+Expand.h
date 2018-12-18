//
//  UIView+Expand.h
//  工具类
//
//  Created by 郑学军  on 2016/4/23.
//  Copyright © 2016年 郑学军. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Foundation/Foundation.h>
#import <objc/runtime.h>



// View点击事件Block
typedef void(^TapBlock)(UITapGestureRecognizer *tap);
typedef void(^TwoTapBlock)(UITapGestureRecognizer *twoTap);
typedef void(^LongPressBlock)(UILongPressGestureRecognizer *longPress);
typedef void(^PanBlock)(CGPoint point);
typedef void(^SwipeBlock)(UISwipeGestureRecognizer *Swipe);
typedef void(^RotationBlock)(UIRotationGestureRecognizer *Rotation);
typedef void(^PinchBlock)(UIPinchGestureRecognizer *Pinch);



@interface UIView (Expand)


/*******************************************
                  坐标
 *******************************************/
// 上
@property (nonatomic, assign) CGFloat y;
// 左
@property (nonatomic, assign) CGFloat x;
// 下
@property (nonatomic, assign) CGFloat bottom;
// 右
@property (nonatomic, assign) CGFloat right;
// 宽
@property (nonatomic, assign) CGFloat width;
// 高
@property (nonatomic, assign) CGFloat height;
// 中心x
@property (nonatomic, assign) CGFloat center_x;
// 中心y
@property (nonatomic, assign) CGFloat center_y;
// 尺寸
@property (nonatomic, assign) CGSize size;
// 坐标
@property (nonatomic, assign) CGPoint origin;



/*******************************************
                    阴影
 *******************************************/
// 阴影颜色
@property (nonatomic, strong)UIColor *shadowColor;
// 设置阴影的透明度
@property (nonatomic, assign)CGFloat shadowOpacity;
// 设置View的透明度
@property (nonatomic, assign)CGFloat opacity;
//设置View Shadow的偏移量
@property (nonatomic, assign)CGSize shadowSize;



/*******************************************
                    手势
 *******************************************/
/**
 *  点击手势
 *  @param actionBlock 结束执行代码块
 */
-(void)TapActionBlock:(TapBlock)actionBlock;
/**
 *  拖拽，慢速移动手势
 *  @param actionBlock 结束执行代码块
 */
-(void)PanActionBlock:(PanBlock)actionBlock;

/**
 *  长按手势
 *  @param actionBlock 结束执行代码块
 */
-(void)LongPressActionBlock:(LongPressBlock)actionBlock;
/**
 *  快递移动
 *  direction 方向，传"上,下,左,右"
 *  @param actionBlock 结束执行代码块
 */
-(void)SwipeActionWith:(NSString *)direction Block:(SwipeBlock)actionBlock;
/**
 *  旋转手势
 *  @param actionBlock 结束执行代码块
 */
-(void)RotationActionBlock:(RotationBlock)actionBlock;
/**
 *  缩放手势
 *  @param actionBlock 结束执行代码块
 */
-(void)PinchActionBlock:(PinchBlock)actionBlock;
/**
 *  双击手势
 *  @param actionBlock 结束执行代码块
 */
-(void)TwoTapActionBlock:(TwoTapBlock)actionBlock;
/**
 *  所有手势
 *  @param actionBlock 结束执行代码块
 */
-(void)AllActionBlock:(TwoTapBlock)actionBlock;






/*******************************************
                  键盘问题
 *******************************************/
/*  处理键盘挡住输入框的问题
 *  view:不被键盘挡住的View
 */
-(void)DisposeKeyboard:(UIView *)view;







/*******************************************
                    动画
 *******************************************/
/**
 *  从某点弹出视图
 *  @param p 点
 */
- (void)showAnimateFromPoint:(CGPoint)p;

/**
 *  从某点弹出视图
 *  @param p          点
 *  @param completion 结束执行代码块
 */
- (void)showAnimateFromPoint:(CGPoint)p completion:(void (^)(BOOL finished))completion;

/**
 *  从某点隐藏隐藏
 *  @param p 点
 */
- (void)hiddenAnimateToPoint:(CGPoint)p;

/**
 *  从某点隐藏隐藏
 *  @param p 点
 *  @param completion 结束执行代码块
 */
- (void)hiddenAnimateToPoint:(CGPoint)p completion:(void (^)(BOOL finished))completion;




/*******************************************
                 倒影效果
 *******************************************/
-(void)viewTheReflection:(CGFloat)alpha;

/*******************************************
                 按钮特效
 *******************************************/
-(void)ViewTheSpring;























@end
