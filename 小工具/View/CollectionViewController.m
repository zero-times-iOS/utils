//
//  CollectionViewController.m
//  小工具
//
//  Created by 叶长生 on 2018/12/18.
//  Copyright © 2018 大炮. All rights reserved.
//

#import "CollectionViewController.h"
#import "Header.h"
#import "CollectionViewCell.h"
#import "CollectionViewCellTextField.h"

@interface CoModel : NSObject
@property (nonatomic, assign) BOOL isSelected;
@end
@implementation CoModel

@end

@interface CollectionViewController ()<HeaderDelegate,UICollectionViewDelegateFlowLayout,CollectionViewCellDelegate>
@property (nonatomic, strong) NSMutableArray<CoModel *> * firstDatas;
@end

@implementation CollectionViewController
{
    Boolean _firstStatus;
    Boolean _secondStatus;
    Boolean _thridStatus;
    
    CollectionViewCellTextField * _textFiledCell;
    
    NSIndexPath * _lastSelectedIndexPath;
}
static NSString * const reuseIdentifier = @"Cell";
static NSString * const reuseHeaderIdentifier = @"Header";
static NSString * const reuseTextFiledIdentifier = @"TextField";

- (void)viewDidLoad {
    [super viewDidLoad];
    
    _firstDatas = [NSMutableArray array];
    for (int i = 0; i < 20; i++) {
    
        CoModel * m = [CoModel new];
        m.isSelected = false;
        [_firstDatas addObject:m];
    }
    // Uncomment the following line to preserve selection between presentations
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Register cell classes
    // Do any additional setup after loading the view.
}

#pragma mark <UICollectionViewDataSource>

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
#warning Incomplete implementation, return the number of sections
    return 2;
}


- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
#warning Incomplete implementation, return the number of items
    if (section == 0) {
        if (!_firstStatus) {
            return 3;
        }
        return _firstDatas.count;
    } else if (section == 1) {
        return 1;
    }
    return 0;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    
    if ([indexPath section] == 1) {
        if (!_textFiledCell) {
            _textFiledCell = [collectionView dequeueReusableCellWithReuseIdentifier:reuseTextFiledIdentifier forIndexPath:indexPath];
        }
        
        NSLog(@": -- > %@",[_textFiledCell lowToHigh]);
        
        return _textFiledCell;
    }
    else {
        CollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:reuseIdentifier forIndexPath:indexPath];
        
        cell.indexPath = indexPath;
        cell.isSelected = ((CoModel *)_firstDatas[indexPath.row]).isSelected;
        cell.title = [[NSString alloc] initWithFormat:@"%ld",(long)indexPath.row];
        cell.delegate = self;
        // Configure the cell
        
        return cell;
    }
    
}

#pragma mark <UICollectionViewDelegate>

- (UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath {
    
    Header * headerView = [collectionView dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:reuseHeaderIdentifier forIndexPath:indexPath];
    headerView.indexPath = indexPath;
    headerView.delegate = self;
    return headerView;
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    
    if ([indexPath section] == 1) {
        return;
    }
    
    [collectionView deselectItemAtIndexPath:indexPath animated:true];
    
    /// 不刷新整组cell，只刷新本次选中的cell与上次选中的cell,保证cell与数据源一致
    
    _firstDatas[indexPath.row].isSelected = true;// 只要选中的，都设为true

    if (_lastSelectedIndexPath == NULL) {// 最后一次选中 为 空
        _lastSelectedIndexPath = indexPath;
        [collectionView reloadItemsAtIndexPaths:@[_lastSelectedIndexPath]];
    }
    else {
        _firstDatas[_lastSelectedIndexPath.row].isSelected = false;// 设置上次选中model 为false
        
        /*
         注： 刷新不在界面的cell，会异常
         */
        
        if (_firstStatus) { // 如果是展开状态 ，所有cell都可以刷新
            [collectionView reloadItemsAtIndexPaths:@[_lastSelectedIndexPath,indexPath]];
        }
        else { // 如果是收缩状态，只有展示在界面上的cell可以刷新，不在界面的不需要刷新，改变数据源即可
           
            if (_lastSelectedIndexPath.row <= 2 && indexPath.row <= 2) {
                [collectionView reloadItemsAtIndexPaths:@[_lastSelectedIndexPath,indexPath]];
            }
            else if (_lastSelectedIndexPath.row <= 2) {
                [collectionView reloadItemsAtIndexPaths:@[_lastSelectedIndexPath]];
            } else if (indexPath.row <= 2) {
                [collectionView reloadItemsAtIndexPaths:@[indexPath]];
            }
        }
        
        _lastSelectedIndexPath = indexPath;
    }
}

#pragma mark <HeaderDelegate>

- (void)click:(NSIndexPath *)indexPath {
    
    NSLog(@"click %@", indexPath);
    if ([indexPath section] == 0) {
        _firstStatus = !_firstStatus;
    } else if ([indexPath section] == 1) {
        _secondStatus = !_secondStatus;
    } else if ([indexPath section] == 2) {
        _thridStatus = !_thridStatus;
    }
    
    [self.collectionView reloadSections:[NSIndexSet indexSetWithIndex:indexPath.section]];
}
#pragma mark <CollectionViewCellDelegate>

- (void)clickAt:(NSIndexPath *)indexPath {
    
    
}

#pragma mark <UICollectionViewDelegateFlowLayout>

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath {
    
    if ([indexPath section] == 0) {
        return CGSizeMake(100, 50);
    }
    else if ([indexPath section] == 1) {
        return CGSizeMake(self.view.frame.size.width, 50);
    }
    
    return CGSizeMake(50, 30);
}

@end
