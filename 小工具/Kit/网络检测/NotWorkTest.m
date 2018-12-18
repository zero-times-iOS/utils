//
//  NotWorkTest.m
//  OC工具类
//
//  Created by 汤圆 on 2018/7/7.
//  Copyright © 2018年 汤圆. All rights reserved.
//

#import "NotWorkTest.h"

static id key;
@implementation NotWorkTest

+(instancetype)shared
{
    static NotWorkTest *singleten;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        singleten = [[self alloc] init];
    });
    return singleten;
}



-(void)listenNotWork:(NotWorkBlock)status
{
    objc_setAssociatedObject(self, &key, status, OBJC_ASSOCIATION_COPY);
    // Reachability使用了通知，当网络状态发生变化时发送通知kReachabilityChangedNotification
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(NotWorking:) name:kReachabilityChangedNotification object:nil];
    self.internetReachability = [Reachability reachabilityForInternetConnection];
    [self.internetReachability startNotifier];
}


- (void)NotWorking:(NSNotification *)notification
{
    Reachability *reach = [notification object];
    NetworkStatus status = [reach currentReachabilityStatus];
    
    NotWorkBlock block = (NotWorkBlock)objc_getAssociatedObject(self, &key);
    if (block) {
        block(status);
    }
    
}
















@end
