//
//
//
//  Created by Beyond on 16/9/9.
//  Copyright © 2016年 Beyond. All rights reserved.

#import <Foundation/Foundation.h>

@interface FileManager : NSObject
/*
 ========================  存  ========================
 */
+(BOOL)writeChangeToken:(NSString *)Tag;//修改关系标记
+(BOOL)writeurl:(NSString *)url;//首页 热卖URL

// 指导页票记
+(BOOL)writeYDTStr:(NSString *)ydt;
+(BOOL)writeYSStr:(NSString *)ys;
+(BOOL)writeXWStr:(NSString *)xw;
+(BOOL)writeXZStr:(NSString *)zx;
+(BOOL)writeJKStr:(NSString *)jk;




/*
 ========================  取  ========================
 */
+(NSString *)Tag;
+(NSString *)url;
+(NSString *)getYdt;
+(NSString *)getYdys;
+(NSString *)getYdxw;
+(NSString *)getYzx;
+(NSString *)getYjk;










/*
 ========================  删  ========================
 */
//退出登录调用
+(void)removeAllFile;











@end
