//
//  RefreshWebView.m
//  小工具
//
//  Created by qianhaiboshan on 2018/12/9.
//  Copyright © 2018年 大炮. All rights reserved.
//

#import "RefreshWebView.h"



#define AppWidth       [UIScreen mainScreen].bounds.size.width
#define AppHeight      [UIScreen mainScreen].bounds.size.height
#define AppBounds      [UIScreen mainScreen].bounds
#define AppRatio       (AppWidth/375.0f)
#define Font(s)        [UIFont systemFontOfSize:(s)*AppRatio]
@implementation RefreshWebView


- (void)DownRefreshData
{
	// 添加下拉刷新
	// 设置回调（一旦进入刷新状态，就调用target的action，也就是调用self的loadNewData方法）
	MJRefreshNormalHeader *header = [MJRefreshNormalHeader headerWithRefreshingTarget:self.refreshDelegate refreshingAction:@selector(loadWBNewData)];

	// 设置文字
	[header setTitle:@"下拉可以刷新" forState:MJRefreshStateIdle];
	[header setTitle:@"松开立即刷新" forState:MJRefreshStatePulling];
	[header setTitle:@"正在刷新..." forState:MJRefreshStateRefreshing];

	// 设置字体
	header.stateLabel.font = Font(24);
	header.lastUpdatedTimeLabel.font = Font(22);

	// 设置颜色
	header.stateLabel.textColor = [UIColor greenColor];
	header.lastUpdatedTimeLabel.textColor = [UIColor greenColor];

	// 马上进入刷新状态
	[header beginRefreshing];

	// 设置刷新控件
	self.scrollView.mj_header = header;
}


// 结束下拉刷新
-(void)StopDownRefresh
{
	[self.scrollView.mj_header endRefreshing];
}











@end
