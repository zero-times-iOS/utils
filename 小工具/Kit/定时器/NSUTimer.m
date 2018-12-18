//
//  Time.m
//  工具类
//
//  Created by 汤圆 on 2018/4/28.
//  Copyright © 2018年 汤圆. All rights reserved.
//

#import "NSUTimer.h"

@interface CSTimer : NSObject
@property (nonatomic, strong) NSTimer *timer;
@end

@implementation NSUTimer
{
    NSTimer *_timer;
    NSTimeInterval _interval;
    TimerBlock _block;
}
    
- (instancetype)initWithTimeInterval:(NSTimeInterval)ti handler:(TimerBlock)block
{
    self = [super init];
    if (self) {
        _interval = ti;
        _block = block;
        _timer = [NSTimer scheduledTimerWithTimeInterval:_interval target:self selector:@selector(timerRun) userInfo:nil repeats:true];
    }
    return self;
}

- (void)timerRun
{
    if (_block) {
        _block(_timer);
    }
}

- (void)stop
{
    [_timer invalidate];
    _timer = nil;
}

@end
