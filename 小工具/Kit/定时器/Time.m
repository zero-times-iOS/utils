//
//  Time.m
//  工具类
//
//  Created by 汤圆 on 2018/4/28.
//  Copyright © 2018年 汤圆. All rights reserved.
//

#import "Time.h"




static id key;
NSTimer *timess;
@implementation Time

-(void)TimeRun:(NSInteger)time Return:(TimeBlock)timeBlock
{
    objc_setAssociatedObject(self, &key, timeBlock, OBJC_ASSOCIATION_COPY);
    timess = [NSTimer scheduledTimerWithTimeInterval:time target:self selector:@selector(RunTime:) userInfo:nil repeats:true];

}

-(void)RunTime:(NSTimer *)timer
{

    //停止定时器
    TimeBlock block = (TimeBlock)objc_getAssociatedObject(self, &key);
    if (block) {
        block(timer);
    }
}

-(void)StopRun
{
	[timess invalidate];
	timess = nil;
}






@end
