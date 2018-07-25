//
//  LFLabelNormalCell.m
//  HCCF
//
//  Created by 梁宇航 on 2017/11/24.
//  Copyright © 2017年 xmhccf. All rights reserved.
//

#import "LFLabelNormalCell.h"
#import "BXTextField.h"
@implementation LFLabelNormalCell

static CGFloat defaultLeftMargin = 120;
static CGFloat rightBtnWH = 16;

- (void)createControls{
    
    //1.titleLabel
    UILabel *titleLabel = [[UILabel alloc]init];
    [self.contentView addSubview:titleLabel];
    [titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.mas_equalTo(self);
        make.left.mas_equalTo(DefaultMargin);
    }];
    _titleLabel = titleLabel;
    
    //2.contentLabel
    UILabel *contentLabel = [[UILabel alloc]init];
    [self.contentView addSubview:contentLabel];
    [contentLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.mas_equalTo(self);
        make.left.mas_equalTo(defaultLeftMargin);
        make.right.mas_equalTo(-40);
        
    }];
    _contentLabel = contentLabel;
    
    //3.中间textField
    UITextField *textField = [[UITextField alloc]init];
    [self.contentView addSubview:textField];
    [textField mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.mas_equalTo(self);
        make.left.mas_equalTo(defaultLeftMargin);
        make.right.mas_equalTo(-10);
        //高度要设置吗
    }];
    textField.clearButtonMode = UITextFieldViewModeWhileEditing;
    _textField = textField;
    
    //3.1 - 特殊情况下，中间是身份证输入框
    BXTextField *bxTextField = [[BXTextField alloc]init];
    [self.contentView addSubview:bxTextField];
    [bxTextField mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.mas_equalTo(self);
        make.left.mas_equalTo(defaultLeftMargin);
        make.right.mas_equalTo(-10);
        //高度要设置吗
    }];
    bxTextField.clearButtonMode = UITextFieldViewModeWhileEditing;
    _IDCardTextField = bxTextField;
    
    //4.右侧按钮
    UIButton *rightBtn = [[UIButton alloc]init];
    [self.contentView addSubview:rightBtn];
    [rightBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.mas_equalTo(self);
        make.right.mas_equalTo(-DefaultMargin);
        make.width.height.mas_equalTo(rightBtnWH);
    }];
    _rightBtn = rightBtn;
    
    //5.右侧图片
    UIImageView *rightIV = [[UIImageView alloc]init];
    [self.contentView addSubview:rightIV];
    [rightIV mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.mas_equalTo(self);
        make.right.mas_equalTo(-DefaultMargin);
        make.width.height.mas_equalTo(rightBtnWH);
    }];
    _rightIV = rightIV;
    
    //6.右侧如果有switchBtn
    UISwitch *switchBtn = [[UISwitch alloc]init];
    [self.contentView addSubview:switchBtn];
    switchBtn.transform = CGAffineTransformMakeScale(0.8, 0.8);
    [switchBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.mas_equalTo(self);
        make.right.mas_equalTo(-DefaultMargin);
    }];
    switchBtn.hidden = YES;
    [switchBtn addTarget:self action:@selector(p_clickSwitchBtn:) forControlEvents:UIControlEventValueChanged];
    _switchBtn = switchBtn;
    
    //7.rightLabel
    MNLabel *rightLabel = [MNLabel labelWithFont:HZ_15FontSize
                                           color:HZ_494949Color];
    [self.contentView addSubview:rightLabel];
    [rightLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.mas_equalTo(-35);
        make.centerY.mas_equalTo(self.contentView);
    }];
    rightLabel.hidden = YES;
    _rightLabel = rightLabel;
    
    //8. rightUnitLabel
    UILabel *rightUnitLabel = [MNLabel mn_labelWithTitle:@"¥"
                                                font:HZ_16FontSize
                                               color:HZ_FF4D4DColor
                                          parentView:self.contentView];

    [rightUnitLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.mas_equalTo(rightLabel.mas_left).mas_equalTo(-2);
        make.centerY.mas_equalTo(self.contentView);
    }];
    rightUnitLabel.hidden = YES;
    _rightUnitLabel = rightUnitLabel;
}

- (void)setTextField{

    _textField.borderStyle = UITextBorderStyleNone;
    NSDictionary *attrDic = @{NSFontAttributeName:HZ_14FontSize,
                              NSForegroundColorAttributeName:HZ_C8C8C8Color,
                              };
    NSString *tempStr =_textField.placeholder;
    if (!tempStr) {
        tempStr = @"";
    }
    NSAttributedString *attrs = [[NSAttributedString alloc]initWithString:tempStr attributes:attrDic];
    
    _textField.attributedPlaceholder = attrs;
    
    //正常输入状态
    _textField.textColor = HZ_39393DColor;
    _textField.font = HZ_14FontSize;
    _textField.hidden = YES;
    
    [_textField addTarget:self action:@selector(p_endEditTextField:) forControlEvents:UIControlEventEditingDidEnd];

#pragma mark - 银行卡号特殊键盘
    _IDCardTextField.borderStyle = UITextBorderStyleNone;
    _IDCardTextField.attributedPlaceholder = attrs;
    _IDCardTextField.textColor = HZ_383838Color;
    _IDCardTextField.font = HZ_13FontSize;
    _IDCardTextField.hidden = YES;
    [_IDCardTextField addTarget:self action:@selector(p_endEditTextField:) forControlEvents:UIControlEventEditingDidEnd];
    
}

- (void)setupControls{
    
    _titleLabel.font = HZ_14FontSize;
    _titleLabel.textColor = HZ_777777Color;
    
    _contentLabel.font = HZ_14FontSize;
    _contentLabel.textColor = HZ_39393DColor;
    _contentLabel.hidden = YES;
    _contentLabel.numberOfLines = 0;
    
    //设置textField
    [self setTextField];
    
    _rightIV.hidden = YES;
    _rightBtn.hidden = YES;
    
}

- (void)p_clickSwitchBtn:(UISwitch *)sender{
 
    [_mnDelegate respondsToSelector:@selector(mn_changeSwitchBtn:)] ?
    [_mnDelegate mn_changeSwitchBtn:sender] : nil;
}

- (void)p_endEditTextField:(UITextField *)sender{
    
    [_mnDelegate respondsToSelector:@selector(mn_endEditTextField:)] ?
    [_mnDelegate mn_endEditTextField:sender] : nil;
}

@end
