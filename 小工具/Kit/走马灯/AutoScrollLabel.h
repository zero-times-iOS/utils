//
//  ProgressView.h
//  画文字和图片
//
//  Created by Beyond on 16/9/9.
//  Copyright © 2016年 Beyond. All rights reserved.

#import <UIKit/UIKit.h>

#define NUM_LABELS 2

enum AutoScrollDirection {
	AUTOSCROLL_SCROLL_RIGHT,
	AUTOSCROLL_SCROLL_LEFT,
};

@interface AutoScrollLabel : UIScrollView <UIScrollViewDelegate>{
	UILabel *label[NUM_LABELS];
	enum AutoScrollDirection scrollDirection;
	float scrollSpeed;
	NSTimeInterval pauseInterval;
	int bufferSpaceBetweenLabels;
	bool isScrolling;
}
@property(nonatomic) enum AutoScrollDirection scrollDirection;
@property(nonatomic) float scrollSpeed;
@property(nonatomic) NSTimeInterval pauseInterval;
@property(nonatomic) int bufferSpaceBetweenLabels;
// normal UILabel properties
@property(nonatomic,retain) UIColor *textColor;
@property(nonatomic, retain) UIFont *font;

- (void) readjustLabels;
- (void) setText: (NSString *) text;
- (NSString *) text;
- (void) scroll;






/** 使用方法：
    AutoScrollLabel *autoScrollLabel = [[AutoScrollLabel alloc]initWithFrame:CGRectMake(0, 44, 100, 40)];
    autoScrollLabel.text = @"Hi Mom!  How are you?  I really ought to write more often.";
    autoScrollLabel.center = self.view.center;
    autoScrollLabel.textColor = [UIColor blackColor];
    autoScrollLabel.backgroundColor = [UIColor yellowColor];
    [self.view addSubview:autoScrollLabel];
*/




@end
