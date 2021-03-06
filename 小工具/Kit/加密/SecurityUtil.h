//
//  SecurityUtil.h
//  Smile
//
//  Created by 蒲晓涛 on 12-11-24.
//  Copyright (c) 2012年 BOX. All rights reserved.
//

// 版权属于原作者
// http://code4app.com (cn) http://code4app.net (en)
// 发布代码于最专业的源码分享网站: Code4App.com

#import <Foundation/Foundation.h>

#define AES_KEY @"6sa175asc@qq.com" //key可修改

@interface SecurityUtil : NSObject 

#pragma mark - base64
//+ (NSString*)encodeBase64String:(NSString *)input;
//+ (NSString*)decodeBase64String:(NSString *)input;
//
//+ (NSString*)encodeBase64Data:(NSData *)data;
//+ (NSString*)decodeBase64Data:(NSData *)data;

#pragma mark - AES加密
//将string转成带密码的data
//加密后16进制输出
+(NSString*)encryptAESDataToHexString:(NSString*)string app_key:(NSString*)key ;



//将带密码的data转成string
//解密base64
+(NSString*)decryptAESStringFromBase64:(NSString *)string  app_key:(NSString*)key;

//解密16进制
+(NSString*)decryptAESStringFromHexString:(NSString *)string  app_key:(NSString*)key;

@end
