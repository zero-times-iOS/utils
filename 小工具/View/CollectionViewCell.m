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
    __weak IBOutlet UILabel *displayTitle;
}

- (void)setTitle:(NSString *)title {
    _title = title;
    displayTitle.text = _title;
}

@end
