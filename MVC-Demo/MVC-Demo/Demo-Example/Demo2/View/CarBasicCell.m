//
//  CarBasicCell.m
//  HCCF
//
//  Created by Lyh on 2018/4/12.
//  Copyright © 2018年 xmhccf. All rights reserved.
//

#import "CarBasicCell.h"

@implementation CarBasicCell

- (void)setupControls{
    [super setupControls];
    
    self.titleLabel.font = HZ_15FontSize;
    self.titleLabel.textColor = HZ_777777Color;
    
    self.rightLabel.font = HZ_15FontSize;
    
    //leftMargin = 120
    CGFloat leftMargin = 120;
    [self.textField mas_updateConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(leftMargin);
    }];
    [self.contentLabel mas_updateConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(leftMargin);
    }];
    [self.IDCardTextField mas_updateConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(leftMargin);
    }];
    
    self.IDCardTextField.font = HZ_15FontSize;
    self.textField.font = HZ_15FontSize;
}


@end
