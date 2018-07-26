//
//  QuoDetailCell.m
//  HCCF
//
//  Created by Lyh on 2018/4/12.
//  Copyright © 2018年 xmhccf. All rights reserved.
//

#import "QuoDetailCell.h"
//#import "MNFormHeader.h"

@interface QuoDetailCell_TypeSuccess()
@end

@implementation QuoDetailCell_TypeSuccess
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
//            self.rightLabel.text = @"起：12312312 \n止:666666";
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
            self.titleLabel.hidden = YES;
            _leftTitleLabel.hidden = NO;
            _leftTitleLabel.text = basicModel.titleLabel;
            
            //createForm
            if (basicModel.modelDatas) {
                [self p_createFormWithDatas:basicModel.modelDatas];
            }
            break;
        }
        default:
            break;
    }
}


- (void)p_createFormWithDatas:(NSArray *)datas{
//    NSArray *titles = @[@"险种", @"保险责任", @"保费"];
//    NSArray *modelKeys = @[@"title",@"detail",@"price"];
//    CGFloat leftWidth = 100;
//    CGFloat rightWidth = 85;
//    CGFloat centerWidth = ScreenW - 2 * DefaultMargin - leftWidth - rightWidth;
//    NSArray *cellWidths = @[[NSString stringWithFormat:@"%f",leftWidth],
//                    [NSString stringWithFormat:@"%f",centerWidth],
//                    [NSString stringWithFormat:@"%f",rightWidth]];
//
//
//    MNFormView *formView = [MNFormView mn_formViewWithDatas:datas
//                                                     titles:titles
//                                                      width:ScreenW - 2 * DefaultMargin
//                                                  lineColor:HZ_f2f3f7Color
//                                                  modelKeys:modelKeys
//                                                 cellWidths:cellWidths
//                                             textAlignments:nil];
//    formView.delegate = self;
//    [self.contentView addSubview:formView];
//    CGFloat formViewH = datas.count * DefaultCellHeight + formTopMargin;
//    [formView mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.top.mas_equalTo(50);
//        make.left.mas_equalTo(DefaultMargin);
//        make.height.mas_equalTo(formViewH);
//        make.bottom.mas_equalTo(-DefaultMargin);
//    }];
}

#pragma mark - privateDelegate

//- (UIFont *)mn_textFontWithIndex:(GridIndex)index{
//    if (index.col == 0) {
//        return HZ_13FontSize;
//    }
//    else if (index.col == 2){
//        return HZ_14FontSize;
//    }else{
//        return HZ_13FontSize;
//    }
//}
//
//- (UIColor *)mn_textColorWithIndex:(GridIndex)index{
//    if (index.col == 0) {
//        return HZ_494949Color;
//    }
//    else if (index.col == 2){
//        return HZ_FF4D4DColor;
//    }else{
//        return HZ_494949Color;
//    }
//}

@end

