//
//  LFSimpleRightCell.h
//  HCCF
//
//  Created by Lyh on 2018/1/30.
//  Copyright © 2018年 xmhccf. All rights reserved.
//

#import <UIKit/UIKit.h>

/**
 基类cell - 左边label，右边一个控件，中间没有控件
 */
@interface LFSimpleRightCell : HZRootTableViewCell

///左边label
@property (nonatomic , weak)UILabel * _Nullable titleLabel;

///右边label - 黑色
@property (nonatomic , weak)UILabel * _Nullable rightLabel;

///右边textField
@property (nonatomic , weak)UITextField * _Nullable rightTextField;

///右边特殊键盘 - 身份证键盘
@property (nonatomic , weak)UITextField * _Nullable rightIDCardTextField;


///右边图片
@property (nonatomic , weak)UIImageView * _Nullable rightIV;

@end
