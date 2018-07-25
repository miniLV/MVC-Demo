//
//  Demo1Label.h
//  MVC-Demo
//
//  Created by 梁宇航 on 2018/7/25.
//  Copyright © 2018年 xmhccf. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface Demo1Label : MNLabel

///投保人、被保人之类的标题label（fontSize13，color - 777777）
+ (instancetype) leftLabelTitle:(NSString *)title;

///首页内容Label（fontSize13，color - 39393D）
+ (instancetype) contentLabel;

///详情页headerView title（fontSize15，color - 1D1D26）
+ (instancetype) detailViewTitleLabel;
+ (instancetype) detailViewTitleLabel:(NSString *)title;

@end
