//
//  ProgressView.h
//  画文字和图片
//
//  Created by Beyond on 16/9/9.
//  Copyright © 2016年 Beyond. All rights reserved.


#import <UIKit/UIKit.h>

@interface ProgressView : UIView


@property (nonatomic ,assign)float pregress;
@property (nonatomic ,strong)UILabel *laber;


@end






/* 使用方法  _progress.pregress = CGFolt   把值给这个东西就可以了。封装得不好，后期优化
ProgressView *textView = [[ProgressView alloc]initWithFrame:CGRectMake(10, 70, WIDTH - 50 , WIDTH - 50)];
textView.backgroundColor = [UIColor lightGrayColor];
_progress = textView;
[self.view addSubview:textView];
*/






