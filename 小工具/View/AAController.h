//
//  AAController.h
//  小工具
//
//  Created by 大炮 on 2018/10/29.
//  Copyright © 2018年 大炮. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "WebView.h"

NS_ASSUME_NONNULL_BEGIN

@interface AAController : WebView 


@property (nonatomic ,strong)UITextField *textField;
@property (nonatomic ,strong)UIButton *One;
@property (nonatomic ,strong)UIButton *Two;
@property (nonatomic ,strong)UILabel *laber;
@property (nonatomic ,strong)UILabel *laberone;
@property (nonatomic ,copy)NSString *phone;

@property (nonatomic ,assign)int index;







@end

NS_ASSUME_NONNULL_END


/*



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

 NSLog(@"%@",Self.laberone);
 // 0.0000001

 timess = [NSTimer scheduledTimerWithTimeInterval:0.5 target:self selector:@selector(RunTime:) userInfo:nil repeats:true];

 }];







 }


 -(void)RunTime:(NSTimer *)timer
 {


 [GCD moreGlobalQueueApplyWith:1 doSomething:^(size_t qw) {


 if (self.index < 10000)
 {
 self.phone = [NSString stringWithFormat:@"%@%@",self.textField
 .text,[self randomPassword]];
 BOOL isbool = [Validate validateMobile:self.phone];
 if (isbool == YES)
 {
 self.laber.text = [NSString stringWithFormat:@"电话：%@",self.phone];
 NSDictionary *dic = @{@"mobile":self.laber.text,
 @"scene":@(1),
 @"type":@"mobile"};

 //				//发送验证码
 //				//1. 用户注册 2. 用户找回密码 3. 客户下单 4. 客户支付 5.商家发货 6. 修改手机号码
 //				typedef enum {
 //
 //					LOYESendCodeSceneResgister = 1,
 //					LOYESendCodeSceneFindPwd = 2,
 //					LOYESendCodeSceneDownOrder = 3,
 //					LOYESendCodeScenePay = 4,
 //					LOYESendCodeSceneSendGoods = 5,
 //					LOYESendCodeSceneChangePwd = 6
 //
 //				}LOYESendCodeScene;

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

 */
