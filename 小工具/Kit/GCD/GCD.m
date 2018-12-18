//
//  GCD.m
//  OC工具类
//
//  Created by 汤圆 on 2018/4/20.
//  Copyright © 2018年 汤圆. All rights reserved.
//

#import "GCD.h"

@implementation GCD

+ (dispatch_queue_t)mainQueue {
    return dispatch_get_main_queue();
}

+ (dispatch_queue_t)globalQueue {
    return dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
}

/**主线程异步**/
+ (void)asyncMainQueue:(voidBlock)block {
    dispatch_async([self mainQueue], block);
}

/**子线程异步**/
+ (void)asyncGlobalQueue:(voidBlock)block {
    dispatch_async([self globalQueue], block);
}

/**主线程等待**/
+ (void)afterMainQueue:(double)time :(voidBlock)block {
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(time * NSEC_PER_SEC)),[self mainQueue], block);
}

/**子线程等待**/
+ (void)afterGlobalQueue:(double)time :(voidBlock)block {
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(time * NSEC_PER_SEC)),[self globalQueue], block);
}

/**多任务完成后再执行下一任务**/
+ (void)groupGlobalQueueDask:(voidBlock)groupDaskBlock next:(voidBlock)doneBlock {
    dispatch_group_t group = dispatch_group_create();
    dispatch_group_async(group, [self globalQueue], groupDaskBlock);
    dispatch_group_wait(group, DISPATCH_TIME_FOREVER);//等待任务完成
    //任务完成后下一步执行任务
    doneBlock();
}


/**
 大量任务并发for循环放到一个线程中处理是很慢的，GCD提供两个函数dispatch_apply和dispatch_apply_f,
 dispatch_apply用于block，dispatch_apply_f用于c函数，它们可以替代可并发的for循环，来并行的运行而提高执行效率。
 **/
+ (void)moreGlobalQueueApplyWith:(size_t)count doSomething:(forBlock)doneBlock
{
    dispatch_apply(count, [self globalQueue], doneBlock);
}
























@end
