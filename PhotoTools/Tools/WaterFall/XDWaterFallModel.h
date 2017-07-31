//
//  XDWaterFallModel.h
//  PhotoTools
//
//  Created by Celia on 2017/7/27.
//  Copyright © 2017年 skyApple. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface XDWaterFallModel : NSObject

@property (nonatomic, strong) NSNumber *h; // 高度
@property (nonatomic, strong) NSNumber *w; // 宽度
@property (nonatomic, copy) NSString *img; // 图片urlString
@property (nonatomic, copy) NSString *price; // 价格

@end
