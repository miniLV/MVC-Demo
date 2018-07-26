//
//  CarCheckCell.m
//  HCCF
//
//  Created by Lyh on 2018/4/13.
//  Copyright © 2018年 xmhccf. All rights reserved.
//

#import "CarCheckCell.h"

@implementation CarCheckCell{
    
    //商业险-保障期限
    UILabel *_timeLabel;
    //报价状态
    UILabel *_priceLabel;
}

- (void)createControls{
    [super createControls];
    
    UILabel *timeLabel = [MNLabel mn_labelWithFont:HZ_14FontSize
                                             color:HZ_494949Color
                                        parentView:self.contentView];
    [timeLabel mas_updateConstraints:^(MASConstraintMaker *make) {
        make.right.mas_equalTo(-DefaultMargin);
        make.centerY.mas_equalTo(self.contentView);
    }];
    timeLabel.hidden = YES;
    _timeLabel = timeLabel;
    
    UILabel *priceLabel = [MNLabel mn_labelWithFont:HZ_16FontSize
                                              color:HZ_FF4D4DColor
                                         parentView:self.contentView];
    [priceLabel mas_updateConstraints:^(MASConstraintMaker *make) {
        make.right.mas_equalTo(-DefaultMargin);
        make.centerY.mas_equalTo(self.contentView);
    }];
    priceLabel.hidden = YES;
    _priceLabel = priceLabel;
}

-(void)setupControls{
    [super setupControls];
    
    self.rightIV.image = MNImage(@"arrow-x");
    self.IDCardTextField.textAlignment = NSTextAlignmentRight;
    self.textField.textAlignment = NSTextAlignmentRight;
    
    [self.IDCardTextField mas_updateConstraints:^(MASConstraintMaker *make) {
        make.right.mas_equalTo(-35);
    }];
    [self.textField mas_updateConstraints:^(MASConstraintMaker *make) {
        make.right.mas_equalTo(-35);
    }];
}

- (void)setBasicModel:(MNCellModel *)basicModel{
    
    NSInteger tag = self.basicIndexPath.section * 100 + self.basicIndexPath.row;
    self.switchBtn.tag = tag;
    self.IDCardTextField.tag = tag;
    self.textField.tag = tag;
    
    self.titleLabel.text = basicModel.titleLabel;
    
    switch (basicModel.type) {
        case 0:
        {
            self.rightLabel.hidden = NO;
            self.rightLabel.text = basicModel.rightValue ? : @"test-content";
            break;
        }
        case 1:{
            _timeLabel.hidden = NO;
            _timeLabel.text = basicModel.rightValue ? : @"test-time";
            break;
        }
        case 2:{
            self.rightLabel.hidden = NO;
            self.rightIV.hidden = NO;
            self.rightLabel.text = basicModel.selectedValue ? : basicModel.placeholder;
            self.rightLabel.textColor = basicModel.selectedValue ? HZ_494949Color : HZ_C8C8C8Color;
            break;
        }
        case 6:{
            self.textField.hidden = NO;
            self.textField.text = basicModel.textFieldValue;
            self.textField.placeholder = basicModel.placeholder;
            break;
        }
        case 31:{
            self.IDCardTextField.hidden = NO;
            self.IDCardTextField.text = basicModel.textFieldValue;
            self.IDCardTextField.placeholder = basicModel.placeholder;
            break;
        }
        case 32:{
            self.textField.hidden = NO;
            self.textField.text = basicModel.textFieldValue;
            self.textField.placeholder = basicModel.placeholder;
            self.textField.keyboardType = UIKeyboardTypeASCIICapableNumberPad;
            break;
        }
        case 33:{
            self.textField.hidden = NO;
            self.textField.text = basicModel.textFieldValue;
            self.textField.placeholder = basicModel.placeholder;
            self.textField.keyboardType = UIKeyboardTypeEmailAddress;
            break;
        }
        case 18:{
            self.switchBtn.hidden = NO;
            self.switchBtn.on = basicModel.expand;
            break;
        }
        case 21:{
            _priceLabel.hidden = NO;
            _priceLabel.text = basicModel.rightValue ? : @"price!!";
            break;
        }
        default:
            break;
    }
}
@end
