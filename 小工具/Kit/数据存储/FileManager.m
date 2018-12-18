//
//  FileManager.m
//  ZT
//
//  Created by FirstTe on 22/3/16.
//  Copyright © 2016年 FirstTe. All rights reserved.
//

#import "FileManager.h"

@implementation FileManager



//拼接文件路径
+(NSString *)getPathWithFileString:(NSString *)path
{
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *filePath = [[paths objectAtIndex:0] stringByAppendingString:path];
    return filePath;
}
//把文件存入路径里面
+(NSString *)getDataWithPath:(NSString *)path
{
    return [NSString stringWithContentsOfFile:path encoding:NSUTF8StringEncoding error:nil];
}



/*
 ========================  存  ========================
 */
//存入用户名
+(BOOL)writeChangeToken:(NSString *)Tag
{
    BOOL isbool = false;
    NSString *userNamePath = [self getPathWithFileString:@"/TagPath"];
    if (userNamePath)
    {
        isbool = [Tag writeToFile:userNamePath atomically:YES encoding:NSUTF8StringEncoding error:nil];
    }
    return isbool;
}
//首页URL
+(BOOL)writeurl:(NSString *)url
{
    BOOL isbool = false;
    NSString *UrlPath = [self getPathWithFileString:@"/UrlPath"];
    if (UrlPath)
    {
        isbool = [url writeToFile:UrlPath atomically:YES encoding:NSUTF8StringEncoding error:nil];
    }
    return isbool;
}

+(BOOL)writeYDTStr:(NSString *)ydt
{
    BOOL isbool = false;
    NSString *UrlPath = [self getPathWithFileString:@"/ydtPath"];
    if (UrlPath)
    {
        isbool = [ydt writeToFile:UrlPath atomically:YES encoding:NSUTF8StringEncoding error:nil];
    }
    return isbool;
}
+(BOOL)writeYSStr:(NSString *)ys
{
    BOOL isbool = false;
    NSString *UrlPath = [self getPathWithFileString:@"/ysPath"];
    if (UrlPath)
    {
        isbool = [ys writeToFile:UrlPath atomically:YES encoding:NSUTF8StringEncoding error:nil];
    }
    return isbool;
}
+(BOOL)writeXWStr:(NSString *)xw
{
    BOOL isbool = false;
    NSString *UrlPath = [self getPathWithFileString:@"/xwPath"];
    if (UrlPath)
    {
        isbool = [xw writeToFile:UrlPath atomically:YES encoding:NSUTF8StringEncoding error:nil];
    }
    return isbool;
}
+(BOOL)writeXZStr:(NSString *)zx
{
    BOOL isbool = false;
    NSString *UrlPath = [self getPathWithFileString:@"/zxPath"];
    if (UrlPath)
    {
        isbool = [zx writeToFile:UrlPath atomically:YES encoding:NSUTF8StringEncoding error:nil];
    }
    return isbool;
}
+(BOOL)writeJKStr:(NSString *)jk
{
    BOOL isbool = false;
    NSString *UrlPath = [self getPathWithFileString:@"/jkPath"];
    if (UrlPath)
    {
        isbool = [jk writeToFile:UrlPath atomically:YES encoding:NSUTF8StringEncoding error:nil];
    }
    return isbool;
}



/*
 ========================  取  ========================
 */
//取名字
+(NSString *)Tag
{
    return [self getDataWithPath:[self getPathWithFileString:@"/TagPath"]];
}
//url
+(NSString *)url
{
    return [self getDataWithPath:[self getPathWithFileString:@"/UrlPath"]];
}

+(NSString *)getYdt
{
    return [self getDataWithPath:[self getPathWithFileString:@"/ydtPath"]];
}
+(NSString *)getYdys
{
    return [self getDataWithPath:[self getPathWithFileString:@"/ysPath"]];
}
+(NSString *)getYdxw
{
    return [self getDataWithPath:[self getPathWithFileString:@"/xwPath"]];
}
+(NSString *)getYzx
{
    return [self getDataWithPath:[self getPathWithFileString:@"/zxPath"]];
}
+(NSString *)getYjk
{
    return [self getDataWithPath:[self getPathWithFileString:@"/jkPath"]];
}



/*
 ========================  删  ========================
 */
//退出登录调用
+(void)removeAllFile
{

}
//删除用户名字
+(void)removegetUserName
{
    NSString *userNamePath = [self getPathWithFileString:@"/userNamePath"];
    NSFileManager *manager = [NSFileManager defaultManager];
    [manager removeItemAtPath:userNamePath error:nil];

}

















@end
