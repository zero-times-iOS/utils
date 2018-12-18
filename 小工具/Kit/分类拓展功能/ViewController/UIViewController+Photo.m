//
//  UIViewController+Photo.m
//  访问相机相册
//
//  Created by 汤圆 on 2018/5/2.
//  Copyright © 2018年 FirstTe. All rights reserved.
//

#import "UIViewController+Photo.h"

static id key;
@implementation UIViewController (Photo)




// 访问相片
-(void)initPhoto:(PhotoBlock)photoBlock
{
    objc_setAssociatedObject(self, &key, photoBlock, OBJC_ASSOCIATION_COPY);
    //先设定sourceType为相机，然后判断相机是否可用（ipod）没相机，不可用将sourceType设定为相片库
    UIImagePickerControllerSourceType sourceType = UIImagePickerControllerSourceTypeCamera;
    sourceType = UIImagePickerControllerSourceTypeSavedPhotosAlbum; //保存的相片
    UIImagePickerController *picker = [[UIImagePickerController alloc] init];//初始化
    picker.delegate = self;
    picker.allowsEditing = YES;//设置可编辑
    picker.sourceType = sourceType;
    
    [self presentViewController:picker animated:YES completion:nil];
}

// 访问相机
-(void)initCamera:(PhotoBlock)cameraBlock
{
    objc_setAssociatedObject(self, &key, cameraBlock, OBJC_ASSOCIATION_COPY);
    UIImagePickerControllerSourceType sourceType = UIImagePickerControllerSourceTypeCamera;
    [UIImagePickerController isSourceTypeAvailable: UIImagePickerControllerSourceTypeCamera];
    UIImagePickerController *picker = [[UIImagePickerController alloc] init];
    picker.delegate = self;
    //设置拍照后的图片可被编辑
    picker.allowsEditing = YES;
    picker.sourceType = sourceType;
    [self presentViewController:picker animated:YES completion:nil];
    
    
}

- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary<NSString *,id> *)info
{

    //获取到的图片
    UIImage * image = [info valueForKey:UIImagePickerControllerEditedImage];
    PhotoBlock block = (PhotoBlock)objc_getAssociatedObject(self, &key);
    if (block) {
        block(image);
    }
    [picker dismissViewControllerAnimated:YES completion:nil];
    
}


//点击cancel 调用的方法
- (void)imagePickerControllerDidCancel:(UIImagePickerController *)picker
{
    NSLog(@"picker = %@",picker);
    NSLog(@"[picker class] = %@",[picker class]);
    
    //关闭相册界面
    [self dismissViewControllerAnimated:YES completion:nil];
}
















@end
