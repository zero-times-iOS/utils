//
//  CollectionViewCellTextField.m
//  小工具
//
//  Created by 叶长生 on 2018/12/18.
//  Copyright © 2018 大炮. All rights reserved.
//

#import "CollectionViewCellTextField.h"

@implementation CollectionViewCellTextField
{
    
    __weak IBOutlet UITextField *lowTextField;
    __weak IBOutlet UITextField *highTextField;
    
}

- (NSString *)lowToHigh {
    
    return [NSString stringWithFormat:@"%@,%@",lowTextField.text,highTextField.text];
}
@end
