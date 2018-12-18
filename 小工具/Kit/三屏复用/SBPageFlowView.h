//
//  SBPageFlowView.h
//  OC工具类
//
//  Created by 汤圆 on 2018/4/20.
//  Copyright © 2018年 汤圆. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef enum{
    FlowViewOrientationHorizontal = 0,
    FlowViewOrientationVertical
}FlowViewOrientation;

typedef enum {
	PageDirectionPrevious = 0,
	PageDirectionDown
} PageDirectionE;

@protocol SBPageFlowViewDataSource;
@protocol SBPageFlowViewDelegate;

@interface SBPageFlowView : UIView<UIScrollViewDelegate >{
    FlowViewOrientation  _orientation;      
    UIScrollView        *_scrollView;
    UIImageView         *_defaultImageView;   //default，when no data，display default image
    
    BOOL                _needsReload;
    
    CGSize              _pageSize;             //size of page
    NSInteger           _pageCount;            //total page count 
    NSInteger           _currentPageIndex;
    
    NSRange              _visibleRange;
    
    NSMutableArray      *_reusableCells;     //UnseedCell
    NSMutableArray      *_inUseCells;        //using Cell
    
    CGFloat _minimumPageAlpha;          //default is 1.0
    CGFloat _minimumPageScale;          //default is 1.0
    
    id <SBPageFlowViewDataSource>  __unsafe_unretained _dataSource;
    id <SBPageFlowViewDelegate>    __unsafe_unretained  _delegate;

}

@property (nonatomic, assign) id <SBPageFlowViewDataSource> dataSource;
@property (nonatomic, assign) id <SBPageFlowViewDelegate>   delegate;
@property (nonatomic, retain) UIImageView         *defaultImageView;
@property (nonatomic, assign) FlowViewOrientation orientation;
@property (nonatomic, assign, readonly) NSInteger currentPageIndex;
@property (nonatomic, assign) CGFloat minimumPageAlpha;
@property (nonatomic, assign) CGFloat minimumPageScale;

- (void)reloadData;
- (UIView *)dequeueReusableCell;
- (UIView *)cellForItemAtCurrentIndex:(NSInteger)currentIndex;

- (void)scrollToNextPage;

@end

@protocol  SBPageFlowViewDelegate<NSObject>
- (void)didReloadData:(UIView *)cell cellForPageAtIndex:(NSInteger)index;

@optional
- (void)didScrollToPage:(NSInteger)pageNumber inFlowView:(SBPageFlowView *)flowView;
- (void)didSelectItemAtIndex:(NSInteger)index inFlowView:(SBPageFlowView *)flowView;

@end


@protocol SBPageFlowViewDataSource <NSObject>

// Return the number of views.
- (NSInteger)numberOfPagesInFlowView:(SBPageFlowView *)flowView;
- (CGSize)sizeForPageInFlowView:(SBPageFlowView *)flowView;

// Reusable cells
- (UIView *)flowView:(SBPageFlowView *)flowView cellForPageAtIndex:(NSInteger)index;

@end










/* 使用方法

_flowView = [[SBPageFlowView alloc] initWithFrame:CGRectMake(0, -30, WIDTH, HEIGTH)];
_flowView.delegate = self;
_flowView.dataSource = self;
_flowView.minimumPageAlpha = 0.7;
_flowView.minimumPageScale = 0.92;
_flowView.defaultImageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"homeimageView.png"]] ;
[self.view addSubview:_flowView];


#pragma mark - PagedFlowView Datasource
//返回显示View的个数
- (NSInteger)numberOfPagesInFlowView:(SBPageFlowView *)flowView
{
    
    return [_Homearr count];
}

- (CGSize)sizeForPageInFlowView:(SBPageFlowView *)flowView;{
    return CGSizeMake(WIDTH - 55, HEIGTH - 100);
}

//返回给某列使用的View
- (UIView *)flowView:(SBPageFlowView *)flowView cellForPageAtIndex:(NSInteger)index
{
    UIImageView *imageView = (UIImageView *)[flowView dequeueReusableCell];
    if (!imageView) {
        imageView = [[UIImageView alloc] init] ;
        imageView.layer.masksToBounds = YES;
    }
    //开启用户交动
    imageView.userInteractionEnabled = YES;
    
    HomeModel *mo = _Homearr[index];
    
    imageView.backgroundColor = [UIColor whiteColor];
    UIView *vs = [[UIView alloc]initWithFrame:imageView.bounds];
    vs.backgroundColor = [UIColor redColor];
    [imageView addSubview:vs];
    
    imageView.layer.borderWidth = 1;
    imageView.layer.masksToBounds = 1;
    imageView.layer.borderColor = [UIColor colorWithHexString:@"#fac539"].CGColor;
    NSLog(@"%@",mo.imgurl);
    //显示网络图片
    [imageView sd_setImageWithURL:[NSURL URLWithString:mo.imgurl] placeholderImage:[UIImage imageNamed:@"homeimageView.png"]];
    
    //    //在玩人数
    //    UIImageView *view = [[UIImageView alloc]initWithFrame:CGRectZero];
    //    view.image = [UIImage imageNamed:@"home_label"];
    //    UILabel *laberpaye = [[UILabel alloc]initWithFrame:CGRectMake(8, 15, 50, 10)];
    //    laberpaye.text = @"在玩人数";
    //    laberpaye.font = [UIFont systemFontOfSize:10];
    //    laberpaye.textColor = [UIColor whiteColor];
    //    [view addSubview:laberpaye];
    //    UILabel *labernum = [[UILabel alloc]initWithFrame:CGRectMake(8, 30, 40, 10)];
    ////  labernum.text = mo.totalcount;
    //    labernum.textAlignment = NSTextAlignmentCenter;
    //    labernum.font = [UIFont systemFontOfSize:10];
    //    labernum.textColor = [UIColor whiteColor];
    //    [view addSubview:labernum];
    //    [imageView addSubview:view];
    
    //    // 在玩人数适配
    //    [view mas_makeConstraints:^(MASConstraintMaker *make) {
    //
    //        make.size.mas_equalTo(CGSizeMake(55, 65));
    //        make.top.equalTo(@0);
    //        make.right.equalTo(@-10);
    //    }];
    
    //开始游戏按键
    UIButton *but = [UIButton buttonWithType:UIButtonTypeCustom];
    but.tag = index+122;
    
    [imageView addSubview:but];
    
    
    [but mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.size.mas_equalTo(CGSizeMake(96, 96));
        make.bottom.equalTo(@-20);
        make.right.equalTo(@-12);
    }];
    //UIControlEventTouchUpInside
    [but addTarget:self action:@selector(startAction:) forControlEvents:UIControlEventTouchUpInside];
    return imageView;
}

#pragma mark - --------------滑动时调用方法-----------
- (void)didReloadData:(UIView *)cell cellForPageAtIndex:(NSInteger)index
{

    
}

#pragma mark -----------滑动代理方法------------
- (void)didScrollToPage:(NSInteger)pageNumber inFlowView:(SBPageFlowView *)flowView {
    
}

#pragma mark -----------点击代理方法------------
- (void)didSelectItemAtIndex:(NSInteger)index inFlowView:(SBPageFlowView *)flowView
{
    
    
}

*/



