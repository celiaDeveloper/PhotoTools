//
//  XDPhotoBrowse.m
//  PhotoTools
//
//  Created by Celia on 2017/7/26.
//  Copyright © 2017年 skyApple. All rights reserved.
//

#import "XDPhotoBrowse.h"
#import "XDPhotoBrowseCell.h"

@interface XDPhotoBrowse () <UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout>

@property (nonatomic, strong) UICollectionView *browseView;
@property (nonatomic, strong) UILabel *topCount;

@end

@implementation XDPhotoBrowse

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor blackColor];
        [self createInterface];
    }
    return self;
}

- (void)createInterface {
    [self addSubview:self.browseView];
    [self addSubview:self.topCount];
}

- (UICollectionView *)browseView {
    if (!_browseView) {
        UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc] init];
        layout.scrollDirection = UICollectionViewScrollDirectionHorizontal;
        layout.minimumLineSpacing = 0;
        layout.minimumInteritemSpacing = 0;
        
        _browseView = [[UICollectionView alloc] initWithFrame:self.bounds collectionViewLayout:layout];
        _browseView.backgroundColor = [UIColor colorWithWhite:0.3 alpha:0.3];
        _browseView.dataSource = self;
        _browseView.delegate = self;
        _browseView.pagingEnabled = YES;
        _browseView.showsHorizontalScrollIndicator = NO;
        [_browseView registerClass:[XDPhotoBrowseCell class] forCellWithReuseIdentifier:@"XDPhotoBrowseCell"];
    }
    
    return _browseView;
}

- (UILabel *)topCount {
    if (!_topCount) {
        _topCount = [[UILabel alloc] initWithFrame:CGRectMake(0, 20, self.frame.size.width, 30)];
        _topCount.textColor = [UIColor whiteColor];
        _topCount.textAlignment = NSTextAlignmentCenter;
        _topCount.font = [UIFont systemFontOfSize:15.0];
    }
    return _topCount;
}

- (void)setDataArray:(NSArray *)dataArray {
    _dataArray = dataArray;
    [self.browseView reloadData];
}

- (void)setSelectedIndex:(NSInteger)selectedIndex {
    _selectedIndex = selectedIndex;
    NSIndexPath *path = [NSIndexPath indexPathForItem:selectedIndex inSection:0];
    [self.browseView scrollToItemAtIndexPath:path atScrollPosition:UICollectionViewScrollPositionNone animated:YES];
    self.topCount.text = [NSString stringWithFormat:@"%ld/%ld", selectedIndex+1, self.dataArray.count];
}

#pragma mark - TableView 代理
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return self.dataArray.count;
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath {
    
    return CGSizeMake(self.frame.size.width, self.frame.size.height);
}

- (__kindof UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    
    XDPhotoBrowseCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"XDPhotoBrowseCell" forIndexPath:indexPath];
    cell.model = self.dataArray[indexPath.row];
    return cell;
    
}


- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView {
    
    NSInteger row = (NSInteger)scrollView.contentOffset.x / (NSInteger)self.frame.size.width;
    self.topCount.text = [NSString stringWithFormat:@"%ld/%ld", row+1, self.dataArray.count];
    
}






@end
