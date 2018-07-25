//
//  MNButton.h
//  HCCF
//
//  Created by Lyh on 2018/2/28.
//  Copyright © 2018年 xmhccf. All rights reserved.
//

#import <UIKit/UIKit.h>
//#import "UIButton+mnExt.h"
@interface MNButton : UIButton


///快速创建一个只有图片&&点击事件的button
+ (instancetype)buttonWithBackgroundImage:(UIImage *)backgroundImage
                               parentView:(UIView *)parentView
                               targetName:(SEL)targetName
                                 delegate:(id)delegate;

/**
 快速创建UIButton

 @param title 按钮title
 @param titleColor titleColor
 @param fontSize titleFont
 @param backgroundColor btnBackgroundColor
 @param parentView 父控件
 @param targetName 添加touchUpInSide方法的方法
 @param delegate 响应点击事件的控件
 @return button
 */
+ (instancetype)buttonWithTitle:(NSString *)title
                     titleColor:(UIColor *)titleColor
                       fontSize:(UIFont *)fontSize
                backgroundColor:(UIColor *)backgroundColor
                     parentView:(UIView *)parentView
                     targetName:(SEL)targetName
                       delegate:(id)delegate;


///清除按钮的选择状态
+ (void)mn_clearBtnsState:(NSArray *)btns;

///添加一个bottom按钮
+ (instancetype)mn_bottomBtnWithTitle:(NSString *)title
                           titleColor:(UIColor *)titleColor
                             fontSize:(UIFont *)fontSize
                      backgroundColor:(UIColor *)backgroundColor
                           parentView:(UIView *)parentView
                               height:(CGFloat)height
                           targetName:(SEL)targetName
                             delegate:(id)delegate;

@end
