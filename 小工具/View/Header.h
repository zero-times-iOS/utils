//
//  Header.h
//  小工具
//
//  Created by 叶长生 on 2018/12/18.
//  Copyright © 2018 大炮. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol HeaderDelegate <NSObject>
- (void)click: (NSIndexPath *)indexPath;
@end

NS_ASSUME_NONNULL_BEGIN

@interface Header : UICollectionReusableView

@property (nonatomic, weak) id<HeaderDelegate> delegate;
@property (nonatomic, assign) NSIndexPath * indexPath;

@end

NS_ASSUME_NONNULL_END
