//
//  RefreshWebView.h
//  小工具
//
//  Created by qianhaiboshan on 2018/12/9.
//  Copyright © 2018年 大炮. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MJRefresh.h" // 明杰刷新

// 需要刷新的视图都需要遵守协议，自定义刷新功能
@protocol RefreshDelegate <NSObject>

@optional
- (void)loadWBNewData;

@end

@interface RefreshWebView : UIWebView

@property (nonatomic,weak) id<RefreshDelegate> refreshDelegate;
@property (nonatomic, strong) NSString *refreshState;
// 开启下拉刷新
-(void)DownRefreshData;
// 结束下拉刷新
-(void)StopDownRefresh;







@end


