//
//  UIView+Photo.h
//  OC工具类
//
//  Created by 汤圆 on 2018/7/7.
//  Copyright © 2018年 汤圆. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <objc/runtime.h>


typedef void(^PhotoBlock)(UIImage *image);
@interface UIView (Photo)<UINavigationControllerDelegate,UIImagePickerControllerDelegate>


// 访问相片
-(void)initPhoto:(UIViewController *)controller Photo:(PhotoBlock)photoBlock;

// 访问相机
-(void)initCamera:(UIViewController *)controller Camera:(PhotoBlock)cameraBlock;









@end
