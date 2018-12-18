//
//
//
//  Created by Beyond on 16/9/9.
//  Copyright © 2016年 Beyond. All rights reserved.

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import <objc/runtime.h>


typedef void(^TimeBlock)(NSTimer *timer);
@interface Time : NSObject


// 开始
-(void)TimeRun:(NSInteger)time Return:(TimeBlock)timeBlock;

// 停止
-(void)StopRun;








@end

/* 使用方法
    [[Time new] timeRun:3.0 Return:^(NSTimer *timer) {
    
        NSLog(@"dfdsafsad");
    }];
 */

