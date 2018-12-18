//
//  Network.m
//  工具类
//
//  Created by Beyond on 2018/4/22.
//  Copyright © 2018年 汤圆. All rights reserved.
//

#import "Network.h"


@implementation Network


#pragma mark - 科普详情
+(void)scienceParticularsWithSpInfoId:(NSString *)spdnfoid Successfrl:(SuccessBlock)successful orFailurs:(FailBlock)farlure
{
    NSDictionary *parameters = @{@"password":@"123456",
                                 @"username":@"15111229004"};
    
  
    
    AFHTTPSessionManager* manager = [AFHTTPSessionManager manager];
    manager.responseSerializer = [AFHTTPResponseSerializer serializer];
  
  
    [manager POST:KP_URL parameters:parameters progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        
        NSLog(@"%@",responseObject);
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
       
        NSLog(@"%@",error);
    }];
}












+ (void) postRequestWithURL:(NSString *)url DicWithParamters:(NSDictionary *)paramters onSuccess:(void(^)(id responseObject))succBlck  onError:(void(^)(NSError *error))errorBlock
{
    
//    [Network postRequestWithURL:url DicWithParamters:paramters onSuccess:^(id responseObject) {
//        NSDictionary *responseObjectDic = [NSJSONSerialization JSONObjectWithData:responseObject options:NSJSONReadingAllowFragments error:nil];
//        if (Request_Code == 12 || Request_Code == 11) {//登录失效
//
//
//            return;
//        }
//        if (succBlck) {
//            succBlck(responseObjectDic);
//        }
//    } onError:^(NSError *error) {
//        if (errorBlock) {
//            errorBlock(error);
//        }
//    }];
    
    
     [[Network RequestManager]  POST:url parameters:paramters progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
     NSDictionary *responseObjectDic = [NSJSONSerialization JSONObjectWithData:responseObject options:NSJSONReadingAllowFragments error:nil];
     
     if (Request_Code == 12 || Request_Code == 11)
     {//登录失效
     
     
         return;
     }
     if (succBlck)
     {
         succBlck(responseObjectDic);
     }
     } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error)
    {
        if (errorBlock)
        {
            errorBlock(error);
        }
     }];
    
    
    
    
}


+(void)caoNiMaMaPWith:(NSString *)url Params:(NSDictionary *)params Successfrl:(SuccessBlock)successful orFailurs:(FailBlock)farlure
{
	[Network postRequestWithURL:url DicWithParamters:params onSuccess:^(id responseObject) {

		if (successful)
		{
			successful(responseObject);
		}

	} onError:^(NSError *error) {

		if (farlure)
		{
			farlure(error);
		}
	}];


}












































































+(AFHTTPSessionManager *)RequestManager
{
    // 实例化请求类
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    manager.responseSerializer = [AFHTTPResponseSerializer serializer];
    manager.responseSerializer.acceptableContentTypes = [NSSet setWithObjects:@"application/json",@"text/json",@"text/javascript",@"text/plain",@"text/html",nil];
    if (@"UserId" > 0) {
        //将token封装入请求头
        [manager.requestSerializer setValue:@"UserId" forHTTPHeaderField:@"token"];
    }
    return manager;
}

// WiFi网络
+ (BOOL)isWiFi{
    return [AFNetworkReachabilityManager sharedManager].networkReachabilityStatus == AFNetworkReachabilityStatusReachableViaWiFi;
}
// 3G4G
+ (BOOL)is3G4G{
    return [AFNetworkReachabilityManager sharedManager].networkReachabilityStatus == AFNetworkReachabilityStatusReachableViaWWAN;
}
// 网络启用
+ (BOOL)isNetworkEnable {
    return [AFNetworkReachabilityManager sharedManager].networkReachabilityStatus == AFNetworkReachabilityStatusNotReachable;
}

@end
