
//
//  LFLabel.h
//  HCCF
//
//  Created by Lyh on 2018/1/23.
//  Copyright © 2018年 xmhccf. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface MNLabel : UILabel

///快速创建 - 只有字体大小与颜色
+(instancetype)labelWithFont:(UIFont *)font
                       color:(UIColor *)color;

/**
 快速创建 - 只有字体大小与颜色与父试图的 label

 @param font 字体大小
 @param color 字体颜色
 @param parentView 父试图
 @return label
 */
+(instancetype)mn_labelWithFont:(UIFont *)font
                          color:(UIColor *)color
                     parentView:(UIView *)parentView;

///快速创建 - 有title && 字体大小与颜色（最常见）
+(instancetype)labelWithTitle:(NSString *)title
                         font:(UIFont *)font
                        color:(UIColor *)color;


/**
 快速创建 - 有title && 字体大小与颜色的label

 @param title 内容文字
 @param font 字体大小
 @param color 字体颜色
 @param parentView 父试图
 @return label
 */
+(instancetype)mn_labelWithTitle:(NSString *)title
                            font:(UIFont *)font
                           color:(UIColor *)color
                      parentView:(UIView *)parentView;


///快速创建 - 有title && 字体大小与颜色 && 行间距的label
+(instancetype)labelWithTitle:(NSString *)title
                         font:(UIFont *)font
                        color:(UIColor *)color
                  lineSpacing:(CGFloat)lineSpacing;

/**
 快速创建 - 有title && 字体大小与颜色 && 行间距的label
 
 @param title 内容文字
 @param font 字体大小
 @param color 字体颜色
 @param lineSpacing 行间距
 @param parentView 父试图
 @return label
 */
+(instancetype)mn_labelWithTitle:(NSString *)title
                            font:(UIFont *)font
                           color:(UIColor *)color
                     lineSpacing:(CGFloat)lineSpacing
                      parentView:(UIView *)parentView;

/**
 快速计算 - 这个数组里面所有label + 行间距的高度

 @param contentLabels label数组列表
 @param fontSize 要计算的label字体大小(整个数组的label字体大小必须一致)
 @param width label宽度
 @param lineSpacing 行间距
 @return 计算得到的高度
 */
+ (CGFloat)calLabelsHeight:(NSArray *)contentLabels
        heightWithFontSize:(UIFont *)fontSize
                     width:(CGFloat)width
               lineSpacing:(CGFloat)lineSpacing;


/**
 快速计算 - 这个数组里面所有label + 间距的高度 + 段落间距
 
 @param contentLabels label数组列表
 @param fontSize 要计算的label字体大小(整个数组的label字体大小必须一致)
 @param width label宽度
 @param lineSpacing 行间距
 @param paragraphSpacing 段落间距
 @return 计算得到的高度
 */
+ (CGFloat)calLabelsHeight:(NSArray *)contentLabels
                  fontSize:(UIFont *)fontSize
                     width:(CGFloat)width
               lineSpacing:(CGFloat)lineSpacing
          paragraphSpacing:(CGFloat)paragraphSpacing;

@end


