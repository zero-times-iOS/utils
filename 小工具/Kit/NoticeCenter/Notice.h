//
//  Notice.h
//  OC工具类
//
//  Created by 郑学军 on 2016/7/7.
//  Copyright © 2016年 郑学军. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <objc/runtime.h>

typedef void(^NoticeBlock)(NSNotification *obj);
@interface Notice : NSObject


+(instancetype)shared;

/** 发起通知
 *  name：通知名
 *  dic：需要传递的参数
 */
-(void)noticeName:(NSString *)name Parameter:(NSDictionary *)dic;


/** 接收通知
 *  name：通知名
 *  successful：接收通知回调
 */
-(void)receiveNoticeName:(NSString *)name Successful:(NoticeBlock)successful;

/** 删除通知
 *  name：通知名
 */
-(void)removeNotice:(NSString *)name;





@end
