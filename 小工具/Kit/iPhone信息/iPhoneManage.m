//
//  iPhoneManage.m
//  OC工具类
//
//  Created by Beyond on 2018/5/15.
//  Copyright © 2018年 Beyond. All rights reserved.
//

#import "iPhoneManage.h"

static iPhoneManage *iPhone = nil;

@implementation iPhoneManage


+(iPhoneManage *)shared
{
    static dispatch_once_t touch;
    dispatch_once(&touch,^{
        iPhone = [[iPhoneManage alloc]init];
    });
    return iPhone;
}






 //获取APP名称
-(NSString *)getAppName
{
    NSDictionary *infoDictionary = [[NSBundle mainBundle] infoDictionary];
    return [infoDictionary objectForKey:@"CFBundleDisplayName"];
}

//获取APP版本号
-(NSString *)getAppVersion
{
    NSDictionary *infoDictionary = [[NSBundle mainBundle] infoDictionary];
    return [infoDictionary objectForKey:@"CFBundleShortVersionString"];
}


















@end
