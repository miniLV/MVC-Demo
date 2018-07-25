//
//  LFSimpleRightCell.m
//  HCCF
//
//  Created by Lyh on 2018/1/30.
//  Copyright © 2018年 xmhccf. All rights reserved.
//

#import "LFSimpleRightCell.h"
#import "BXTextField.h"

@implementation LFSimpleRightCell

static CGFloat rightMargin = -35;
static CGFloat defaultLeftMargin = 140;



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
    UILabel *rightLabel = [[UILabel alloc]init];
    rightLabel.textAlignment = NSTextAlignmentRight;
    [self.contentView addSubview:rightLabel];
    [rightLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.bottom.mas_equalTo(0);
        make.left.mas_equalTo(defaultLeftMargin);
        make.right.mas_equalTo(rightMargin);
    }];
    _rightLabel = rightLabel;
    
    //3.右边textField
    UITextField *textField = [[UITextField alloc]init];
    textField.textAlignment = NSTextAlignmentRight;
    [self.contentView addSubview:textField];
    [textField mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.mas_equalTo(self);
        make.left.mas_equalTo(defaultLeftMargin);
        make.right.mas_equalTo(rightMargin);
    }];
    textField.clearButtonMode = UITextFieldViewModeWhileEditing;
    _rightTextField = textField;
    
    
    //3.1 - 特殊情况下，中间是身份证输入框
    BXTextField *bxTextField = [[BXTextField alloc]init];
    [self.contentView addSubview:bxTextField];
    [bxTextField mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.mas_equalTo(self);
        make.left.mas_equalTo(defaultLeftMargin - 20);
        make.right.mas_equalTo(rightMargin);
    }];
    bxTextField.textAlignment = NSTextAlignmentRight;
    bxTextField.clearButtonMode = UITextFieldViewModeWhileEditing;
    _rightIDCardTextField = bxTextField;
    
    
    //4.右侧图片
    UIImageView *rightIV = [[UIImageView alloc]init];
    rightIV.image = [UIImage imageNamed:@"arrow-y"];
    [self.contentView addSubview:rightIV];
    [rightIV mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.mas_equalTo(self);
        make.right.mas_equalTo(-DefaultMargin);
        make.width.mas_equalTo(16);
        make.height.mas_equalTo(16);
    }];
    _rightIV = rightIV;
    
}

- (void)setTextField{
    
    _rightTextField.borderStyle = UITextBorderStyleNone;
    NSDictionary *attrDic = @{NSFontAttributeName:HZ_14FontSize,
                              NSForegroundColorAttributeName:HZ_C8C8C8Color,
                              };
    NSString *tempStr =_rightTextField.placeholder;
    if (!tempStr) {
        tempStr = @"";
    }
    NSAttributedString *attrs = [[NSAttributedString alloc]initWithString:tempStr attributes:attrDic];
    
    _rightTextField.attributedPlaceholder = attrs;
    //正常输入状态
    _rightTextField.textColor = HZ_383838Color;
    _rightTextField.font = HZ_14FontSize;
    _rightTextField.hidden = YES;
    
    /**身份证输入- 特殊键盘*/
    _rightIDCardTextField.borderStyle = UITextBorderStyleNone;
    _rightIDCardTextField.attributedPlaceholder = attrs;
    //正常输入状态
    _rightIDCardTextField.textColor = HZ_383838Color;
    _rightIDCardTextField.font = HZ_14FontSize;
    _rightIDCardTextField.hidden = YES;
}

- (void)setupControls{
    
    _titleLabel.font = HZ_14FontSize;
    _titleLabel.textColor = HZ_777777Color;
    
    _rightLabel.font = HZ_14FontSize;
    _rightLabel.textColor = HZ_39393DColor;
    _rightLabel.hidden = YES;
    _rightLabel.numberOfLines = 0;
    
    //设置textField
    [self setTextField];
    
    _rightIV.hidden = YES;
    
}
@end
