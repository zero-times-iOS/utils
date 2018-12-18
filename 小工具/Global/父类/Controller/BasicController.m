//
//  BasicController.m
//  工具类
//
//  Created by 汤圆 on 2018/4/27.
//  Copyright © 2018年 汤圆. All rights reserved.
//

#import "BasicController.h"



@implementation BasicController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
 
}





- (void)viewWillAppear:(BOOL)animated
{
    
    [super viewWillAppear:animated];
    // 是否隐藏导航
    if (self.NaviHidden == NO) {
        [self.navigationController setNavigationBarHidden:NO animated:YES];
    }else
    {
        [self.navigationController setNavigationBarHidden:YES animated:YES];
    }
}

-(void)dealloc
{
    
}


@end
