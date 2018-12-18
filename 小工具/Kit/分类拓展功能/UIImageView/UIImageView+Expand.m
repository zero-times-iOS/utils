//
//  UIImageView+Expand.m
//  工具类
//
//  Created by 汤圆 on 2018/7/7.
//  Copyright © 2018年 汤圆. All rights reserved.
//

#import "UIImageView+Expand.h"

@implementation UIImageView (Expand)


-(instancetype)initWithFrame:(CGRect)frame imageName:(NSString *)name inView:(UIView *)view
{
    UIImageView *imageView = [[UIImageView alloc]initWithFrame:frame];
    imageView.image = [UIImage imageNamed:name];
    [view addSubview:imageView];
    return imageView;
}







@end
