//
//  DataManager.m
//  JiuAiBian
//
//  Created by 汤圆 on 2018/6/27.
//  Copyright © 2018年 汤圆. All rights reserved.
//

#import "DataManager.h"
#import "FileManager.h"


@interface DataManager ()
{
    sqlite3 *db;
}
@end

@implementation DataManager



// 打开数据库
-(void)OpenSqlite
{
    // 如果数据库已经打开，没有必要再打开一次.
    //1.获取沙盒文件名 AiBian
    NSString *fileName = [[NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) lastObject] stringByAppendingPathComponent:@"AiBian.sqlite"];

    //2.创建(打开)数据库 （如果数据库不存在，会自动创建）
    int result = sqlite3_open(fileName.UTF8String, &db);
    // 打开数据库
    if (result == SQLITE_OK)
    {
        // 建表
        const char *sql = "create table if not exists AiBian (id integer primary key autoincrement, temperature text, mode text ,mugwort text, log text, start text, end text, mac text, iphone text);";
        
        //const char *sql = "create table if not exists AiBian(temperature integer, mode integer ,mugwort integer, log text, start text, end text)";
        
        int result = sqlite3_exec(db, sql, nil, nil, nil);
        
        if (result == SQLITE_OK)
        {

            NSLog(@"成功表创建");
        }else {
            
            NSLog(@"创建表失败");
        }
    }
    
}



// 插入数据

-(void)insetDataWith:(NSString *)temperature Mode:(NSString *)mode Mugwort:(NSString *)mugwort Log:(NSString *)log Start:(NSString *)start End:(NSString *)end Mac:(NSString *)mac iPhone:(NSString *)iphone
{
    [self OpenSqlite];
    NSString *sql = [NSString stringWithFormat:@"insert into AiBian (temperature,mode,mugwort,log,start,end,mac,iphone) values ('%@','%@','%@','%@','%@','%@','%@','%@');",temperature,mode,mugwort,log,start,end,mac,iphone];
    char *errorMesg = NULL; // 用来存储错误信息
    int reslut = sqlite3_exec(db, sql.UTF8String, nil, nil, &errorMesg);
    if (reslut == SQLITE_OK)
    {
        NSLog(@"插入数据成功");
    }else
    {
        NSLog(@"插入数据失败");
    }
    
}



-(NSArray *)getdata
{
    //定义一个储存查询结果的数组
    NSMutableArray *Array = [NSMutableArray array];;
    const char *sql = "select id, temperature, mode,mugwort,log,start,end,mac,iphone from AiBian;";
    sqlite3_stmt *stmt = NULL;
    //3.检测SQL语句的合法性
    int result = sqlite3_prepare_v2(db, sql, -1, &stmt, NULL);
    if (result == SQLITE_OK) {
        
        //4.执行SQL语句
        while (sqlite3_step(stmt) == SQLITE_ROW) {
            
            const unsigned char *temperatureOne = sqlite3_column_text(stmt, 1);
            const unsigned char *modeOne = sqlite3_column_text(stmt, 2);
            const unsigned char *mugwortOne = sqlite3_column_text(stmt, 3);
            const unsigned char *logOne = sqlite3_column_text(stmt, 4);
            const unsigned char *startOne = sqlite3_column_text(stmt, 5);
            const unsigned char *endOne = sqlite3_column_text(stmt, 6);
            const unsigned char *macOne = sqlite3_column_text(stmt, 7);
            const unsigned char *iphoneOne = sqlite3_column_text(stmt, 8);
            NSString *temperature = [NSString stringWithUTF8String:(const char *)temperatureOne];
            NSString *mode = [NSString stringWithUTF8String:(const char *)modeOne];
            NSString *mugwort = [NSString stringWithUTF8String:(const char *)mugwortOne];
            NSString *log = [NSString stringWithUTF8String:(const char *)logOne];
            NSString *start = [NSString stringWithUTF8String:(const char *)startOne];
            NSString *end = [NSString stringWithUTF8String:(const char *)endOne];
            NSString *mac = [NSString stringWithUTF8String:(const char *)macOne];
            NSString *iphone = [NSString stringWithUTF8String:(const char *)iphoneOne];
            
           NSDictionary *dic = [self setDicWithOneKey:@"temperature" OneValue:temperature TwoKey:@"vibrationMode" TwoValue:mode ThreeKey:@"existsMugwort" ThreeValue:mugwort FourKey:@"logTime" FourValue:log FiveKey:@"connectionTime" FiveValue:start SixKey:@"disconnectTime" SixValue:end SevenKey:@"deviceMac" SevenValue:mac EightKey:@"userMobile" EightValue:iphone];
            [Array addObject:dic];
            
            
        }
        return Array;
        
    } else {
        NSLog(@"查询语句非法");
        return nil;
    }
   
}


// 拼接参数(不用传页数)
-(NSDictionary *)setDicWithOneKey:(NSString *)onekey
                         OneValue:(NSString *)onevalue
                           TwoKey:(NSString *)twokey
                         TwoValue:(NSString *)twovalue
                         ThreeKey:(NSString *)threekey
                       ThreeValue:(NSString *)threevalue
                          FourKey:(NSString *)fourkey
                        FourValue:(NSString *)fourvalue
                          FiveKey:(NSString *)fivekey
                        FiveValue:(NSString *)fivevalue
                           SixKey:(NSString *)sixkey
                         SixValue:(NSString *)sixvalue
                         SevenKey:(NSString *)sevenkey
                       SevenValue:(NSString *)sevenvalue
                         EightKey:(NSString *)eightkey
                       EightValue:(NSString *)eightvalue


{
    NSMutableDictionary *dic = [[NSMutableDictionary alloc]init];
    
    // 热疗温度
    if ([onevalue isEqualToString:@"(null)"])
    {
        [dic setValue:@"-1" forKey:onekey];
    }else
    {
        [dic setValue:onevalue forKey:onekey];
    }
    // 震动模式
    if ([twovalue isEqualToString:@"(null)"])
    {
        [dic setValue:@"-1" forKey:twokey];
    }else
    {
        [dic setValue:twovalue forKey:twokey];
    }
    // 有无艾条
    if ([threevalue isEqualToString:@"(null)"])
    {
        [dic setValue:@"-1" forKey:threekey];
    }else
    {
        [dic setValue:threevalue forKey:threekey];
    }
    // 记录时间
    if ([fourvalue isEqualToString:@"(null)"])
    {
        [dic setValue:@"-1" forKey:fourkey];
    }else
    {
        [dic setValue:fourvalue forKey:fourkey];
    }
    // 连接时间
    if ([fivevalue isEqualToString:@"(null)"])
    {
        [dic setValue:@"-1" forKey:fivekey];
    }else
    {
        [dic setValue:fivevalue forKey:fivekey];
    }
    // 断开时间
    if ([sixvalue isEqualToString:@"(null)"])
    {
        [dic setValue:@"" forKey:sixkey];
    }else
    {
        [dic setValue:sixvalue forKey:sixkey];
    }
    
    if ([sevenvalue isEqualToString:@"(null)"])
    {
        [dic setValue:@"-1" forKey:sevenkey];
    }else
    {
        [dic setValue:sevenvalue forKey:sevenkey];
    }
    
    if ([eightvalue isEqualToString:@"(null)"])
    {
        [dic setValue:@"-1" forKey:eightkey];
    }else
    {
        [dic setValue:eightvalue forKey:eightkey];
    }
    
    
    
    return dic;
}


















-(void)removeObj
{
    [self OpenSqlite];
    // 清空数据，直接把表强奸
    NSString *sql = @"DELETE FROM AiBian";
    
    char *errorMesg = NULL;
    int result = sqlite3_exec(db, sql.UTF8String, NULL, NULL,&errorMesg );
    if (result == SQLITE_OK)
    {
		// 根据业务需求，可以在这里做一些很骚的操作
		NSLog(@"删除表成功");
    }else
    {
        NSLog(@"删除表失败");
    }
    
}






















+ (instancetype)share
{
    static DataManager *manager;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        manager = [[DataManager alloc] init];
    });
    return manager;
}
@end
