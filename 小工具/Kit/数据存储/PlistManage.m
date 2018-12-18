//
//  PlistManage.m
//  JiuAiBian
//
//  Created by 汤圆 on 2018/1/4.
//  Copyright © 2018年 汤圆. All rights reserved.
//

#import "PlistManage.h"

@implementation PlistManage





//存数据
+(BOOL)writeDataWith:(id)data Path:(NSString *)pach
{
    BOOL isbool = false;
    
    NSString *doc = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) lastObject] ;
    NSString *plistPath = [doc stringByAppendingPathComponent:[NSString stringWithFormat:@"%@.plist",pach]];
    if (plistPath)
    {
        isbool = [data writeToFile:plistPath atomically:YES];
    }
    return isbool;
}

//取数据
+(id)getDataWith:(NSString *)pach
{

    NSString *doc = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) lastObject] ;
    NSString *plistPath = [doc stringByAppendingPathComponent:[NSString stringWithFormat:@"%@.plist",pach]];
    NSArray *dossc = [NSArray arrayWithContentsOfFile:plistPath];
    return dossc;
}

/*
 ---------------- 记录是否是第一次进入指导页 ----------------
 */
//存数据
+(BOOL)writeDirectWith:(id)data Path:(NSString *)pach
{
    BOOL isbool = false;
    NSString *doc = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) lastObject] ;
    NSString *plistPath = [doc stringByAppendingPathComponent:[NSString stringWithFormat:@"%@.plist",pach]];
    if (plistPath)
    {
        isbool = [data writeToFile:plistPath atomically:YES];
    }
    return isbool;
}
//取数据
+(id)getDirectWith:(NSString *)pach
{
    NSString *doc = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) lastObject] ;
    NSString *plistPath = [doc stringByAppendingPathComponent:[NSString stringWithFormat:@"%@.plist",pach]];
    NSArray *dossc = [NSArray arrayWithContentsOfFile:plistPath];
    return dossc;
}







@end
