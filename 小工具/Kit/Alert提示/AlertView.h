//
//  AlertView.h
//  佳能宝蓝牙
//
//  Created by 汤圆 on 2018/4/16.
//  Copyright © 2018年 汤圆. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void(^ALERTBLOCK)(NSString *Str);
typedef void(^ConfirmBlock)(void);//确定回调Block
@interface AlertView : UIView



+(void)ShowAlertMessage:(NSString *)mes Controller:(UIViewController *)controller Confirm:(ConfirmBlock)confirm;




@end
