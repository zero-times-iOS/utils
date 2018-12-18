//
//  HYRefreshCollectionView.h
//  CommonPro
//
//  Created by MAC-02 on 16/5/9.
//  Copyright © 2016年 MAC-02. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MJRefresh.h"  // 明杰刷新

// 需要刷新的视图都需要遵守协议，自定义刷新功能
@protocol RefreshDelegate <NSObject>

@optional
- (void)loadCVNewData;
- (void)loadCVMoreData;

@end

@interface RefreshCollectionView : UICollectionView

@property (nonatomic,weak) id<RefreshDelegate> refreshDelegate;

// 下拉刷新
- (void)setRefreshCVNewData;
// 下拉刷新 （设置进入时候，是否立有刷新动画）
- (void)setRefreshCVNewData:(BOOL)refreshing;

// 上拉加载
- (void)setRefreshCVMoreData;


- (void)setRefreshCVMoreData:(BOOL)refreshing;

@property (nonatomic, assign) NSInteger refreshState;

@end
