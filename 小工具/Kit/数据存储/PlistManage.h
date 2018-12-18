//
//
//
//  Created by Beyond on 16/9/9.
//  Copyright © 2016年 Beyond. All rights reserved.

#import <Foundation/Foundation.h>
#import <sys/utsname.h>

@interface PlistManage : NSObject




/*
    ---------------- 记录搜索历史记录 ----------------
 */
//存数据
+(BOOL)writeDataWith:(id)data Path:(NSString *)pach;
//取数据
+(id)getDataWith:(NSString *)pach;



/*
 ---------------- 记录是否是第一次进入指导页 ----------------
 */
//存数据
+(BOOL)writeDirectWith:(id)data Path:(NSString *)pach;
//取数据
+(id)getDirectWith:(NSString *)pach;









@end
