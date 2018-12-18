//
//  CacheFile.m
//  OC工具类
//
//  Created by 汤圆 on 2018/5/15.
//  Copyright © 2018年 汤圆. All rights reserved.
//

#import "CacheFile.h"


static NSTimeInterval cacheTime =  (double)604800;

@implementation CacheFile



+(NSString *)cacheDirectory
{
    NSArray* paths = NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES);
    NSString *cacheDirectory = [paths objectAtIndex:0];
    cacheDirectory = [cacheDirectory stringByAppendingPathComponent:@"FTWCaches"];
    return cacheDirectory;
}

//取
+(NSData *)objectForKey:(NSString*)key
{
    NSFileManager *fileManager = [NSFileManager defaultManager];
    NSString *filename = [self.cacheDirectory stringByAppendingPathComponent:key];
    
    if ([fileManager fileExistsAtPath:filename])
    {
        NSDate *modificationDate = [[fileManager attributesOfItemAtPath:filename error:nil] objectForKey:NSFileModificationDate];
        if ([modificationDate timeIntervalSinceNow] > cacheTime) {
            [fileManager removeItemAtPath:filename error:nil];
        } else {
            NSData *data = [NSData dataWithContentsOfFile:filename];
            return data;
        }
    }
    return nil;
}

//存
+(void)etObject:(NSData *)data forKey:(NSString *)key
{
    NSFileManager *fileManager = [NSFileManager defaultManager];
    NSString *filename = [self.cacheDirectory stringByAppendingPathComponent:key];
    
    BOOL isDir = YES;
    if (![fileManager fileExistsAtPath:self.cacheDirectory isDirectory:&isDir]) {
        [fileManager createDirectoryAtPath:self.cacheDirectory withIntermediateDirectories:NO attributes:nil error:nil];
    }
    
    NSError *error;
    @try {
        [data writeToFile:filename options:NSDataWritingAtomic error:&error];
    }
    @catch (NSException * e) {
        //TODO: error handling maybe
    }
}

//删
+ (void)resetCache
{
    [[NSFileManager defaultManager] removeItemAtPath:[CacheFile cacheDirectory] error:nil];
}















@end
