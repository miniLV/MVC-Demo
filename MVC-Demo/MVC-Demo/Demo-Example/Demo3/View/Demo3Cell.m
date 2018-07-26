//
//  QuoDetailCell.m
//  HCCF
//
//  Created by Lyh on 2018/4/12.
//  Copyright © 2018年 xmhccf. All rights reserved.
//

#import "Demo3Cell.h"

@interface Demo3Cell()
@end

@implementation Demo3Cell
{
    UILabel *_leftTitleLabel;
}

static CGFloat formTopMargin = 50;

- (void)createControls{
    [super createControls];

    UILabel *leftTitleLabel = [MNLabel mn_labelWithFont:HZ_15FontSize
                                                  color:HZ_777777Color
                                             parentView:self.contentView];
    [leftTitleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.left.mas_equalTo(DefaultMargin);
    }];
    leftTitleLabel.hidden = YES;
    _leftTitleLabel = leftTitleLabel;
    
}


- (void)setupControls{
    [super setupControls];
    
    self.rightLabel.font = HZ_16FontSize;
    self.rightLabel.textColor = HZ_FF4D4DColor;
    [self.rightLabel mas_updateConstraints:^(MASConstraintMaker *make) {
        make.right.mas_equalTo(-DefaultMargin);
    }];
    
}

- (void)setBasicModel:(MNCellModel *)basicModel{
    
    self.titleLabel.text = basicModel.titleLabel;
    
    switch (basicModel.type) {
        case 0:{
            self.rightLabel.hidden = NO;
            self.rightLabel.textColor = HZ_494949Color;
            self.rightLabel.text = basicModel.rightValue;
            break;
        }
        case 1:
        {
            self.rightLabel.hidden = NO;
            self.rightLabel.text = basicModel.rightValue ? : @"";
            self.rightLabel.font = HZ_15FontSize;
            self.rightLabel.textColor = HZ_494949Color;
            break;
        }
        case 10:{
            self.titleLabel.textColor = HZ_494949Color;
            self.rightLabel.hidden = NO;
            self.rightLabel.text = basicModel.rightValue ? : @"";
            break;
        }
        case 11:{
            self.titleLabel.textColor = HZ_494949Color;
            self.rightLabel.hidden = NO;
            self.rightLabel.text = basicModel.rightValue ? : @"";
            self.rightUnitLabel.hidden = NO;
            break;
        }
        case 21:{
            self.rightLabel.hidden = NO;
            self.rightLabel.text = basicModel.rightValue ? : @"";
            self.rightUnitLabel.hidden = NO;
            break;
        }case 200:{
            
//            MNLog(@"我要展示一个表格！");
        }
        default:
            break;
    }
}



@end

