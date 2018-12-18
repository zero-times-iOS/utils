//
//  UIButton+Expand.m
//  小工具
//
//  Created by qianhaiboshan on 2018/12/7.
//  Copyright © 2018年 大炮. All rights reserved.
//

#import "UIButton+Expand.h"


static id key;
@implementation UIButton (Expand)


// 初始化
-(instancetype)initWithFrame:(CGRect)frame Title:(NSString *)title TitleColor:(UIColor *)titleClor Fout:(CGFloat)fout BgColor:(UIColor *)bgClor
 BgImage:(UIImage *)image inView:(UIView *)view
{
	/*
	 UIButtonTypeCustom
	 UIButtonTypeSystem
	 */

	UIButton *button = [[UIButton alloc]init];
	button.frame = frame;
	[button setTitle:title forState:UIControlStateNormal];
	[button setTitleColor:titleClor forState:UIControlStateNormal];
	button.backgroundColor = bgClor;
	button.titleLabel.font = [UIFont systemFontOfSize:fout];
	//设置背景图片（需要注意按钮类型最好为自定义，系统类型的会使图片变暗）
	[button setImage:image forState:UIControlStateNormal];
	[view addSubview:button];

	return button;
}



// 点击事件
-(void)initEventWithHandler:(BLOCK)handler
{

	[self addTarget:self action:@selector(goAction:) forControlEvents:UIControlEventTouchUpInside];
	objc_setAssociatedObject(self, &key, handler, OBJC_ASSOCIATION_COPY);
}

- (void)goAction:(UIButton *)sender{

	BLOCK block = (BLOCK)objc_getAssociatedObject(self, &key);
	if (block) {
		block(sender);
	}
}




























@end
