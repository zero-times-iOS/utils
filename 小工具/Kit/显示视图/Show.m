//
//  Show.m
//  OC工具类
//
//  Created by 汤圆 on 2018/4/20.
//  Copyright © 2018年 汤圆. All rights reserved.
//

#import "Show.h"

#define WIDTH  [UIScreen mainScreen].bounds.size.width
#define SHEIGHT [UIScreen mainScreen].bounds.size.height
#define WIDTH_RATIO         (WIDTH/375.0f)

@interface Show ()

@property (nonatomic, strong) NSMutableArray *gifImageArray;
@property (nonatomic, strong) UILabel *textLable;
@property (nonatomic, strong) UIActivityIndicatorView *activityView;
@property (nonatomic, strong) UIImageView *imageView;
@property (nonatomic, strong) UIView *backgroundView;
@property (nonatomic, strong) dispatch_queue_t queue;

@end

@implementation Show

- (UIView *)superView {
    if (!_superView) {
        _superView = [UIApplication sharedApplication].keyWindow;
    }
    return _superView;
}

- (CGFloat)imageWidth {
    if (_imageWidth <= 0.f) {
        _imageWidth = 60.f;
    }
    return _imageWidth;
}

- (CGFloat)space {
    if (_space <= 0.f) {
        _space = 5.f;
    }
    return _space;
}

- (UIColor *)textColor {
    if (!_textColor) {
        _textColor = [UIColor whiteColor];
    }
    return _textColor;
}

- (UIFont *)textFont {
    if (!_textFont) {
        _textFont = [UIFont systemFontOfSize:15 * WIDTH_RATIO];
    }
    return _textFont;
}

- (UIColor *)bgColor {
    if (!_bgColor) {
        _bgColor = [UIColor colorWithRed:0x00 green:0x00 blue:0x00 alpha:0.6];
    }
    return _bgColor;
}

- (NSTimeInterval)interval {
    if (_interval <= 0.f) {
        _interval = 1.f;
    }
    return _interval;
}

- (UIImageView *)imageView {
    if (!_imageView) {
        if (self.gifImageArray.count) {
            _imageView = [[UIImageView alloc]initWithImage:[UIImage animatedImageWithImages:self.gifImageArray duration:self.interval]];
        }
    }
    return _imageView;
}

- (UIActivityIndicatorView *)activityView {
    if (!_activityView) {
        _activityView = [[UIActivityIndicatorView alloc]initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleWhiteLarge];
        _activityView.frame = CGRectMake(MAX(0, (self.textLable.frame.size.width - self.imageWidth)*0.5) + self.space, self.space, self.imageWidth, self.imageWidth);
    }
    return _activityView;
}

- (UIView *)backgroundView {
    if (!_backgroundView) {
        _backgroundView = [[UIView alloc]init];
        _backgroundView.backgroundColor = self.bgColor;
        [self addSubview:_backgroundView];
    }
    return _backgroundView;
}

- (UILabel *)textLable {
    if (!_textLable) {
        _textLable = [[UILabel alloc]init];
        
        _textLable.textAlignment = NSTextAlignmentCenter;
        _textLable.numberOfLines = 0;
        _textLable.adjustsFontSizeToFitWidth = YES;
        _textLable.minimumScaleFactor = 0.8;
    }
    return _textLable;
}

- (void)setGIF:(id)gif {
    _gifImageArray = [NSMutableArray new];
    if ([gif isKindOfClass:NSClassFromString(@"NSArray")]) {
        NSArray *gifArray = gif;
        for (id g in gifArray) {
            if ([g isKindOfClass:NSClassFromString(@"UIImage")]) {
                [_gifImageArray addObject:g];
            } else if ([g isKindOfClass:NSClassFromString(@"NSString")]) {
                UIImage *image = [UIImage imageNamed:g];
                [_gifImageArray addObject:image];
            }
        }
        return;
    }
    if ([gif isKindOfClass:NSClassFromString(@"NSString")]) {
        //假如你的图片命名是从1开始的，请把0改为1
        for (int i = 0; i < 999; i++) {
            NSString *imageString = [NSString stringWithFormat:@"%@%d", gif, i];
            UIImage *image = [UIImage imageNamed:imageString];
            if (image) {
                [_gifImageArray addObject:image];
            } else {
                return;
            }
        }
    }
}

+ (void)showActivity {
    [self asyncMainQueue:^{
        Show *hintView = [[Show alloc]init];
        [hintView showText:nil GIF:NO activity:YES];
    }];
}

+ (void)showGIF:(id)gif {
    [self asyncMainQueue:^{
        Show *hintView = [[Show alloc]init];
        [hintView showText:nil GIF:YES activity:NO];
    }];
   
}

+ (void)showText:(NSString *)text {
    [self asyncMainQueue:^{
        Show *hintView = [[Show alloc]init];
        [hintView showText:text GIF:NO activity:NO];
    }];
    
}

+ (void)showGIF:(id)gif text:(NSString *)text {
    
    [self asyncMainQueue:^{
        Show *hintView = [[Show alloc]init];
        [hintView setGIF:gif];
        [hintView showText:text GIF:YES activity:NO];
    }];
    
}

+ (void)showActivityWithText:(NSString *)text {
    
    [self asyncMainQueue:^{
        Show *hintView = [[Show alloc]init];
        [hintView showText:text GIF:NO activity:YES];
    }];
    
}

- (void)showText:(NSString *)text GIF:(BOOL)gif activity:(BOOL)activity {
    
    //    self.queue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
    
    if ([text isEqualToString:@""] || text.length == 0) {
        text = nil;
    }
    
    [Show removeHintViewFromSuperview:self.superView duration:0];
    self.frame = self.superView.bounds;
    [self.superView addSubview:self];
    
    CGSize size = [text boundingRectWithSize:CGSizeMake(self.imageWidth*2, self.imageWidth*2) options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName: self.textFont} context:nil].size;
    self.textLable.text = text;
    _textLable.textColor = self.textColor;
    _textLable.font = self.textFont;
    if (text) {
        self.textLable.frame = CGRectMake(self.space, self.space, size.width, size.height);
        self.backgroundView.frame = CGRectMake(0, 0, size.width + self.space*2, size.height + self.space*2);
        [self.backgroundView addSubview:self.textLable];
    }
    if (gif || activity) {
        CGRect rect = CGRectMake(MAX(0, (self.textLable.frame.size.width - self.imageWidth)*0.5) + self.space, self.space, self.imageWidth, self.imageWidth);
        if (gif) {
            self.imageView.frame = rect;
            [self.backgroundView addSubview:self.imageView];
        } else if (activity) {
            self.activityView.frame = rect;
            [self.backgroundView addSubview:self.activityView];
            [self.activityView startAnimating];
        }
        if (text) {
            self.textLable.frame = CGRectMake(self.space, self.space + self.imageWidth, MAX(size.width, self.imageWidth), size.height);
            self.backgroundView.frame = CGRectMake(0, 0, MAX(self.imageWidth, self.textLable.frame.size.width) + self.space*2, size.height + self.imageWidth + self.space*2);
        } else {
            self.backgroundView.frame = CGRectMake(0, 0, self.imageWidth + self.space*2, self.imageWidth + self.space*2);
        }
        self.backgroundView.center = self.center;
    } else {
        self.frame = self.backgroundView.frame;
        [Show removeHintViewFromSuperview:self.superView duration:2];
    }
    self.backgroundView.layer.cornerRadius = 5.f;
    
    self.center = CGPointMake(self.superView.bounds.size.width*0.5, self.superView.bounds.size.height*0.5);
}

+ (void)removeHintViewFromSuperview:(UIView *)superView duration:(NSTimeInterval)after {
    if (!superView) {
        superView = [UIApplication sharedApplication].keyWindow;
    }
    for (UIView* subview in superView.subviews) {
        if ([subview isKindOfClass:[self class]]) {
            //            JFHintView *hintView = (JFHintView *)superView;
            //            if (hintView.queue == dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0)) {
            [UIView animateWithDuration:after animations:^{
                subview.alpha = 0.3;
            } completion:^(BOOL finished) {
                [subview removeFromSuperview];
                //                    NSLog(@"移除");
            }];
            //            }
        }
    }
}





/**主线程异步**/
+ (void)asyncMainQueue:(MainBlock)block {
    dispatch_async([self mainQueue], block);
}
+ (dispatch_queue_t)mainQueue {
    return dispatch_get_main_queue();
}

@end
