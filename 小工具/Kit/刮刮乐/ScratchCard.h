//
//
//
//  Created by Beyond on 16/9/9.
//  Copyright © 2016年 Beyond. All rights reserved.

#import <UIKit/UIKit.h>

typedef void(^scratchCompletion)(id userInfo);
@interface ScratchCard : UIView


/**
 要刮的底图.
 */
@property (nonatomic, strong) UIImage *image;

/**
 涂层图片.
 */
@property (nonatomic, strong) UIImage *surfaceImage;

/**
 涂层是否已被刮开
 */
@property (nonatomic, assign, readonly, getter = isOpen) BOOL open;

/**
 刮出后的回调.
 */
@property (nonatomic, strong) scratchCompletion completion;

/**
 可携带一些自定义信息, 将会在回调的block内回传.
 */
@property (nonatomic, strong) id userInfo;

/**
 重置刮刮卡涂层.
 */
- (void)reset;

/**
 用这个方法初始化.
 */
- (id)initWithFrame:(CGRect)frame;









/** 使用方法
    self.scratchCardView = [[HYScratchCardView alloc]initWithFrame:CGRectMake(85, 100, 150, 150)];
    self.scratchCardView.image = [UIImage imageNamed:@"lottery_award"];
    [self.view addSubview:self.scratchCardView];
    self.scratchCardView.completion = ^(id userInfo) {
        NSLog(@"刮奖完成");
    };
 
    重置
    [self.scratchCardView reset];
 */







@end
