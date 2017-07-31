//
//  XDNineGridView.m
//  PhotoTools
//
//  Created by Celia on 2017/7/26.
//  Copyright © 2017年 skyApple. All rights reserved.
//

#import "XDNineGridView.h"
#import "XDNineGridCell.h"

@interface XDNineGridView () <UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout>

@property (nonatomic, strong) UICollectionView *collectionView;

@end

@implementation XDNineGridView

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor whiteColor];
        [self createInterface];
        
    }
    return self;
}

- (void)createInterface {
    [self addSubview:self.collectionView];
}

- (UICollectionView *)collectionView {
    if (!_collectionView) {
        UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc] init];
        layout.minimumLineSpacing = 5;
        layout.minimumInteritemSpacing = 5;
        
        _collectionView = [[UICollectionView alloc] initWithFrame:self.bounds collectionViewLayout:layout];
        _collectionView.backgroundColor = [UIColor clearColor];
        _collectionView.dataSource = self;
        _collectionView.delegate = self;
        
        [_collectionView registerClass:[XDNineGridCell class] forCellWithReuseIdentifier:@"NineGridCell"];
    }
    
    return _collectionView;
}

#pragma mark - collectionView 代理
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return self.dataArray.count;
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath {
    CGFloat width = (self.frame.size.width - 5*2) / 3;
    return CGSizeMake(width, width);
}

- (__kindof UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    
    XDNineGridCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"NineGridCell" forIndexPath:indexPath];
    cell.model = self.dataArray[indexPath.row];
    return cell;;
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    if ([self.delegate respondsToSelector:@selector(selectPhotoIndex:)]) {
        [self.delegate selectPhotoIndex:indexPath.row];
    }
}

#pragma mark - 数据
- (void)setDataArray:(NSArray *)dataArray {
    _dataArray = dataArray;
    [self.collectionView reloadData];
}


@end
