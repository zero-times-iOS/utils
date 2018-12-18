//
//  SWQRCodeViewController.h
//  SWQRCode_Objc
//
//  Created by zhuku on 2018/4/4.
//  Copyright © 2018年 selwyn. All rights reserved.
//

#import "SWQRCode.h"

@interface SWQRCodeViewController : UIViewController

@property (nonatomic, strong) SWQRCodeConfig *codeConfig;

@end








/*
使用方法
SWQRCodeConfig *config = [[SWQRCodeConfig alloc]init];
config.scannerType = SWScannerTypeBoth;

SWQRCodeViewController *qrcodeVC = [[SWQRCodeViewController alloc]init];
qrcodeVC.codeConfig = config;
[self.navigationController pushViewController:qrcodeVC animated:YES];
*/
