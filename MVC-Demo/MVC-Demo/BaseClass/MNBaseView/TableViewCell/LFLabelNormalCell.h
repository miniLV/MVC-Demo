//
//  LFLabelNormalCell.h
//  HCCF
//
//  Created by 梁宇航 on 2017/11/24.
//  Copyright © 2017年 xmhccf. All rights reserved.
//

#import <UIKit/UIKit.h>

/**
 基类cell - 左边label，中间一个控件， 右边一个控件
 
 - 基本属性
 
 defaultLeftMargin = 120
 
 textField       - font 14
                 - textColor 39393D
 
 IDCardTextField - font 13
                 - textColor 383838
 
 titleLabel      - font 14
                 - textColor 777777
 
 contentLabel    - font 14
                 - textCoor 39393D
 
 rightLabel      - font 15
                 -textColor 494949 (rightMargin = 35)
 
 rightUnit (¥)   - font 16
                 -textColor FF4D4D (right = rightLabel.left)

 
 */

@protocol LFLabelNormalCellDelegate <NSObject>

@optional
- (void)mn_endEditTextField:(UITextField *_Nullable)sender;

@optional
- (void)mn_changeSwitchBtn:(UISwitch *_Nullable)sender;

@end

@interface LFLabelNormalCell : HZRootTableViewCell

///左边label
@property (nonatomic , weak)UILabel * _Nullable titleLabel;

///中间label - 黑色
@property (nonatomic , weak)UILabel * _Nullable contentLabel;

///right label
@property (nonatomic , weak)UILabel * _Nullable rightLabel;

///right unit label
@property (nonatomic , weak)UILabel * _Nullable rightUnitLabel;

///中间textField
@property (nonatomic , weak)UITextField * _Nullable textField;

///中间证件号textField - 弹出特殊键盘
@property (nonatomic , weak)UITextField * _Nullable IDCardTextField;

///右边按钮
@property (nonatomic , weak)UIButton * _Nullable rightBtn;

///右边图片
@property (nonatomic , weak)UIImageView * _Nullable rightIV;

///右侧switchBtn
@property (nonatomic , weak)UISwitch * _Nullable switchBtn;

@property (nonatomic, weak) id <LFLabelNormalCellDelegate> mnDelegate;

@end
