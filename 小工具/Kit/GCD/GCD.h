//
//  GCD.h
//  OC工具类
//
//  Created by 汤圆 on 2018/4/20.
//  Copyright © 2018年 汤圆. All rights reserved.
//

#import <Foundation/Foundation.h>



typedef void(^voidBlock)(void);
typedef void(^forBlock)(size_t);
@interface GCD : NSObject

+ (dispatch_queue_t)mainQueue;

+ (dispatch_queue_t)globalQueue;

// 主线程异步
+ (void)asyncMainQueue:(voidBlock)block;

// 子线程异步**
+ (void)asyncGlobalQueue:(voidBlock)block;

// 主线程等待
+ (void)afterMainQueue:(double)time :(voidBlock)block;

// 子线程等待
+ (void)afterGlobalQueue:(double)time :(voidBlock)block;

// 多任务完成后再执行下一任务
+ (void)groupGlobalQueueDask:(voidBlock)groupDaskBlock next:(voidBlock)doneBlock ;//任务、完成后执行

// 大量任务并发
+ (void)moreGlobalQueueApplyWith:(size_t)count doSomething:(forBlock)doneBlock;

















@end
