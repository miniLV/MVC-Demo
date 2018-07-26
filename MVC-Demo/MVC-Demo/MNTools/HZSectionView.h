//
//  HZSectionView.h
//  HCCF
//
//  Created by Lyh on 2018/1/22.
//  Copyright © 2018年 xmhccf. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface HZSectionView : UIView

///最常见的 tableView sectionHeaderView - 不带底部细线
+ (instancetype)sectionViewTypeNormal:(NSString *)title;

///最常见的 tableView sectionHeaderView样式，不在tableView中的时候使用 - 带底部细线
+ (instancetype)sectionViewTypeBottomLine:(NSString *)title;

//宽度4，高度15的旧版section
+ (instancetype)sectionNormalViewWithTitle:(NSString *)title
                              leftImageStr:(NSString *)leftImageStr
                              isBottomLine:(BOOL)isBottomLine;

+ (instancetype)sectionFullViewWithTitle:(NSString *)title
                            leftImageStr:(NSString *)leftImageStr
                          leftImageWidth:(CGFloat)leftImageWidth
                         leftImageHeight:(CGFloat)leftImageHeight
                            isBottomLine:(BOOL)isBottomLine;

+ (instancetype)mn_sectionFullViewWithHeight:(CGFloat)height
                                       Title:(NSString *)title
                                leftImageStr:(NSString *)leftImageStr
                         leftImageLeftMargin:(CGFloat)leftImageLeftMargin
                              leftImageWidth:(CGFloat)leftImageWidth
                             leftImageHeight:(CGFloat)leftImageHeight
                             titleLeftMargin:(CGFloat)titleLeftMargin
                                   titleFont:(UIFont *)titleFont
                                  titleColor:(UIColor *)titleColor
                               rightLabelStr:(NSString *)rightLabelStr
                                   rightFont:(UIFont *)rightFont
                                  rightColor:(UIColor *)rightColor
                                   rightUnit:(NSString *)rightUnit
                                    unitFont:(UIFont *)unitFont
                                  unitColor:(UIColor *)unitColor
                                isBottomLine:(BOOL)isBottomLine;

@end
