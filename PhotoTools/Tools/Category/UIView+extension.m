//
//  UIView+extension.m
//  NBWeiBo
//
//  Created by apple on 15/6/13.
//  Copyright (c) 2015年 itcast. All rights reserved.
//

#import "UIView+extension.h"

@implementation UIView (extension)


-(void)setX:(CGFloat)x{
    CGRect frame = self.frame;
    frame.origin.x = x;
    self.frame = frame;
}


-(CGFloat)x{
    return self.frame.origin.x;
}


-(void)setY:(CGFloat)y{
    CGRect frame = self.frame;
    frame.origin.y = y;
    self.frame = frame;
}


-(CGFloat)y{
    return self.frame.origin.y;
}

-(void)setWidth:(CGFloat)width{
    CGRect frame = self.frame;
    frame.size.width = width;
    self.frame = frame;
}

-(CGFloat)width{
    return self.frame.size.width;
}

-(void)setHeight:(CGFloat)height{
    CGRect frame = self.frame;
    frame.size.height = height;
    self.frame = frame;
}


-(CGFloat)height{
    return self.frame.size.height;
}


-(void)setSize:(CGSize)size{
    CGRect frame =  self.frame;
    frame.size = size;
    self.frame = frame;
}

-(CGSize)size{
    return self.frame.size;
}


-(CGFloat)centerX{
    return self.center.x;
}

-(void)setCenterX:(CGFloat)centerX{
    CGPoint center = self.center;
    center.x = centerX;
    self.center = center;
}

-(CGFloat)centerY{
    return self.center.y;
}

-(void)setCenterY:(CGFloat)centerY{
    CGPoint center = self.center;
    center.y = centerY;
    self.center = center;
}

- (CGFloat)bottom {
    return self.frame.origin.y + self.frame.size.height;
}

- (void)setBottom:(CGFloat)bottom {
    CGRect frame = self.frame;
    frame.origin.y = bottom - frame.size.height;
    self.frame = frame;
}

- (CGFloat)right {
    return self.frame.origin.x + self.frame.size.width;
}

- (void)setRight:(CGFloat)right {
    CGRect frame = self.frame;
    frame.origin.x = right - frame.size.width;
    self.frame = frame;
}


-(void)setLayerUIBorderColor:(UIColor *)color BorderWidth:(CGFloat)width cornerRadius:(CGFloat)number
{
    self.layer.borderColor = color.CGColor;
    self.layer.borderWidth = width;
    self.layer.cornerRadius = number;
    self.layer.masksToBounds = YES;
}

+(instancetype)initViewBackColor:(UIColor *)color
{
    UIView *view = [[UIView alloc]init];
    view.backgroundColor = color;
    return view;
}

+(instancetype)initLineBackColor:(UIColor *)color Width:(CGFloat)width Height:(CGFloat)height maxY:(CGFloat)originY
{
    UIView *view = [[UIView alloc]initWithFrame:CGRectMake(0, originY, width, height)];
    view.backgroundColor = color;
    return view;
}

-(void)addTarget:(id)target action:(SEL)action
{
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc]initWithTarget:target action:action];
    self.userInteractionEnabled = YES;
    [self addGestureRecognizer:tap];
}

- (UIViewController *)belongViewController
{
    for (UIView *next = [self superview]; next; next = next.superview) {
        UIResponder* nextResponder = [next nextResponder];
        if ([nextResponder isKindOfClass:[UIViewController class]]) {
            return (UIViewController *)nextResponder;
        }
    }
    return nil;
}



@end
