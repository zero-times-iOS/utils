//
//  Header.m
//  小工具
//
//  Created by 叶长生 on 2018/12/18.
//  Copyright © 2018 大炮. All rights reserved.
//

#import "Header.h"

@implementation Header
{
    __weak IBOutlet UIButton *button;

}
- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (IBAction)click:(UIButton *)sender {
    
    if (_delegate) {
        [_delegate click:_indexPath];
    }
}


@end
