//
//  Validate.h
//  OC工具类
//
//  Created by 汤圆 on 2018/4/20.
//  Copyright © 2018年 汤圆. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Show.h"

@interface Validate : NSObject

// 验证电子邮件
+ (BOOL)validateEmail:(NSString *)email;
// 手机号码验证
+ (BOOL)validateMobile:(NSString *)mobile;
// 电话号码验证
+(BOOL)validatePhone:(NSString *)phone;
// 车牌号验证
+ (BOOL)validateCarNo:(NSString *)carNo;
// 验证型汽车类型
+ (BOOL)validateCarType:(NSString *)CarType;
// 用户名
+ (BOOL)validateUserName:(NSString *)name;
// 密码
+ (BOOL)validatePassword:(NSString *)passWord;
// 群昵称
+ (BOOL)validateGroupUserName:(NSString *)name;
// 昵称
+ (BOOL)validateNickname:(NSString *)nickname;
// 身份证号
+ (BOOL)validateIdentityCard:(NSString *)identityCard;
// 字符串是否包含表情
+ (BOOL)stringContainsEmoji:(NSString *)string;
// 字符串里是否包含中文
+ (BOOL)strHaveChinese:(NSString *)str;
// 过虑表情
+(NSString *)disableEmoji:(NSString *)str;



// 用户名判断：用户名首位不能为_或数字，2-16位且不能为纯数字
+ (BOOL)validateWithUserName:(NSString *)userName;
// 数字与字母组合密码
+ (BOOL)validatePWD:(NSString *)passWord;
// 判断输入的密码是否正确，密码长度为8-16位，数字、字母、字符至少包含两种
+ (BOOL)isLegalPassword:(NSString *)password;
// 填写预约入院的，汉字长度2-5位，字母长度3-30位
+ (BOOL)validateIdentityAdmissionName:(NSString *)name;









@end
