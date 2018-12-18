//
//  Notice.m
//  OC工具类
//
//  Created by 郑学军 on 2016/7/7.
//  Copyright © 2016年 郑学军. All rights reserved.
//

#import "Notice.h"


static id key;
@implementation Notice

+(instancetype)shared
{
    static Notice *singleten;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        singleten = [[self alloc] init];
    });
    return singleten;
}



// 发起通知
-(void)noticeName:(NSString *)name Parameter:(NSDictionary *)dic
{
    [[NSNotificationCenter defaultCenter] postNotificationName:name object:dic];
}

// 接收通知
-(void)receiveNoticeName:(NSString *)name Successful:(NoticeBlock)successful
{
    objc_setAssociatedObject(self, &key, successful, OBJC_ASSOCIATION_COPY);
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(cityNoti:) name:name object:nil];
}

- (void)cityNoti:(NSNotification *)noti
{
    NoticeBlock block = (NoticeBlock)objc_getAssociatedObject(self, &key);
    if (block) {
        block(noti);
    }
}

// 删除通知
-(void)removeNotice:(NSString *)name
{
    [[NSNotificationCenter defaultCenter] removeObserver:self name:name object:nil];
}




















@end
