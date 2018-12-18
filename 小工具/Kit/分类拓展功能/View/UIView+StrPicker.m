//
//  UIView+StrPicker.m
//  OC工具类
//
//  Created by 汤圆 on 2018/5/23.
//  Copyright © 2018年 汤圆. All rights reserved.
//

#import "UIView+StrPicker.h"

NSArray *Array;         // 存放自定义Picker数据
NSString *Str;          // 当Picker为时间或字符串时，选中的当前Picker
NSString *Address;      // 判断是否为地址吊用
NSArray *ProvinceArr;   // 省
NSArray *CityArr;       // 市
NSArray *Area;          // 区

static id key;// 存放静态点击事件



@implementation UIView (StrPicker)


/*******************************************
              PickerTime
 *******************************************/
-(void)showPickerTime:(PickTime)pickTime
{
    Address = nil;
    objc_setAssociatedObject(self, &key, pickTime, OBJC_ASSOCIATION_COPY);
    UIView *selfBackView = [[UIView alloc]initWithFrame:self.bounds];
    selfBackView.alpha = 0;
    selfBackView.backgroundColor = RGBColor(152, 152, 152, 1);
    selfBackView.tag = 87236471;
    [self addSubview:selfBackView];
    selfBackView.userInteractionEnabled = YES;
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(selfBackViewAction:)];
    [selfBackView addGestureRecognizer:tap];
    
    
    // 半透明背景框
    UIView *BgView = [[UIView alloc]initWithFrame:CGRectMake(0,  AppHeight, AppWidth, AppHeight*0.3)];
    BgView.backgroundColor = RGBColor(249, 249, 249, 1);
    BgView.tag = 123123;
    [selfBackView addSubview:BgView];
    
    UIView *ButView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, AppWidth, 40)];
    ButView.backgroundColor = RGBColor(205, 205, 205, 0.5);
    [BgView addSubview:ButView];
    
    // NO
    UIButton *NoBut = [UIButton buttonWithType:UIButtonTypeCustom];
    NoBut.frame = CGRectMake(0, 0, AppWidth / 3, 40);
    [NoBut setTitleColor:RGBColor(250, 250, 250, 1) forState:0];
    [NoBut setTitle:@"关闭" forState:0];
    [NoBut addTarget:self action:@selector(NoButAction) forControlEvents:UIControlEventTouchUpInside];
    [ButView addSubview:NoBut];
    
    // Yes
    UIButton *YesBut = [UIButton buttonWithType:UIButtonTypeCustom];
    YesBut.frame = CGRectMake(AppWidth - (AppWidth/3),0 , AppWidth / 3, 40);
    [YesBut setTitleColor:RGBColor(250, 250, 250, 1) forState:0];
    [YesBut setTitle:@"确定" forState:0];
    [YesBut addTarget:self action:@selector(YesButAction) forControlEvents:UIControlEventTouchUpInside];
    [ButView addSubview:YesBut];
    
    
    //时间
    UIDatePicker *Picker = [[UIDatePicker alloc]initWithFrame:CGRectMake(0, 40, AppWidth, BgView.frame.size.height-40)];
    Picker.datePickerMode = UIDatePickerModeDate;
    NSLocale *locale = [[NSLocale alloc]initWithLocaleIdentifier:@"zh_CN"];// 设置为中文显示
    Picker.locale = locale;
    Picker.tag = 68454564251;
    // 设置当前显示时间
    [Picker setDate:[NSDate date] animated:YES];
    [BgView addSubview:Picker];
    [ Picker addTarget:self action:@selector(dateChanged) forControlEvents:UIControlEventValueChanged ];
    
    // 动画
    [UIView animateWithDuration:0.4 animations:^{
        selfBackView.alpha = 1;
        BgView.frame = CGRectMake(0,  AppHeight*0.7 - 10, AppWidth, AppHeight*0.3);
    } completion:^(BOOL finished) {
        
        [UIView animateWithDuration:0.2 animations:^{
            BgView.frame = CGRectMake(0,  AppHeight*0.7 , AppWidth, AppHeight*0.3);
        }];
    }];
    
    
}

-(void)dateChanged
{
    //    UIDatePicker *picker = (UIDatePicker *)[self viewWithTag:68454564251];
    //    NSDate* _date = picker.date;
    //    NSDateFormatter *pickerString = [[NSDateFormatter alloc]init];
    //    [pickerString setDateFormat:@"yyyy-MM-dd"];
    //    NSString *DateString = [pickerString stringFromDate:_date];
    //    NSLog(@"您选择的时间是：%@",DateString);
}
#pragma mark ============= 取消 ===============
-(void)NoButAction
{
    [self removeView];
}
-(void)selfBackViewAction:(UITapGestureRecognizer *)tap
{
    [self removeView];
}
-(void)YesButAction
{
    UIDatePicker *picker = (UIDatePicker *)[self viewWithTag:68454564251];
    NSDate* _date = picker.date;
    NSDateFormatter *pickerString = [[NSDateFormatter alloc]init];
    [pickerString setDateFormat:@"yyyy-MM-dd"];
    NSString *DateString = [pickerString stringFromDate:_date];
    
    PickTime block = (PickTime)objc_getAssociatedObject(self, &key);
    if (block) {
        block(DateString);
    }
    
    
    [self removeView];
}

-(void)removeView
{
    static UIView *BackView;
    static UIView *BgView;
    BackView = (UIView *)[self viewWithTag:87236471];
    BgView = (UIView *)[self viewWithTag:123123];
    
    [UIView animateWithDuration:0.4 animations:^{
        BgView.frame = CGRectMake(0,  AppHeight , AppWidth, AppHeight*0.3);
        BackView.alpha = 0;
    } completion:^(BOOL finished) {
        [BackView removeFromSuperview];
        BackView = nil;
    }];
}





/*******************************************
                PickerStr
 *******************************************/
-(void)showPickerStyArray:(NSArray *)arr PickStr:(PickTime)pickStr;
{
    Address = nil;
    Array = arr;
    objc_setAssociatedObject(self, &key, pickStr, OBJC_ASSOCIATION_COPY);
    UIView *selfBackView = [[UIView alloc]initWithFrame:self.bounds];
    selfBackView.backgroundColor = RGBColor(152, 152, 152, 1);
    selfBackView.tag = 8723;
    selfBackView.alpha = 0;
    [self addSubview:selfBackView];
    selfBackView.userInteractionEnabled = YES;
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(selfBackViewActionStr:)];
    [selfBackView addGestureRecognizer:tap];
    
    
    //按键背景框
    UIView *BgView = [[UIView alloc]initWithFrame:CGRectMake(0,  AppHeight, AppWidth, AppHeight*0.3)];
    BgView.backgroundColor = RGBColor(249, 249, 249, 1);
    BgView.tag = 393201;
    [selfBackView addSubview:BgView];
    
    UIView *ButView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, AppWidth, 40)];
    ButView.backgroundColor = RGBColor(205, 205, 205, 0.5);
    [BgView addSubview:ButView];
    
    // NO
    UIButton *NoBut = [UIButton buttonWithType:UIButtonTypeCustom];
    NoBut.frame = CGRectMake(0, 0, AppWidth / 3, 40);
    [NoBut setTitleColor:RGBColor(250, 250, 250, 1) forState:0];
    [NoBut setTitle:@"关闭" forState:0];
    [NoBut addTarget:self action:@selector(NoButActionStr) forControlEvents:UIControlEventTouchUpInside];
    [ButView addSubview:NoBut];
    
    // Yes
    UIButton *YesBut = [UIButton buttonWithType:UIButtonTypeCustom];
    YesBut.frame = CGRectMake(AppWidth - (AppWidth/3),0 , AppWidth / 3, 40);
    [YesBut setTitleColor:RGBColor(250, 250, 250, 1) forState:0];
    [YesBut setTitle:@"确定" forState:0];
    [YesBut addTarget:self action:@selector(YesButActionStr) forControlEvents:UIControlEventTouchUpInside];
    [ButView addSubview:YesBut];
    
    UIPickerView *pickerView = [[UIPickerView alloc] initWithFrame:CGRectMake(0, 40, AppWidth, BgView.frame.size.height-40)];
    // 显示选中框
    pickerView.tag = 32412;
    pickerView.showsSelectionIndicator=YES;
    pickerView.dataSource = self;
    pickerView.delegate = self;
    [BgView addSubview:pickerView];
    
    
    // 动画
    [UIView animateWithDuration:0.4 animations:^{
        selfBackView.alpha = 1;
        BgView.frame = CGRectMake(0,  AppHeight*0.7 - 10, AppWidth, AppHeight*0.3);
    } completion:^(BOOL finished) {
        
        [UIView animateWithDuration:0.2 animations:^{
            BgView.frame = CGRectMake(0,  AppHeight*0.7 , AppWidth, AppHeight*0.3);
        }];
    }];
}


/*******************************************
                PickerAddress
 *******************************************/
-(void)showAddress:(PickTime)pickaddress;
{
    Address = @"地址";
    NSString *filePath = [[NSBundle mainBundle]pathForResource:@"Province" ofType:@"plist"];
    ProvinceArr = [NSArray arrayWithContentsOfFile:filePath];
    
    
    objc_setAssociatedObject(self, &key, pickaddress, OBJC_ASSOCIATION_COPY);
    UIView *selfBackView = [[UIView alloc]initWithFrame:self.bounds];
    selfBackView.backgroundColor = RGBColor(152, 152, 152, 1);
    selfBackView.tag = 8723;
    selfBackView.alpha = 0;
    [self addSubview:selfBackView];
    selfBackView.userInteractionEnabled = YES;
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(selfBackViewActionStr:)];
    [selfBackView addGestureRecognizer:tap];
    
    
    //按键背景框
    UIView *BgView = [[UIView alloc]initWithFrame:CGRectMake(0,  AppHeight, AppWidth, AppHeight*0.3)];
    BgView.backgroundColor = RGBColor(249, 249, 249, 1);
    BgView.tag = 393201;
    [selfBackView addSubview:BgView];
    
    UIView *ButView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, AppWidth, 40)];
    ButView.backgroundColor = RGBColor(205, 205, 205, 0.5);
    [BgView addSubview:ButView];
    
    // NO
    UIButton *NoBut = [UIButton buttonWithType:UIButtonTypeCustom];
    NoBut.frame = CGRectMake(0, 0, AppWidth / 3, 40);
    [NoBut setTitleColor:RGBColor(250, 250, 250, 1) forState:0];
    [NoBut setTitle:@"关闭" forState:0];
    [NoBut addTarget:self action:@selector(NoButActionStr) forControlEvents:UIControlEventTouchUpInside];
    [ButView addSubview:NoBut];
    
    // Yes
    UIButton *YesBut = [UIButton buttonWithType:UIButtonTypeCustom];
    YesBut.frame = CGRectMake(AppWidth - (AppWidth/3),0 , AppWidth / 3, 40);
    [YesBut setTitleColor:RGBColor(250, 250, 250, 1) forState:0];
    [YesBut setTitle:@"确定" forState:0];
    [YesBut addTarget:self action:@selector(YesButActionStr) forControlEvents:UIControlEventTouchUpInside];
    [ButView addSubview:YesBut];
    
    UIPickerView *pickerView = [[UIPickerView alloc] initWithFrame:CGRectMake(0, 40, AppWidth, BgView.frame.size.height-40)];
    // 显示选中框
    pickerView.tag = 32412;
    pickerView.showsSelectionIndicator=YES;
    pickerView.dataSource = self;
    pickerView.delegate = self;
    [BgView addSubview:pickerView];
    
    
    // 动画
    [UIView animateWithDuration:0.4 animations:^{
        selfBackView.alpha = 1;
        BgView.frame = CGRectMake(0,  AppHeight*0.7 - 10, AppWidth, AppHeight*0.3);
    } completion:^(BOOL finished) {
        
        [UIView animateWithDuration:0.2 animations:^{
            BgView.frame = CGRectMake(0,  AppHeight*0.7 , AppWidth, AppHeight*0.3);
        }];
    }];
}




// pickerView 列数
- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView {
    if (Address) // 三级联动
    {
        return 3;
    }else
    {
        return 1;
    }
    
}


// pickerView 每列个数
- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component
{
    if (Address)    // 三级联动
    {
        if (component == 0)
        {
            return 1;
        }
        if (component == 1)
        {
            return 2;
        }if (component == 2)
        {
            return 3;
        }
        return 0;
        
    }else       // 自定义Pickero数组
    {
        return Array.count;
    }
}

#pragma Mark -- UIPickerViewDelegate
// 每列宽度
- (CGFloat)pickerView:(UIPickerView *)pickerView widthForComponent:(NSInteger)component {
    
    if (Address)    // 三级联动
    {
        return self.frame.size.width/3;
    }else           // 自定义Pickero数组
    {
        return self.frame.size.width;
    }
    
}
// 返回选中的行
- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component
{
    if (Address)    // 三级联动
    {
        if (component == 0)
        {
            CityArr = [ProvinceArr objectAtIndex:row];
        }
        if (component == 1)
        {
            CityArr = [ProvinceArr objectAtIndex:row];
        }
        if (component == 2)
        {
            
        }
        
        
    }else           // 自定义Pickero数组
    {
        if (Array.count != 0) {
            Str = [Array objectAtIndex:row];
        }
    }
}

//  返回当前行的内容,此处是将数组中数值添加到滚动的那个显示栏上
-(NSString*)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component
{
    if (Array.count != 0) {
        return [Array objectAtIndex:row];
    }else
    {
        return nil;
    }
}




-(void)NoButActionStr
{
    [self removeStrView];
}
-(void)YesButActionStr
{
    PickTime block = (PickTime)objc_getAssociatedObject(self, &key);
    if (Str == nil) {
        Str = [Array objectAtIndex:0];
    }
    if (block) {
        block(Str);
        Str = nil;
    }
    [self removeStrView];
}
-(void)selfBackViewActionStr:(UITapGestureRecognizer *)tap
{
    [self removeStrView];
}

-(void)removeStrView
{
    static UIView *BackView;
    static UIView *BgView;
    BackView = (UIView *)[self viewWithTag:8723];
    BgView = (UIView *)[self viewWithTag:393201];
    
    [UIView animateWithDuration:0.4 animations:^{
        BgView.frame = CGRectMake(0,  AppHeight , AppWidth, AppHeight*0.3);
        BackView.alpha = 0;
    } completion:^(BOOL finished) {
        [BackView removeFromSuperview];
        BackView = nil;
    }];
    
}






















@end
