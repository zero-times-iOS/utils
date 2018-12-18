//
//  GuideView.m
//  小工具
//
//  Created by qianhaiboshan on 2018/12/12.
//  Copyright © 2018年 大炮. All rights reserved.
//

#import "GuideView.h"

@implementation GuideView

-(instancetype)initWithFrame:(CGRect)frame IamgeArr:(NSArray *)array
{
	if ([self initWithFrame:frame])
	{

		[self initUI:array];
	}
	return self;
}


-(void)initUI:(NSArray *)arr
{
	// 判断沙盒中是否有firstLanch的值
	if ([[NSUserDefaults standardUserDefaults] boolForKey:@"firstLanch"])
	{
		return;
	}


	UIScrollView *_sv = [[UIScrollView alloc] initWithFrame:self.bounds];
	_sv.contentSize = CGSizeMake(_sv.bounds.size.width * 4, _sv.bounds.size.height);
	_sv.bounces = NO;
	_sv.pagingEnabled = YES;
	[self addSubview:_sv];

	for (int i = 0; i < arr.count; i++)
	{
		UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectMake(_sv.bounds.size.width * i, 0, _sv.bounds.size.width, _sv.bounds.size.height)];
		imageView.image = [UIImage imageNamed:[NSString stringWithFormat:@"%@",[arr objectAtIndex:i]]];
		[_sv addSubview:imageView];
	}

	UIButton *btn = [UIButton buttonWithType:UIButtonTypeSystem];
	btn.frame = CGRectMake(_sv.bounds.size.width * 4 - 80, _sv.bounds.size.height-60, 60, 40);
	[btn setTitle:@"进入" forState:UIControlStateNormal];
	[btn addTarget:self action:@selector(enterHomeVC) forControlEvents:UIControlEventTouchUpInside];
	[_sv addSubview:btn];

	// 保存key为firstLanch的值为YES
	[[NSUserDefaults standardUserDefaults] setBool:YES forKey:@"firstLanch"];
	[[NSUserDefaults standardUserDefaults] synchronize];
}

// 进入按钮点击事件
- (void)enterHomeVC
{
	[UIView animateWithDuration:1.5 animations:^{
		self.alpha = 0;
	} completion:^(BOOL finished) {
		[self removeFromSuperview];
	}];
}


@end
