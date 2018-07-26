//
//  CarAddInfoCell.m
//  HCCF
//
//  Created by Lyh on 2018/4/12.
//  Copyright © 2018年 xmhccf. All rights reserved.
//

#import "Demo2Cell.h"

@implementation Demo2Cell

- (void)setupControls{
    [super setupControls];
    
    self.rightIV.image = MNImage(@"arrow-x");
}

- (void)setBasicModel:(MNCellModel *)basicModel{
    
    NSInteger tag = self.basicIndexPath.section * 100 + self.basicIndexPath.row;
    self.textField.tag = tag;
    self.IDCardTextField.tag = tag;
    self.titleLabel.text = basicModel.titleLabel;
    self.switchBtn.tag = tag;
    
    switch (basicModel.type) {
        case 6:{
            self.textField.hidden = NO;
            self.textField.placeholder = basicModel.placeholder;
            self.textField.text = basicModel.textFieldValue;
            break;
        }
        case 9:{
            self.contentLabel.hidden = NO;
            self.contentLabel.text = basicModel.selectedValue ? : basicModel.placeholder;
            self.contentLabel.textColor = basicModel.selectedValue ? HZ_494949Color : HZ_C8C8C8Color;
            self.rightIV.hidden = NO;
            break;
        }
        case 10:{
            self.contentLabel.hidden = NO;
            self.contentLabel.text = basicModel.selectedValue ? : basicModel.placeholder;
            self.contentLabel.textColor = basicModel.selectedValue ? HZ_494949Color : HZ_C8C8C8Color;
            self.rightIV.hidden = NO;
            break;
        }
        case 18:{
            self.switchBtn.hidden = NO;
            self.switchBtn.on = basicModel.expand;
            break;
        }
        case 31:{
            self.IDCardTextField.hidden = NO;
            self.IDCardTextField.placeholder = basicModel.placeholder;
            self.IDCardTextField.text = basicModel.textFieldValue;
            break;
        }
        default:
            break;
    }
}

@end

@implementation CarAddInfoAddressCell

- (void)setupControls{
    [super setupControls];
    
    [_addressTextView mas_updateConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(117.5);
    }];
    _addressTextView.textAlignment = NSTextAlignmentLeft;
}

- (void)setBasicModel:(MNCellModel *)basicModel{
    
    NSInteger tag = self.basicIndexPath.section * 100 + self.basicIndexPath.row;
    _titleLabel.text = basicModel.titleLabel;
    _addressTextView.tag = tag;
    _addressTextView.text = basicModel.textFieldValue;
    [_addressTextView setPlaceholder:basicModel.placeholder];
}

@end
