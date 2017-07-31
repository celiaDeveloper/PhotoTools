//
//  XDWaterFallLayout.h
//  PhotoTools
//
//  Created by Celia on 2017/7/27.
//  Copyright © 2017年 skyApple. All rights reserved.
//

#import <UIKit/UIKit.h>

@class XDWaterFallLayout;
@protocol XDWaterFallLayoutDelegate <NSObject>

@required
// 返回index位置下的item的高度
- (CGFloat)waterFallLayout:(XDWaterFallLayout *)waterFallLayout heightForItemAtIndex:(NSUInteger)index width:(CGFloat)width;

@optional
// 返回瀑布流显示的列数
- (NSUInteger)columnCountOfWaterFallLayout:(XDWaterFallLayout *)waterFallLayout;
// 返回行间距
- (CGFloat)rowMarginOfWaterFallLayout:(XDWaterFallLayout *)waterFallLayout;
// 返回列间距
- (CGFloat)columnMarginOfWaterFallLayout:(XDWaterFallLayout *)waterFallLayout;
// 返回边缘间距
- (UIEdgeInsets)edgeInsetsOfWaterFallLayout:(XDWaterFallLayout *)waterFallLayout;

@end

@interface XDWaterFallLayout : UICollectionViewLayout

@property (nonatomic, weak) id <XDWaterFallLayoutDelegate>delegate;

@end
