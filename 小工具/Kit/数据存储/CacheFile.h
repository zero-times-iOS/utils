//
//
//
//  Created by Beyond on 16/9/9.
//  Copyright © 2016年 Beyond. All rights reserved.

#import <Foundation/Foundation.h>

@interface CacheFile : NSObject


//存取文件（缓存）
+(NSString *)cacheDirectory ;

//删
+(void)resetCache;
//存
+(void)setObject:(NSData *)data forKey:(NSString *)key;
//取
+(id)objectForKey:(NSString *)key;

















@end
