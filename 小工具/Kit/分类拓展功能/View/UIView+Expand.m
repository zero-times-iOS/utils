//
//  UIView+Expand.m
//  工具类
//
//  Created by 汤圆 on 2018/4/23.
//  Copyright © 2018年 汤圆. All rights reserved.
//

#import "UIView+Expand.h"

static id key;
@implementation UIView (Expand)
    UIView *View;



/*******************************************
                  坐标
 *******************************************/
- (void)setX:(CGFloat)x {
    CGRect frame = self.frame;
    frame.origin.x = x;
    self.frame = frame;
}

- (CGFloat)x {
    return self.frame.origin.x;
}

- (void)setY:(CGFloat)y {
    CGRect frame = self.frame;
    frame.origin.y = y;
    self.frame = frame;
}

- (CGFloat)y {
    return self.frame.origin.y;
}

- (void)setRight:(CGFloat)right {
    CGRect frame = self.frame;
    frame.origin.x = right - self.frame.size.width;
    self.frame = frame;
}

- (CGFloat)right {
    return self.frame.origin.x + self.frame.size.width;
}

- (void)setBottom:(CGFloat)bottom {
    CGRect frame = self.frame;
    frame.origin.y = bottom - self.frame.size.height;
    self.frame = frame;
}

- (CGFloat)bottom {
    return self.frame.origin.y + self.frame.size.height;
}

- (void)setWidth:(CGFloat)width {
    CGRect frame = self.frame;
    frame.size.width = width;
    self.frame = frame;
}

- (CGFloat)width {
    return self.frame.size.width;
}

- (void)setHeight:(CGFloat)height {
    CGRect frame = self.frame;
    frame.size.height = height;
    self.frame = frame;
}

- (CGFloat)height {
    return self.frame.size.height;
}

- (void)setCenter_x:(CGFloat)center_x {
    CGPoint center = self.center;
    center.x = center_x;
    self.center = center;
}

- (CGFloat)center_x {
    return self.center.x;
}

- (void)setCenter_y:(CGFloat)center_y {
    CGPoint center = self.center;
    center.y = center_y;
    self.center = center;
}

- (CGFloat)center_y {
    return self.center.y;
}

- (void)setSize:(CGSize)size {
    CGRect frame = self.frame;
    frame.size = size;
    self.frame = frame;
}

- (CGSize)size {
    return self.frame.size;
}

- (void)setOrigin:(CGPoint)origin {
    CGRect frame = self.frame;
    frame.origin = origin;
    self.frame = frame;
}

- (CGPoint)origin {
    return self.frame.origin;
}


/*******************************************
                    阴影
 *******************************************/
-(void)setShadowColor:(UIColor *)shadowColor
{
    return [self.layer setShadowColor:shadowColor.CGColor];
}
-(void)setShadowOpacity:(CGFloat)shadowOpacity
{
    return [self.layer setShadowOpacity:shadowOpacity];
}
-(void)setOpacity:(CGFloat)opacity
{
    return [self.layer setOpacity:opacity];
}
-(void)setShadowSize:(CGSize)shadowSize
{
    return [self.layer setShadowOffset:shadowSize];
}



/*******************************************
                   手势
 *******************************************/
// 点击手势
-(void)TapActionBlock:(TapBlock)actionBlock
{
    self.userInteractionEnabled = YES;
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(TapAction:)];
    [self addGestureRecognizer:tap];
    objc_setAssociatedObject(self, &key, actionBlock, OBJC_ASSOCIATION_COPY);
}
-(void)TapAction:(UITapGestureRecognizer *)tap
{
    TapBlock block = (TapBlock)objc_getAssociatedObject(self, &key);
    if (block) {
        block(tap);
    }
}

// 长按手势
-(void)LongPressActionBlock:(LongPressBlock)actionBlock
{
    self.userInteractionEnabled = YES;
    UILongPressGestureRecognizer *longPress = [[UILongPressGestureRecognizer alloc]initWithTarget:self action:@selector(LongPressAction:)];
    //长按时间，2秒后相应方法
    longPress.minimumPressDuration = 2;
    [self addGestureRecognizer:longPress];
    objc_setAssociatedObject(self, &key, actionBlock, OBJC_ASSOCIATION_COPY);
}


-(void)LongPressAction:(UILongPressGestureRecognizer *)longPress
{
    LongPressBlock block = (LongPressBlock)objc_getAssociatedObject(self, &key);
    //    长按手势，会被多次的调用
    //    手势状态 ==  开始长按
    if (longPress.state == UIGestureRecognizerStateBegan)
    {
        if (block) {
            block(longPress);
        }
    }
    //   手势状态  ==  结束长按
    else if (longPress.state == UIGestureRecognizerStateEnded)
    {
        if (block) {
            block(longPress);
        }
    }
}

// 拖拽，慢速移动手势
-(void)PanActionBlock:(PanBlock)actionBlock
{
    self.userInteractionEnabled = YES;
    UIPanGestureRecognizer *tap = [[UIPanGestureRecognizer alloc]initWithTarget:self action:@selector(PanAction:)];
    [self addGestureRecognizer:tap];
    objc_setAssociatedObject(self, &key, actionBlock, OBJC_ASSOCIATION_COPY);
}
-(void)PanAction:(UIPanGestureRecognizer *)pan
{
    //得到手指在屏幕上的偏移量
    CGPoint point = [pan translationInView:self];
    PanBlock block = (PanBlock)objc_getAssociatedObject(self, &key);
    if (block) {
        block(point);
    }
    /*
     如果业务有需求，可以把这个改变位置的代码写在外面
     self.center = CGPointMake(self.center.x + point.x, self.center.y + point.y);
     */
    //一定要还原手挚位置，不然图片会飞走
    [pan setTranslation:CGPointZero inView:self];
}

// 快递移动
-(void)SwipeActionWith:(NSString *)direction Block:(SwipeBlock)actionBlock;
{
    self.userInteractionEnabled = YES;
    UISwipeGestureRecognizer *swipeDown = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(SwipeAction:)];
    if ([direction isEqualToString:@"上"]) {
        swipeDown.direction = UISwipeGestureRecognizerDirectionUp;
    }
    if ([direction isEqualToString:@"下"]) {
        swipeDown.direction = UISwipeGestureRecognizerDirectionDown;
    }
    if ([direction isEqualToString:@"左"]) {
        swipeDown.direction = UISwipeGestureRecognizerDirectionLeft;
    }
    if ([direction isEqualToString:@"右"]) {
        swipeDown.direction = UISwipeGestureRecognizerDirectionRight;
    }
    [self addGestureRecognizer:swipeDown];
    objc_setAssociatedObject(self, &key, actionBlock, OBJC_ASSOCIATION_COPY);
}
-(void)SwipeAction:(UISwipeGestureRecognizer *)swipeDown
{
    SwipeBlock block = (SwipeBlock)objc_getAssociatedObject(self, &key);
    if (block) {
        block(swipeDown);
    }
}

// 旋转手势
-(void)RotationActionBlock:(RotationBlock)actionBlock
{
    self.userInteractionEnabled = YES;
    UIRotationGestureRecognizer *swipeDown = [[UIRotationGestureRecognizer alloc] initWithTarget:self action:@selector(RotationAction:)];
    [self addGestureRecognizer:swipeDown];
    objc_setAssociatedObject(self, &key, actionBlock, OBJC_ASSOCIATION_COPY);
}
-(void)RotationAction:(UIRotationGestureRecognizer *)Rotation
{
    RotationBlock block = (RotationBlock)objc_getAssociatedObject(self, &key);
    
    /*
     业务需求，一般把这段代码放在外面，可实现View旋转
     //先创建一个静态变量 (一定要静态的变量)
     static CGFloat lastScale;
     //图片的变换  =      仿射变换的旋转 （静态变量 + 图片的旋转 ）
     self.transform = CGAffineTransformMakeRotation(lastScale +Rotation.rotation);
     //如果图片的旋转结束时
     if (Rotation.state == UIGestureRecognizerStateEnded )
     {
     //就把图片的旋转存起来
     lastScale += Rotation.rotation;
     }
     */
    
    if (block) {
        block(Rotation);
    }
}

// 缩放手势
-(void)PinchActionBlock:(PinchBlock)actionBlock;
{
    self.userInteractionEnabled = YES;
    UIPinchGestureRecognizer *swipeDown = [[UIPinchGestureRecognizer alloc] initWithTarget:self action:@selector(PinchAction:)];
    [self addGestureRecognizer:swipeDown];
    objc_setAssociatedObject(self, &key, actionBlock, OBJC_ASSOCIATION_COPY);
}
-(void)PinchAction:(UIPinchGestureRecognizer *)pinch
{
    PinchBlock block = (PinchBlock)objc_getAssociatedObject(self, &key);
    
    /* 业务需求，一般把这段代码放在外面，可实现View缩放
     
     static CGFloat last;
     static CGFloat max = 1.3;
     static CGFloat min = 0.4;
     //手势开始状态
     if (pinch.state == UIGestureRecognizerStateBegan ) {
     
     //把手势缩放比放到静态变量里去
     last = pinch.scale;
     }
     //手势变换状态
     if (pinch.state == UIGestureRecognizerStateBegan ||
     pinch.state == UIGestureRecognizerStateChanged)
     {
     
     CGFloat currScale = [[self.layer valueForKeyPath:@"transform.scale"] floatValue];
     CGFloat newScale = 1 - (last - pinch.scale);
     newScale = MAX(newScale, min / currScale);
     newScale = MIN(newScale, max / currScale);
     self.transform = CGAffineTransformScale(self.transform, newScale, newScale);
     last = pinch.scale;
     }
     */
    
    if (block) {
        block(pinch);
    }
}

// 双击手势
-(void)TwoTapActionBlock:(TwoTapBlock)actionBlock
{
    self.userInteractionEnabled = YES;
    UITapGestureRecognizer *TwoTap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(TwoTapAction:)];
    TwoTap.numberOfTapsRequired = 2;
    [self addGestureRecognizer:TwoTap];
    objc_setAssociatedObject(self, &key, actionBlock, OBJC_ASSOCIATION_COPY);
}

- (void)TwoTapAction:(UITapGestureRecognizer *)twoTap {
    TwoTapBlock block = (TwoTapBlock)objc_getAssociatedObject(self, &key);
    if (block) {
        block(twoTap);
    }
}

-(void)AllActionBlock:(TwoTapBlock)actionBlock
{
    
}

/*===================================
            键盘处理
 ===================================*/
-(void)DisposeKeyboard:(UIView *)view
{
    View = view;
    // UIKeyboardWillShowNotification:当系统要弹出键盘时，会发出这个通知
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(ShowKeyboard:) name:UIKeyboardWillShowNotification object:nil];
    // UIKeyboardWillHideNotification:当系统要回收键盘时，会发出这个通知
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(HideKeyboard:) name:UIKeyboardWillHideNotification object:nil];
}
// 弹出键盘
-(void)ShowKeyboard:(NSNotification *)not
{
    NSValue *keyboardValue = not.userInfo[@"UIKeyboardFrameEndUserInfoKey"];
    // 转换成CGRect
    CGRect keyboardRect = [keyboardValue CGRectValue];
    // 判断输入框是否被遮挡
    NSInteger distance = View.frame.origin.y + View.frame.size.height - keyboardRect.origin.y;
    // 如果挡住键盘就把界面上移
    if (distance > 0) {
        //把界面上移
        [UIView animateWithDuration:0.25 animations:^{
            self.frame = CGRectMake(0,  -distance, self.frame.size.width, self.frame.size.height);
        }];
    }
}



// 回收键盘
-(void)HideKeyboard:(NSNotification *)not
{
    //恢复原位
    self.frame = self.bounds;
}

/*******************************************
                  动画
 *******************************************/
- (void)showAnimateFromPoint:(CGPoint)p
{
    CGPoint center = self.center;
    self.hidden = NO;
    self.alpha = 0.f;
    self.transform = CGAffineTransformMakeScale(0.1f, 0.1f);
    self.center = p;
    [UIView animateWithDuration:0.5f delay:0.f options:UIViewAnimationOptionCurveEaseInOut animations:^{
        self.transform = CGAffineTransformMakeScale(1.f, 1.f);
        self.alpha = 1.f;
        self.center = center;
    } completion:^(BOOL finished) {
        [UIView animateWithDuration:0.08f delay:0.f options:UIViewAnimationOptionCurveEaseInOut animations:^{
            self.transform = CGAffineTransformIdentity;
        } completion:^(BOOL finished) {
        }];
    }];
}

- (void)hiddenAnimateToPoint:(CGPoint)p
{
    CGPoint center = self.center;
    [UIView animateWithDuration:0.5f animations:^{
        self.transform = CGAffineTransformMakeScale(0.1f, 0.1f);
        self.alpha = 0.f;
        self.center = p;
    } completion:^(BOOL finished) {
        self.hidden = YES;
        self.center = center;
    }];
}

- (void)showAnimateFromPoint:(CGPoint)p completion:(void (^)(BOOL finished))completion {
    CGPoint center = self.center;
    self.hidden = NO;
    self.alpha = 0.f;
    self.transform = CGAffineTransformMakeScale(0.1f, 0.1f);
    self.center = p;
    [UIView animateWithDuration:0.5f delay:0.f options:UIViewAnimationOptionCurveEaseInOut animations:^{
        self.transform = CGAffineTransformMakeScale(1.f, 1.f);
        self.alpha = 1.f;
        self.center = center;
    } completion:^(BOOL finished) {
        [UIView animateWithDuration:0.08f delay:0.f options:UIViewAnimationOptionCurveEaseInOut animations:^{
            self.transform = CGAffineTransformIdentity;
        } completion:^(BOOL finished) {
            if (completion) {
                completion(finished);
            }
        }];
    }];
}

- (void)hiddenAnimateToPoint:(CGPoint)p completion:(void (^)(BOOL finished))completion {
    CGPoint center = self.center;
    [UIView animateWithDuration:0.5f animations:^{
        self.transform = CGAffineTransformMakeScale(0.1f, 0.1f);
        self.alpha = 0.f;
        self.center = p;
    } completion:^(BOOL finished) {
        self.hidden = YES;
        self.center = center;
        if (completion) {
            completion(finished);
        }
    }];
}


-(void)viewTheReflection:(CGFloat)alpha
{
    // 创建一个图层
    CALayer *reflectionLayer = [CALayer layer];
    // 为图层的内容赋值，即imageView的图层的内容
    reflectionLayer.contents = [self layer].contents;
    // 设置图层的透明度
    reflectionLayer.opacity = alpha;
    // 设置图层的frame，原点坐标为imageView的左上角顶点
    reflectionLayer.frame = CGRectMake(0, 0, self.frame.size.width, self.frame.size.height);
    // 设置x,y,z三轴的缩放比例，三维坐标系的原点在imageView的中心，向右为x增加，向左为y增加，z轴垂直屏幕。负数表示，例如-x表示相对y-o-z 平面对三维模型做镜像。
    CATransform3D stransform = CATransform3DMakeScale(1.0f, -1.0f, 1.0f);
    // 设置frame的偏移量
    CATransform3D transform = CATransform3DTranslate(stransform, 0, -10-self.frame.size.height, 0);
    // 将编辑好的transform赋值给这个图层
    reflectionLayer.transform = transform;
    reflectionLayer.sublayerTransform = reflectionLayer.transform;
    // 将这个图层添加到imageView图层上
    [[self layer]addSublayer:reflectionLayer];
}

-(void)ViewTheSpring
{

    CGRect rect = CGRectMake(self.x, self.y, self.width, self.height);
    [UIView animateWithDuration:0.1 animations:^{
        
        self.bounds = CGRectMake(rect.origin.x, rect.origin.y, rect.size.width+20, rect.size.height+20);
        
    } completion:^(BOOL finished) {

        [UIView animateWithDuration:0.1 animations:^{
            
            self.bounds = CGRectMake(rect.origin.x, rect.origin.y, rect.size.width-15, rect.size.height-15);
            
        } completion:^(BOOL finished) {
            
            [UIView animateWithDuration:0.1 animations:^{
                
                self.bounds = CGRectMake(rect.origin.x, rect.origin.y, rect.size.width+10, rect.size.height+10);
                
            } completion:^(BOOL finished) {
               
                [UIView animateWithDuration:0.1 animations:^{
                    
                    self.bounds = CGRectMake(rect.origin.x, rect.origin.y, rect.size.width, rect.size.height);
                }];
            }];
        }];
    }];
        
}












     


@end
     
