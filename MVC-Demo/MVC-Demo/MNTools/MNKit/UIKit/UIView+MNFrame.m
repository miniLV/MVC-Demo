//
//  UIView+MNFrame.m
//  MNKitDemo
//
//  Created by 梁宇航 on 2018/6/12.
//  Copyright © 2018年 梁宇航. All rights reserved.
//

#import "UIView+MNFrame.h"

@implementation UIView (MNFrame)

- (CGFloat)mn_x{
    return self.frame.origin.x;
}

- (void)setMn_x:(CGFloat)mn_x{
    
    CGRect frame = self.frame;
    frame.origin.x = mn_x;
    self.frame = frame;
}

- (CGFloat)mn_y{
    return self.frame.origin.y;
}

- (void)setMn_y:(CGFloat)mn_y{
    
    CGRect frame = self.frame;
    frame.origin.y = mn_y;
    self.frame = frame;
}

- (CGFloat)mn_centerX{
    return self.center.x;
}

- (CGFloat)mn_centerY{
    return self.center.y;
}

- (void)setMn_centerX:(CGFloat)mn_centerX{
    CGPoint centerPoint = self.center;
    centerPoint.x = mn_centerX;
    self.center = centerPoint;
}

- (void)setMn_centerY:(CGFloat)mn_centerY{
    CGPoint centerPoint = self.center;
    centerPoint.y = mn_centerY;
    self.center = centerPoint;
}

- (CGFloat)mn_width{
    return self.frame.size.width;
}

- (void)setMn_width:(CGFloat)mn_width{
    CGRect frame = self.frame;
    frame.size.width = mn_width;
    self.frame = frame;
}

- (CGFloat)mn_height{
    return self.frame.size.height;
}

- (void)setMn_height:(CGFloat)mn_height{
    CGRect frame = self.frame;
    frame.size.height = mn_height;
    self.frame = frame;
}

- (CGSize)mn_viewSize{
    return self.frame.size;
}

- (void)setMn_viewSize:(CGSize)mn_viewSize{
    CGRect frame = self.frame;
    frame.size = mn_viewSize;
    self.frame = frame;
}

- (void)setMn_viewOrigin:(CGPoint)mn_viewOrigin{
    CGRect frame = self.frame;
    frame.origin = mn_viewOrigin;
    self.frame = frame;
}

- (CGPoint)mn_viewOrigin{
    return self.frame.origin;
}

- (CGFloat)mn_maxX{
    return self.mn_x + self.mn_width;
}
- (CGFloat)mn_maxY{
    return self.mn_y + self.mn_height;
}
@end
