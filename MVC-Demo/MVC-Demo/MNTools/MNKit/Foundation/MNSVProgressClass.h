//
//  MNSVProgressClass.h
//  HCCF
//
//  Created by 梁宇航 on 2017/12/22.
//  Copyright © 2017年 xmhccf. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "SVProgressHUD.h"

@interface MNSVProgressClass : NSObject

+ (void)mn_dismiss;

///只显示一个最简单的label(1.5s)
+ (void)showNormalTitle:(NSString *)titleStr;

//显示一个3S最简单的label
+ (void)show3SNormalTitle:(NSString *)titleStr;

//数据比较多的时候，显示5s在miss
+ (void)show5SNormalTitle:(NSString *)titleStr;





///网络请求很慢 - 很长时间的转圈圈(禁止用户交互) - 不会主动消失提示框
+ (void)showLongTimeStatus:(NSString *)string;

///网络请求很慢 - 很长时间的转圈圈(webView加载-设置是否允许用户交互) - 不会主动消失提示框
+ (void)showLongTimeStatus:(NSString *)string canTouch:(BOOL)canTouch;

///显示转圈圈状态(1.5s)
+ (void)showWithStatus:(NSString *)string;

//显示2s的转圈圈
+ (void)mn_show2sTimeStatus:(NSString *)string;

///10s的转圈圈
+ (void)mn_show10STimeStatus:(NSString *)string;


+ (void)mn_showSuccess:(NSString *)string;

///默认显示-正在加载中（可以交互）
+ (void)mn_normalShowLoading;

///是否key的值是否为nil，如果是，提示“tipStr”
+ (BOOL)isValueNilWithSVTips:(NSString *)tipStr key:(NSString *)key;

@end
