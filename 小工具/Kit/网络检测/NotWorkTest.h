//
//  NotWorkTest.h
//  OC工具类
//
//  Created by 汤圆 on 2018/7/7.
//  Copyright © 2018年 汤圆. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Reachability.h"
#import <objc/runtime.h>

typedef void (^NotWorkBlock) (int status);
@interface NotWorkTest : NSObject

@property (nonatomic) Reachability *hostReachability;
@property (nonatomic) Reachability *internetReachability;

// 全局单例
+(instancetype)shared;

// 检测是否有网络
-(void)listenNotWork:(NotWorkBlock)status;




/*  使用方法
[[NotWorkTest shared] listenNotWork:^(int status) {
    
    if (status == 0) {
        NSLog(@"-----没有网络");
    }
    if (status == 1) {
        NSLog(@"-------WIFI网络");
    }
    if (status == 2) {
        NSLog(@"-----流量网络");
    }
}];
 */






@end
