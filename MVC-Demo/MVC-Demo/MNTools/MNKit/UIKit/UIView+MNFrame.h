//
//  UIView+MNFrame.h
//  MNKitDemo
//
//  Created by 梁宇航 on 2018/6/12.
//  Copyright © 2018年 梁宇航. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (MNFrame)
#pragma mark - Frame Origin
/// frame 原点 x 值
@property (nonatomic, assign) CGFloat mn_x;
/// frame 原点 y 值
@property (nonatomic, assign) CGFloat mn_y;

#pragma mark - Frame Size
/// frame 尺寸 width
@property (nonatomic, assign) CGFloat mn_width;
/// frame 尺寸 height
@property (nonatomic, assign) CGFloat mn_height;

@property (nonatomic, assign) CGFloat mn_centerX;
@property (nonatomic, assign) CGFloat mn_centerY;

#pragma mark - Frame
/// 视图尺寸
@property (nonatomic, assign) CGSize  mn_viewSize;
/// 视图原点
@property (nonatomic, assign) CGPoint mn_viewOrigin;

///获取当前控件的最大X值
@property (nonatomic, assign, readonly) CGFloat mn_maxX;
///获取当前控件的最大Y值
@property (nonatomic, assign, readonly) CGFloat mn_maxY;

@end
