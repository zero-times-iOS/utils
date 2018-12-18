//
//  DataManager.h
//  JiuAiBian
//
//  Created by 汤圆 on 2018/6/27.
//  Copyright © 2018年 汤圆. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <sqlite3.h>


@interface DataManager : NSObject


// 创建单例
+(instancetype)share;

// 打开数据库
-(void)OpenSqlite;
// 插入数据
-(void)insetDataWith:(NSString *)temperature Mode:(NSString *)mode Mugwort:(NSString *)mugwort Log:(NSString *)log Start:(NSString *)start End:(NSString *)end Mac:(NSString *)mac iPhone:(NSString *)iphone;
// 更新数据
-(void)updateData;
// 取数据
-(NSArray *)getdata;
// 删除数据
-(void)removeObj;












@end

