//
//  AlertView.m
//  佳能宝蓝牙
//
//  Created by 汤圆 on 2018/4/16.
//  Copyright © 2018年 汤圆. All rights reserved.
//

#import "AlertView.h"

@interface AlertView ()

@end

@implementation AlertView







+(void)ShowAlertMessage:(NSString *)mes Controller:(UIViewController *)controller Confirm:(ConfirmBlock)confirm
{
    UIAlertController *Alert = [UIAlertController alertControllerWithTitle:@"温馨提示" message:mes preferredStyle:UIAlertControllerStyleAlert];
    UIAlertAction *Yes = [UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        confirm();
    }];
    UIAlertAction *No = [UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:nil];
    // 添加
    [Alert addAction:Yes];
    [Alert addAction:No];
    // 显示
    [controller presentViewController:Alert animated:Yes completion:nil];
}










@end
