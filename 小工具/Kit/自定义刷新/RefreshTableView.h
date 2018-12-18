//
//  HYRefreshTableView.h
//  AiXueYi
//
//  Created by MAC-02 on 15/11/27.
//  Copyright © 2015年 hy. All rights reserved.
//
//  如果要有下拉(即更新数据)、上拉刷新(即加载更多数据)功能，必须先设置代理为本身控制器，再调用公有方法 - (void)setRefreshMoreData即可
//      避免代理为空，导致无法响应刷新事件

#import <UIKit/UIKit.h>
#import "MJRefresh.h"   // 明杰刷新

// 需要刷新的视图都需要遵守协议，自定义刷新功能
@protocol RefreshDelegate <NSObject>

@optional
- (void)loadTVNewData;        //下拉刷新
- (void)loadTVMoreData;       //上拉刷新
-(void)refreshTVTouchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event;
-(void)refreshTVTouchesMoved:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event;
-(void)refreshTVTouchesEnded:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event;

@end

@interface RefreshTableView : UITableView

@property (nonatomic,weak) id<RefreshDelegate> refreshDelegate;

-(void)initSettingWithDelegate:(id)delegate;

// 下拉刷新
- (void)setRefreshTVNewData;
// 下拉刷新 （设置进入时候，是否立有刷新动画）
- (void)setRefreshTVNewData:(BOOL)refreshing;

// 上拉加载
- (void)setRefreshTVMoreData;

//是否立即下拉刷新,初始化上拉刷新
- (void)setRefreshTVMoreData:(BOOL)isRefresh;



@property (nonatomic, assign) NSInteger refrestState;



@end
