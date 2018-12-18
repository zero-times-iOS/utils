//
//  XFetchCodeButton.h
//  XFetchCodeButton
//
//  Created by 郑学军 on 2017/4/19.
//  Copyright © 2017年 郑学军. All rights reserved.
//

#import <UIKit/UIKit.h>

static int CountDownDefault = 10; // 倒计时时间
static const NSString * CountDown = @"秒后重发";// 不可用状态提示文字


@interface XFetchCodeButton : UIView

@property (nonatomic, copy) UIColor * disabledColor; // 默认不可用状态颜色
@property (nonatomic, copy) UIColor * normalTintColor; // 默认未点击字体颜色
@property (nonatomic, assign) CGFloat fontSize; // 默认字体大小
@property (nonatomic, copy) NSString * normalTitle;// 默认未点击文字

- (void)addTarget:(id)target action: (SEL)sel forEvents:(UIControlEvents)events;
- (void)doneSend:(void(^)())block;

@end


/*  使用方法
XFetchCodeButton * button = [[XFetchCodeButton alloc] initWithFrame:CGRectMake(20, 100, 100, 50)];
button.backgroundColor = [UIColor purpleColor];
button.disabledColor = [UIColor whiteColor];
button.normalTitle = @"Fetch Code";
button.normalTintColor = [UIColor grayColor];
[self.view addSubview:button];

[button doneSend:^{
    NSLog(@"button click");
}];
 */
