//  UITextField+Expand.h
//  OC工具类
//  Created by 汤圆 on 2018/7/7.
//  Copyright © 2018年 汤圆. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <objc/runtime.h>

@interface UITextField (Expand)<UITextFieldDelegate>



-(instancetype)initWithFrame:(CGRect)frame textColor:(UIColor *)textColor font:(UIFont *)font placeholder:(NSString *)placeholder inView:(UIView *)view;



- (void)shouldBeginEditing:(BOOL (^)(UITextField *textField))block;
- (void)didBeginEditing:(void (^)(UITextField *textField))block;
- (void)shouldEndEditing:(BOOL (^)(UITextField *textField))block;
- (void)didEndEditing:(void (^)(UITextField *textField))block;
- (void)shouldChange:(BOOL (^)(UITextField *textField, NSRange range, NSString *string))block;
- (void)shouldClear:(BOOL (^)(UITextField *textField))block;
- (void)shouldReturn:(BOOL (^)(UITextField *textField))block;







@end
