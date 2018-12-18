//
//  ViewController.m
//  小工具
//
//  Created by 大炮 on 2018/10/8.
//  Copyright © 2018年 大炮. All rights reserved.
//

#import "ViewController.h"
#import "AAController.h"
#import "AppMacro.h"
#import "MainView.h"




#define ScreenWidthPix ([UIScreen mainScreen].bounds.size.width * [UIScreen mainScreen].scale)
#define ScreenHeightPix ([UIScreen mainScreen].bounds.size.height * [UIScreen mainScreen].height)

@interface ViewController ()
{

}
@end

@implementation ViewController





- (void)viewDidLoad {
    [super viewDidLoad];
    
    
	self.view.backgroundColor = [UIColor lightGrayColor];
    
    [self initUI];
}

















-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{



}




-(void)initUI
{
	MainView *main = [[MainView alloc]initWithFrame:RectMake(0, 0, UIScreen.mainScreen.bounds.size.width, AppHeight-NavigaH)];
	[self.view addSubview:main];
}





@end
