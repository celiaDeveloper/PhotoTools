//
//  XDNineGridView.h
//  PhotoTools
//
//  Created by Celia on 2017/7/26.
//  Copyright © 2017年 skyApple. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol XDNineGridViewDelegate <NSObject>

- (void)selectPhotoIndex:(NSInteger)index;

@end

@interface XDNineGridView : UIView

@property (nonatomic, copy) NSArray *dataArray;

@property (nonatomic, assign) id <XDNineGridViewDelegate>delegate;

@end
