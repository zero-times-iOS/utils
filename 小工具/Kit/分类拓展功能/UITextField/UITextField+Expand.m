//
//  UITextField+Expand.m
//  OC工具类
//
//  Created by 汤圆 on 2018/7/7.
//  Copyright © 2018年 汤圆. All rights reserved.
//

#import "UITextField+Expand.h"

@implementation UITextField (Expand)


-(instancetype)initWithFrame:(CGRect)frame textColor:(UIColor *)textColor font:(UIFont *)font placeholder:(NSString *)placeholder inView:(UIView *)view
{
    UITextField *textField = [[UITextField alloc]initWithFrame:frame];
    textField.textColor = textColor;
    textField.font = font;
    textField.delegate = self;
    textField.placeholder = placeholder;
    [view addSubview:textField];
    return textField;
}


#pragma mark - UITextFieldDelegate to block
- (void)shouldBeginEditing:(BOOL (^)(UITextField *textField))block {
    self.delegate = self;
    objc_setAssociatedObject(self, @selector(shouldBeginEditing:), block, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}
- (BOOL)textFieldShouldBeginEditing:(UITextField *)textField {
    BOOL (^block)() = objc_getAssociatedObject(self, @selector(shouldBeginEditing:));
    if (block) {
        return block(textField);
    } else {
        return YES;
    }
}

- (void)didBeginEditing:(void (^)(UITextField *textField))block {
    self.delegate = self;
    objc_setAssociatedObject(self, @selector(didBeginEditing:), block, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}
- (void)textFieldDidBeginEditing:(UITextField *)textField {
    void (^block)() = objc_getAssociatedObject(self, @selector(didBeginEditing:));
    if (block) {
        block(textField);
    }
}

- (void)shouldEndEditing:(BOOL (^)(UITextField *textField))block {
    self.delegate = self;
    objc_setAssociatedObject(self, @selector(shouldEndEditing:), block, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}
- (BOOL)textFieldShouldEndEditing:(UITextField *)textField {
    BOOL (^block)() = objc_getAssociatedObject(self, @selector(shouldEndEditing:));
    if (block) {
        return block(textField);
    } else {
        return YES;
    }
}

- (void)didEndEditing:(void (^)(UITextField *textField))block {
    self.delegate = self;
    objc_setAssociatedObject(self, @selector(didEndEditing:), block, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}
- (void)textFieldDidEndEditing:(UITextField *)textField {
    void (^block)() = objc_getAssociatedObject(self, @selector(didEndEditing:));
    if (block) {
        block(textField);
    }
}

- (void)shouldChange:(BOOL (^)(UITextField *textField, NSRange range, NSString *string))block {
    self.delegate = self;
    objc_setAssociatedObject(self, @selector(shouldChange:), block, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}
- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string {
    BOOL (^block)() = objc_getAssociatedObject(self, @selector(shouldChange:));
    if (block) {
        return block(textField, range, string);
    } else {
        return YES;
    }
}

- (void)shouldClear:(BOOL (^)(UITextField *textField))block {
    self.delegate = self;
    objc_setAssociatedObject(self, @selector(shouldClear:), block, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}
- (BOOL)textFieldShouldClear:(UITextField *)textField {
    BOOL (^block)() = objc_getAssociatedObject(self, @selector(shouldClear:));
    if (block) {
        return block(textField);
    } else {
        return YES;
    }
}

- (void)shouldReturn:(BOOL (^)(UITextField *textField))block {
    self.delegate = self;
    objc_setAssociatedObject(self, @selector(shouldReturn:), block, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}
- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    BOOL (^block)() = objc_getAssociatedObject(self, @selector(shouldReturn:));
    if (block) {
        return block(textField);
    } else {
        return YES;
    }
}






@end
