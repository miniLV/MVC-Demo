//
//  MNView.h
//  HCCF
//
//  Created by Lyh on 2018/2/27.
//  Copyright © 2018年 xmhccf. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MNView : UIView


+ (instancetype)viewWithFrame:(CGRect)frame;
///快速设置uiview的背景色
+ (instancetype)viewWithBackgroudColor:(UIColor *)backgroudColor;


///快速创建-高度=10，top约束=0，背景色=F2F3F7的View
+ (instancetype)topViewDefaultWithParentView:(UIView *)parentView;

+ (instancetype)topViewF2F3F7ColorWithHeight:(CGFloat)height
                                  parentView:(UIView *)parentView;

/**
 快速创建约束-top=0的view

 @param backgroudColor 背景色
 @param height view的高度
 @param parentView 父控件
 @return view
 */
+ (instancetype)topViewWithBackgroudColor:(UIColor *)backgroudColor
                                   height:(CGFloat)height
                               parentView:(UIView *)parentView;


///快速创建-高度=10，top约束=0，背景色=F2F3F7的View
+ (instancetype)bottomDefaultWithParentView:(UIView *)parentView;
+ (instancetype)bottomViewF2F3F7ColorWithHeight:(CGFloat)height
                                     parentView:(UIView *)parentView;

/**
 快速创建约束-bottom=0的view

 @param backgroudColor 背景色
 @param height view的高度
 @param parentView 父控件
 @return view
 */
+ (instancetype)bottomViewWithBackgroudColor:(UIColor *)backgroudColor
                                      height:(CGFloat)height
                                  parentView:(UIView *)parentView;

//getViewH - 屏幕宽度
+ (CGFloat)mn_getViewHeightWithImageWidth:(CGFloat)imageWidth imageHeight:(CGFloat)imageHeight;

//控件宽度外部传入
+ (CGFloat)mn_getViewHeightWithImageWidth:(CGFloat)imageWidth imageHeight:(CGFloat)imageHeight viewWidth:(CGFloat)viewWidth;

@end
