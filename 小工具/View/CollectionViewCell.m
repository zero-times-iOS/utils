//
//  CollectionViewCell.m
//  小工具
//
//  Created by 叶长生 on 2018/12/18.
//  Copyright © 2018 大炮. All rights reserved.
//

#import "CollectionViewCell.h"

@implementation CollectionViewCell
{
    __weak IBOutlet UIButton *displayTitle;
}

- (void)setTitle:(NSString *)title {
    _title = title;
    [displayTitle setTitle:_title forState:(UIControlStateNormal)];
}
- (IBAction)click:(UIButton *)sender {
    
    if (_delegate) {
        [_delegate clickAt:_indexPath];
    }
}
- (void)setIsSelected:(BOOL)isSelected {
    _isSelected = isSelected;
    [displayTitle setSelected:_isSelected];
}

@end
