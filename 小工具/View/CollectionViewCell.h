//
//  CollectionViewCell.h
//  小工具
//
//  Created by 叶长生 on 2018/12/18.
//  Copyright © 2018 大炮. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol CollectionViewCellDelegate <NSObject>

@optional
- (void)clickAt: (NSIndexPath *)indexPath;

@end

NS_ASSUME_NONNULL_BEGIN

@interface CollectionViewCell : UICollectionViewCell

@property (nonatomic, copy) NSString * title;
@property (nonatomic, assign) BOOL isSelected;
@property (nonatomic, copy) NSIndexPath * indexPath;
@property (nonatomic, weak) id<CollectionViewCellDelegate> delegate;

@end

NS_ASSUME_NONNULL_END
