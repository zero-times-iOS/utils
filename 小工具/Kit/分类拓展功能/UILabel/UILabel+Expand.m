//
//  UILabel+Expand.m
//  工具类
//
//  Created by 汤圆 on 2018/7/7.
//  Copyright © 2018年 汤圆. All rights reserved.
//

#import "UILabel+Expand.h"

@implementation UILabel (Expand)

-(instancetype)initWithFrame:(CGRect)frame font:(UIFont *)font inView:(UIView *)view
{
    UILabel *label = [[UILabel alloc]initWithFrame:frame];
    label.font = font;
    [view addSubview:label];
    return label;
}


#pragma mark =========== 获取文本高度
-(CGFloat)textHight
{
    
    CGSize labelSize = [self.text boundingRectWithSize:CGSizeMake(self.frame.size.width, MAXFLOAT) options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName:self.font} context:nil].size;
    
    return labelSize.height;
    
}
#pragma mark =========== 获取文本宽度
-(CGFloat)textWidth
{
    
    CGSize labelSize = [self.text boundingRectWithSize:CGSizeMake(MAXFLOAT, CGRectGetHeight(self.frame)) options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName:self.font} context:nil].size;
    
    return labelSize.width;
    
}

#pragma mark =========== 设置左上对齐
- (void) textLeftTopAlign
{
    NSDictionary *attributes = @{NSFontAttributeName:self.font};
    CGSize labelSize = [self.text boundingRectWithSize:CGSizeMake(self.frame.size.width, MAXFLOAT) options:NSStringDrawingUsesLineFragmentOrigin attributes:attributes context:nil].size;
    
    CGRect dateFrame = CGRectMake(self.frame.origin.x, self.frame.origin.y, self.frame.size.width, labelSize.height);
    self.frame = dateFrame;
}



#pragma mark =========== 范围文字设置颜色
-(void)fuwenbenLabelFontNumber:(UIFont *)font andRange:(NSRange)range
{
    NSMutableAttributedString *str = [[NSMutableAttributedString alloc] initWithString:self.text];
    //设置字号
    [str addAttribute:NSFontAttributeName value:font range:range];
    self.attributedText = str;
}
#pragma mark =========== 范围文字设置颜色
-(void)fuwenbenLabelColor:(UIColor *)vaColor andRange:(NSRange)range{
    NSMutableAttributedString *str = [[NSMutableAttributedString alloc] initWithString:self.text];
    //设置文字颜色
    [str addAttribute:NSForegroundColorAttributeName value:vaColor range:range];
    self.attributedText = str;
}

#pragma mark =========== 文本添加中划线线
-(void)textDeleteLine
{
    if (!self) {
        return;
    }
    NSMutableAttributedString *attri = [[NSMutableAttributedString alloc] initWithString:self.text];
    [attri setAttributes:@{NSStrikethroughStyleAttributeName : @(NSUnderlinePatternSolid | NSUnderlineStyleSingle),NSStrikethroughColorAttributeName : [UIColor grayColor], NSBaselineOffsetAttributeName : @(NSUnderlineStyleSingle)} range:NSMakeRange(0, self.text.length)];
    [self setAttributedText:attri];
}
#pragma mark =========== 调整部分文本的字体大小
- (void)adjustFont:(UIFont *)font range:(NSRange)range{
    NSMutableAttributedString *str = [[NSMutableAttributedString alloc] initWithString:self.text];
    [str addAttribute:NSFontAttributeName value:font range:range];
    self.attributedText = str;
}



#pragma mark =========== 改变行间距
- (void)changeLineSpace:(float)space
{
    
    NSString *labelText = self.text;
    NSMutableAttributedString *attributedString = [[NSMutableAttributedString alloc] initWithString:labelText];
    NSMutableParagraphStyle *paragraphStyle = [[NSMutableParagraphStyle alloc] init];
    [paragraphStyle setLineSpacing:space];
    [attributedString addAttribute:NSParagraphStyleAttributeName value:paragraphStyle range:NSMakeRange(0, [labelText length])];
    self.attributedText = attributedString;
    [self sizeToFit];
    
}
#pragma mark =========== 改变字间距
- (void)changeWordSpace:(float)space
{
    
    NSString *labelText = self.text;
    NSMutableAttributedString *attributedString = [[NSMutableAttributedString alloc] initWithString:labelText attributes:@{NSKernAttributeName:@(space)}];
    NSMutableParagraphStyle *paragraphStyle = [[NSMutableParagraphStyle alloc] init];
    [attributedString addAttribute:NSParagraphStyleAttributeName value:paragraphStyle range:NSMakeRange(0, [labelText length])];
    self.attributedText = attributedString;
    [self sizeToFit];
    
}

#pragma mark =========== 改变字间距/行间距
- (void)changeLineSpace:(float)lineSpace WordSpace:(float)wordSpace
{
    
    NSString *labelText = self.text;
    NSMutableAttributedString *attributedString = [[NSMutableAttributedString alloc] initWithString:labelText attributes:@{NSKernAttributeName:@(wordSpace)}];
    NSMutableParagraphStyle *paragraphStyle = [[NSMutableParagraphStyle alloc] init];
    [paragraphStyle setLineSpacing:lineSpace];
    [attributedString addAttribute:NSParagraphStyleAttributeName value:paragraphStyle range:NSMakeRange(0, [labelText length])];
    self.attributedText = attributedString;
    [self sizeToFit];
    
}


@end
