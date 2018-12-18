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

@interface CollectionViewController ()<HeaderDelegate>

@end

@implementation CollectionViewController
{
    Boolean _firstStatus;
    Boolean _secondStatus;
    Boolean _thridStatus;

}
static NSString * const reuseIdentifier = @"Cell";
static NSString * const reuseHeaderIdentifier = @"Header";

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Uncomment the following line to preserve selection between presentations
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Register cell classes
    // Do any additional setup after loading the view.
}

#pragma mark <UICollectionViewDataSource>

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
#warning Incomplete implementation, return the number of sections
    return 3;
}


- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
#warning Incomplete implementation, return the number of items
    if (section == 0) {
        if (_firstStatus) {
            return 3;
        }
        return 10;
    } else if (section == 1) {
        if (_secondStatus) {
            return 4;
        }
        return 10;
    } else if (section == 2) {
        if (_thridStatus) {
            return 5;
        }
        return 10;
    }
    return 0;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    CollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:reuseIdentifier forIndexPath:indexPath];
    
    cell.title = [[NSString alloc] initWithFormat:@"%ld",(long)indexPath.row];
    
    // Configure the cell
    
    return cell;
}

#pragma mark <UICollectionViewDelegate>

- (UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath {
    
    Header * headerView = [collectionView dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:reuseHeaderIdentifier forIndexPath:indexPath];
    headerView.indexPath = indexPath;
    headerView.delegate = self;
    return headerView;
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

@end
