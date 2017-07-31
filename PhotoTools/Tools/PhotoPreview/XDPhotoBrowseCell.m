//
//  XDPhotoBrowseCell.m
//  PhotoTools
//
//  Created by Celia on 2017/7/26.
//  Copyright © 2017年 skyApple. All rights reserved.
//

#import "XDPhotoBrowseCell.h"
#import <SDWebImage/UIImageView+WebCache.h>
#import "UIView+extension.h"

@implementation XDPhotoBrowseCell {
    UIImageView *photoView;
}

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor clearColor];
        [self createInterface];
    }
    return self;
}

- (void)createInterface {
    photoView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, self.frame.size.width, self.frame.size.height)];
    photoView.contentMode = UIViewContentModeScaleAspectFit;
    photoView.userInteractionEnabled = YES;
    
    //单击
    UITapGestureRecognizer *singleTap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(photoSingleTap)];
    singleTap.numberOfTapsRequired = 1;
    [photoView addGestureRecognizer:singleTap];
    
    //捏合
    UIPinchGestureRecognizer *pinch = [[UIPinchGestureRecognizer alloc] initWithTarget:self action:@selector(pinchAction:)];
    [photoView addGestureRecognizer:pinch];
    
    
    [self.contentView addSubview:photoView];
}

- (void)setModel:(XDNineGridModel *)model {
    _model = model;
    //让transform还原
    photoView.transform = CGAffineTransformIdentity;
    [photoView sd_setImageWithURL:[NSURL URLWithString:model.photoURL] placeholderImage:[UIImage imageNamed:@"photoBack"]];
}

- (void)photoSingleTap {
    NSLog(@"单击");
    [[self belongViewController] dismissViewControllerAnimated:NO completion:nil];
}

- (void)pinchAction:(UIPinchGestureRecognizer *)pinchGes {
    //缩放的比例是一个"累加"过程
    NSLog(@"%s----%f",__func__,pinchGes.scale);
    
    //放大图片后， 再次缩放的时候，马上回到原先的大小
//    photoView.transform = CGAffineTransformMakeScale(pinchGes.scale, pinchGes.scale);
    
    photoView.transform = CGAffineTransformScale(photoView.transform, pinchGes.scale, pinchGes.scale);
    
    // 让比例还原，不要累加
    // 解决办法，重新设置scale
    pinchGes.scale = 1;
    
}

@end
