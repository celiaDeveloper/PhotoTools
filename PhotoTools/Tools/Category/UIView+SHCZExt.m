

#import "UIView+SHCZExt.h"

@implementation UIView (SHCZExt)
-(CGFloat)x{
    return self.frame.origin.x;
}
-(void)setX:(CGFloat)x{
    CGRect frame=self.frame;
    frame.origin.x=x;
    self.frame=frame;
}



-(CGFloat)y{
    return self.frame.origin.y;
}
-(void)setY:(CGFloat)y{
    CGRect frame=self.frame;
    frame.origin.y=y;
    self.frame=frame;
}


-(CGFloat)w{
    return self.frame.size.width;
}
-(void)setW:(CGFloat)w{
    CGRect frame=self.frame;
    frame.size.width=w;
    self.frame=frame;
}



-(CGFloat)h{
    return self.frame.size.height;
}
-(void)setH:(CGFloat)h{
    CGRect frame=self.frame;
    frame.size.height=h;
    self.frame=frame;
}

- (CGFloat)bottom {
    return self.frame.origin.y + self.frame.size.height;
}

- (CGFloat)right {
    return self.frame.origin.x + self.frame.size.width;
}



-(CGFloat)ttx{
    return self.transform.tx;
}
-(void)setTtx:(CGFloat)ttx{
    CGAffineTransform  transform=self.transform;
    transform.tx=ttx;
    self.transform=transform;


}




-(CGFloat)tty{
    return self.transform.ty;
}
-(void)setTty:(CGFloat)tty{
    CGAffineTransform  transform=self.transform;
    transform.ty=tty;
    self.transform=transform;
    
    
}















@end
