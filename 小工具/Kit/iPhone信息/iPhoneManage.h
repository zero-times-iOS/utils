//
//  iPhoneManage.h
//  OC工具类
//
//  Created by Beyond on 2018/5/15.
//  Copyright © 2018年 Beyond. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreTelephony/CTCarrier.h>
#import <CoreTelephony/CTTelephonyNetworkInfo.h>
#import <UIKit/UIKitDefines.h>
#import "sys/utsname.h"
#import "sys/sysctl.h"

@interface iPhoneManage : NSObject

+(iPhoneManage *)shared;

// App名字
-(NSString *)getAppName;
// App版本号
-(NSString *)getAppVersion;












@end
