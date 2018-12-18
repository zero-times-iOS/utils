//
//  ProgressView.m
//  画文字和图片
//
//  Created by Beyond on 16/9/9.
//  Copyright © 2016年 Beyond. All rights reserved.
//

#import "ProgressView.h"

@implementation ProgressView
{
    // 视图的宽
    CGFloat _viewW;
    // 视图的高
    CGFloat _viewH;
    // laber宽
    CGFloat _laberW;
}




-(instancetype)initWithFrame:(CGRect)frame
{
    if (self == [super initWithFrame:frame])
    {
        [self initValueUI:frame];
    }
    return self;
}




-(void)initValueUI:(CGRect)frame
{
    //切角  调透明度
    self.layer.cornerRadius = 10;
    self.layer.masksToBounds = 1;
    self.alpha = 0.7;
    
    //取self的宽高
    _viewW = frame.size.width;
    _viewH = frame.size.height;
    _laberW = frame.size.width / 4;
    
    //画文字
    _laber = [[UILabel alloc]initWithFrame:CGRectMake(_viewW / 2 - _laberW, _viewH / 2 - 15, _laberW *2 , 30)];

}

// 当显示到屏幕时调用
-(void)drawRect:(CGRect)rect
{

   
    NSString *str = [NSString stringWithFormat:@"%%%.0f",_pregress * 100];
    _laber.text = str;
    _laber.textAlignment = NSTextAlignmentCenter;
    [self addSubview:_laber];
    
    
    // 画弧
    CGContextRef context = UIGraphicsGetCurrentContext();//获取上下文
    //半经
    CGFloat radius = (_viewW - 10) * 0.5;
    CGContextMoveToPoint(context, _viewW * 0.5, _viewH *0.5);
    CGFloat endAngle = _pregress * 2 * M_PI - M_PI_2;
    [[UIColor whiteColor] set];
    
    CGContextAddArc(context, _viewW * 0.5, _viewH *0.5, radius,  -M_PI_2, endAngle, 0);

    CGContextClosePath(context);// 连线
    CGContextFillPath(context);//  填充
    
    
}

-(void)setPregress:(float)pregress
{
    _pregress = pregress;
    
    //重绘   重绘时，值才会改变
    [self setNeedsDisplay];
}



@end
