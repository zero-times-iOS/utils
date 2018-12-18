//
//  HYRefreshCollectionView.m
//  CommonPro
//
//  Created by MAC-02 on 16/5/9.
//  Copyright © 2016年 MAC-02. All rights reserved.
//

#import "RefreshCollectionView.h"


#define AppWidth       [UIScreen mainScreen].bounds.size.width
#define AppHeight      [UIScreen mainScreen].bounds.size.height
#define AppBounds      [UIScreen mainScreen].bounds
#define AppRatio       (AppWidth/375.0f)
#define Font(s)        [UIFont systemFontOfSize:(s)*AppRatio]

@implementation RefreshCollectionView

/**
 * 随机数据
 */
#define MJRandomData [NSString stringWithFormat:@"随机数据---%d", arc4random_uniform(1000000)]

#pragma mark UITableView + 上拉刷新 自定义文字
- (void)setRefreshCVNewData
{
    // 添加下拉刷新
    // 设置回调（一旦进入刷新状态，就调用target的action，也就是调用self的loadNewData方法）
    MJRefreshNormalHeader *header = [MJRefreshNormalHeader headerWithRefreshingTarget:self.refreshDelegate refreshingAction:@selector(loadCVNewData)];
    
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
    self.mj_header = header;
}

//是否 进入页面时候 ，马上刷新
- (void)setRefreshCVNewData:(BOOL)refreshing
{
    // 添加下拉刷新
    // 设置回调（一旦进入刷新状态，就调用target的action，也就是调用self的loadNewData方法）
    MJRefreshNormalHeader *header = [MJRefreshNormalHeader headerWithRefreshingTarget:self.refreshDelegate refreshingAction:@selector(loadCVNewData)];
    
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
    if (refreshing) {
        [header beginRefreshing];
    }
    // 设置刷新控件
    self.mj_header = header;
}


- (void)setRefreshCVMoreData
{
    [self setRefreshCVNewData];
    
    // 添加上拉刷新
    // 设置回调（一旦进入刷新状态，就调用target的action，也就是调用self的loadMoreData方法）
    MJRefreshAutoNormalFooter *footer = [MJRefreshAutoNormalFooter footerWithRefreshingTarget:self.refreshDelegate refreshingAction:@selector(loadCVMoreData)];
    
    // 设置文字
    [footer setTitle:@"上拉可以加载" forState:MJRefreshStateIdle];
    [footer setTitle:@"加载数据中..." forState:MJRefreshStateRefreshing];
    [footer setTitle:@" " forState:MJRefreshStateNoMoreData];
    
    // 设置字体
    footer.stateLabel.font = Font(24);
    
    // 设置颜色
    footer.stateLabel.textColor = [UIColor greenColor];
    
    // 根据有无数据隐藏或显示
    [footer setAutomaticallyHidden:YES];
    
    // 设置footer
    self.mj_footer = footer;
    
    // 设置了底部inset
    self.contentInset = UIEdgeInsetsMake(0, 0, 0, 0);
    // 忽略掉底部inset
    self.mj_footer.ignoredScrollViewContentInsetBottom = 30;
    
}

- (void)setRefreshCVMoreData:(BOOL)refreshing
{
   [self setRefreshCVNewData:refreshing];
   
   // 添加上拉刷新
   // 设置回调（一旦进入刷新状态，就调用target的action，也就是调用self的loadMoreData方法）
   MJRefreshAutoNormalFooter *footer = [MJRefreshAutoNormalFooter footerWithRefreshingTarget:self.refreshDelegate refreshingAction:@selector(loadCVMoreData)];
   
   // 设置文字
   [footer setTitle:@"上拉可以加载" forState:MJRefreshStateIdle];
   [footer setTitle:@"加载数据中..." forState:MJRefreshStateRefreshing];
   [footer setTitle:@" " forState:MJRefreshStateNoMoreData];
   
   // 设置字体
   footer.stateLabel.font = Font(24);
   
   // 设置颜色
   footer.stateLabel.textColor = [UIColor greenColor];
   
   // 根据有无数据隐藏或显示
   [footer setAutomaticallyHidden:YES];
   
   // 设置footer
   self.mj_footer = footer;
   
   // 设置了底部inset
   self.contentInset = UIEdgeInsetsMake(0, 0, 0, 0);
   // 忽略掉底部inset
   self.mj_footer.ignoredScrollViewContentInsetBottom = 30;
   
}



@end
