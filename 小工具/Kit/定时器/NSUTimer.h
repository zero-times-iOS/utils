//
//
//
//  Created by Beyond on 16/9/9.
//  Copyright © 2018年 Beyond. All rights reserved.

#import <Foundation/Foundation.h>

typedef void(^TimerBlock)(NSTimer *timer);
@interface NSUTimer : NSObject

    
- (instancetype)initWithTimeInterval:(NSTimeInterval)ti handler:(TimerBlock)block;

//
- (void)stop;








@end

/* 使用方法
    [[Time new] timeRun:3.0 Return:^(NSTimer *timer) {
    
        NSLog(@"dfdsafsad");
    }];
 */

