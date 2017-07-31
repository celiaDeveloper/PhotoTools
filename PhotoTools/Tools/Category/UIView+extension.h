//
//  UIView+extension.h
//  NBWeiBo
//
//  Created by apple on 15/6/13.
//  Copyright (c) 2015年 itcast. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (extension)

@property (nonatomic, assign) CGFloat x;
@property (nonatomic, assign) CGFloat y;
@property (nonatomic, assign) CGFloat width;
@property (nonatomic, assign) CGFloat height;
@property (nonatomic, assign) CGSize size;
@property (nonatomic, assign) CGFloat centerX;
@property (nonatomic, assign) CGFloat centerY;
@property (nonatomic, assign) CGFloat bottom;
@property (nonatomic, assign) CGFloat right;


/**
 创建view

 @param color view颜色
 @return view
 */
+(instancetype)initViewBackColor:(UIColor *)color;


/**
 创建line

 @param color 颜色
 @param width 宽度
 @param height 高度
 @param originY Y值
 @return view
 */
+(instancetype)initLineBackColor:(UIColor *)color Width:(CGFloat)width Height:(CGFloat)height maxY:(CGFloat)originY;


/**
 边框设置

 @param color 边框颜色
 @param width 边框宽度
 @param number 边框圆角
 */
-(void)setLayerUIBorderColor:(UIColor *)color BorderWidth:(CGFloat)width cornerRadius:(CGFloat)number;


/**
 添加点击手势

 @param target -
 @param action -
 */
-(void)addTarget:(id)target action:(SEL)action;


/**
 获取view所属控制器
 
 @return 控制器
 */
- (UIViewController *)belongViewController;



@end
