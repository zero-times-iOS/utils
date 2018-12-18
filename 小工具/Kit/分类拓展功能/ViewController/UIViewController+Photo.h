//
//
//
//  Created by Beyond on 16/9/9.
//  Copyright © 2016年 Beyond. All rights reserved.

#import <UIKit/UIKit.h>
#import <objc/runtime.h>

// PickerTime回调
typedef void(^PhotoBlock)(UIImage *image);
@interface UIViewController (Photo)<UINavigationControllerDelegate,UIImagePickerControllerDelegate>



// 访问相片
-(void)initPhoto:(PhotoBlock)photoBlock;

// 访问相机
-(void)initCamera:(PhotoBlock)cameraBlock;








@end
