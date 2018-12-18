//
//  Network.h
//  工具类
//
//  Created by Beyond on 2018/4/22.
//  Copyright © 2018年 汤圆. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "AFNetworking.h"
#import "URL.h"
#import "GCD.h"
#import "Show.h"


#define Request_Code                   [[(NSDictionary * )responseObjectDic objectForKey:@"code"] integerValue]


typedef void(^SuccessBlock)(id responseObjectDic);//成功回调Block
typedef void(^FailBlock)(id error);//失败回调Block


@interface Network : NSObject

//@property (nonatomic,strong) AFHTTPSessionManager* manager;




// 科普详情
+(void)scienceParticularsWithSpInfoId:(NSString *)spdnfoid Successfrl:(SuccessBlock)successful orFailurs:(FailBlock)farlure;

+(void)caoNiMaMaPWith:(NSString *)url Params:(NSDictionary *)params Successfrl:(SuccessBlock)successful orFailurs:(FailBlock)farlure;
















@end
