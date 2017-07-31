//
//  XDNineGridCell.m
//  PhotoTools
//
//  Created by Celia on 2017/7/26.
//  Copyright © 2017年 skyApple. All rights reserved.
//

#import "XDNineGridCell.h"

@implementation XDNineGridCell {
    UIImageView *photoView;
}

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        [self createInterface];
    }
    return self;
}

- (void)createInterface {
    photoView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, self.frame.size.width, self.frame.size.height)];
    photoView.backgroundColor = [UIColor groupTableViewBackgroundColor];
    [self.contentView addSubview:photoView];
}

- (void)setModel:(XDNineGridModel *)model {
    _model = model;
    [photoView sd_setImageWithURL:[NSURL URLWithString:model.photoURL] placeholderImage:[UIImage imageNamed:@"photoBack"]];
}

@end
