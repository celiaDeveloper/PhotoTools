//
//  XDWaterFallCell.m
//  PhotoTools
//
//  Created by Celia on 2017/7/27.
//  Copyright © 2017年 skyApple. All rights reserved.
//

#import "XDWaterFallCell.h"
#import <SDWebImage/UIImageView+WebCache.h>

@implementation XDWaterFallCell {
    UIImageView *imageV;
    UILabel *bottomLabel;
}

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor blackColor];
        [self createInterface];
    }
    return self;
}

- (void)createInterface {
    
    imageV = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, self.contentView.frame.size.width, self.contentView.frame.size.height)];
    imageV.contentMode = UIViewContentModeScaleToFill;
    [self.contentView addSubview:imageV];
    
    bottomLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, imageV.frame.size.height - 30, imageV.frame.size.width, 30)];
    bottomLabel.textColor = [UIColor blackColor];
    bottomLabel.textAlignment = NSTextAlignmentCenter;
    [self.contentView addSubview:bottomLabel];
    
}

- (void)setModel:(XDWaterFallModel *)model {
    _model = model;
    
    [imageV sd_setImageWithURL:[NSURL URLWithString:model.img] placeholderImage:[UIImage imageNamed:@"photoBack"]];
    bottomLabel.text = [NSString stringWithFormat:@"%@", model.price];
}

- (void)layoutSubviews {
    [super layoutSubviews];
    imageV.frame = CGRectMake(0, 0, self.contentView.frame.size.width, self.contentView.frame.size.height);
    
    bottomLabel.frame = CGRectMake(0, imageV.frame.size.height - 30, imageV.frame.size.width, 30);
}

@end
