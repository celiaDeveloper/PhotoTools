//
//  XDWaterFallView.m
//  PhotoTools
//
//  Created by Celia on 2017/7/27.
//  Copyright © 2017年 skyApple. All rights reserved.
//

#import "XDWaterFallView.h"
#import "XDWaterFallLayout.h"
#import "XDWaterFallCell.h"
#import "XDWaterFallModel.h"

@interface XDWaterFallView () <XDWaterFallLayoutDelegate, UICollectionViewDataSource>

@property (nonatomic, strong) UICollectionView *collectionView;

@end

@implementation XDWaterFallView

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        [self createInterface];
    }
    return self;
}

- (void)createInterface {
    [self addSubview:self.collectionView];
}

- (UICollectionView *)collectionView {
    if (!_collectionView) {
        
        XDWaterFallLayout *layout = [[XDWaterFallLayout alloc] init];
        layout.delegate = self;
        
        _collectionView = [[UICollectionView alloc] initWithFrame:self.bounds collectionViewLayout:layout];
        _collectionView.backgroundColor = [UIColor whiteColor];
        _collectionView.dataSource = self;
        [_collectionView registerClass:[XDWaterFallCell class] forCellWithReuseIdentifier:@"XDWaterFallCell"];
    }
    return _collectionView;
}

- (void)setDataArray:(NSArray *)dataArray {
    _dataArray = dataArray;
    [self.collectionView reloadData];
}

#pragma mark - collectionView 代理
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return self.dataArray.count;
}

- (__kindof UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    
    XDWaterFallCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"XDWaterFallCell" forIndexPath:indexPath];
    
    cell.model = self.dataArray[indexPath.item];
    
    return cell;
}

#pragma mark - layout 代理
// 返回index位置下的item的高度
- (CGFloat)waterFallLayout:(XDWaterFallLayout *)waterFallLayout heightForItemAtIndex:(NSUInteger)index width:(CGFloat)width {
    XDWaterFallModel *model = self.dataArray[index];
    CGFloat mw = [model.w floatValue];
    CGFloat mh = [model.h floatValue];
    return mh * width / mw;
}

// 返回瀑布流显示的列数
- (NSUInteger)columnCountOfWaterFallLayout:(XDWaterFallLayout *)waterFallLayout {
    return 2;
}

//// 返回行间距
//- (CGFloat)rowMarginOfWaterFallLayout:(XDWaterFallLayout *)waterFallLayout {
//    
//}
//// 返回列间距
//- (CGFloat)columnMarginOfWaterFallLayout:(XDWaterFallLayout *)waterFallLayout {
//    
//}
//// 返回边缘间距
//- (UIEdgeInsets)edgeInsetsOfWaterFallLayout:(XDWaterFallLayout *)waterFallLayout {
//    
//}

@end
