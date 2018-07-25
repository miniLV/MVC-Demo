//
//  MYPersonalCell.m
//  HCCF
//
//  Created by Lyh on 2018/1/30.
//  Copyright © 2018年 xmhccf. All rights reserved.
//

#import "Demo0Cell.h"

@implementation Demo0Cell

- (void)createControls{
    [super createControls];

    //设置代理方法
    [self.rightTextField addTarget:self action:@selector(PersonalEndEdit:) forControlEvents:UIControlEventEditingDidEnd];
    
    [self.rightTextField addTarget:self action:@selector(ListenEditorText:) forControlEvents:UIControlEventEditingChanged];
}

- (void)setupControls{
    [super setupControls];
    
    self.titleLabel.font = HZ_15FontSize;
    self.titleLabel.textColor = HZ_777777Color;
    
    self.rightLabel.font = HZ_15FontSize;
    self.rightLabel.textColor = HZ_494949Color;
    
    self.rightTextField.textColor = HZ_494949Color;
    self.rightTextField.font = HZ_16FontSize;
}


-(void)setBasicModel:(MNCellModel *)basicModel{
    
    NSInteger tag = _indexpath.section * 100 + _indexpath.row;
    self.rightTextField.tag = tag;
    
    self.titleLabel.text = basicModel.titleLabel;

    switch (basicModel.type) {
        case 0:{
            self.rightLabel.hidden = NO;
            self.rightLabel.text = basicModel.rightValue;
            break;
        }
        case 1:
        case 2:{
            self.rightIV.hidden = NO;
            self.rightLabel.hidden = NO;
            
            BOOL q1 = [basicModel.rightValue isEqualToString:@"未认证"];
            BOOL q2 = [basicModel.rightValue isEqualToString:@"审核未通过"];
            self.rightLabel.textColor = (q1 || q2) ? HZ_FF4D4DColor : HZ_494949Color;
            self.rightLabel.text = basicModel.rightValue;
            break;
        }
        case 3:
        case 5:{
            self.rightIV.hidden = NO;
            self.rightLabel.hidden = NO;
            if (![basicModel.rightValue isEqualToString:@"0"]) {
                self.rightLabel.text = basicModel.rightValue;
            }
            break;
        }
        case 4:{
            self.rightIV.hidden = NO;
            self.rightIV.image = MNImage(@"arrow-x");
            self.rightLabel.hidden = NO;
            self.rightLabel.text = basicModel.selectedValue ? basicModel.selectedValue : basicModel.placeholder;
            break;
        }
        case 50:{
            self.rightTextField.hidden = NO;
            self.rightTextField.placeholder = basicModel.placeholder;
            self.rightTextField.text = basicModel.rightValue;
            break;
        }
        case 51:{
            self.rightIV.hidden = NO;
            self.rightLabel.hidden = NO;
            self.rightLabel.textColor = basicModel.selectedValue ? HZ_383838Color : HZ_C8C8C8Color;
            self.rightLabel.text = basicModel.selectedValue ? basicModel.selectedValue : basicModel.placeholder;
            
            break;
        }
        default:
            break;
    }
}

- (void)ListenEditorText:(UITextField *)sender{

    [_delegate respondsToSelector:@selector(PersonalListenEditor:)] ? [_delegate PersonalListenEditor:sender] : nil;

}

- (void)PersonalEndEdit:(UITextField *)sender{
    
    [_delegate respondsToSelector:@selector(PersonalEndEdit:)] ? [_delegate PersonalEndEdit:sender] : nil;
}

@end


@implementation MYPersonalAvaterCell{
    UIImageView *_avaterIV;
}


- (void)createControls{
    
    [super createControls];
    
    CGFloat avaterWH = 44;
    //创建头像
    UIImageView *avaterIV = [[UIImageView alloc]init];
    [avaterIV hg_setAllCornerWithCornerRadius:avaterWH * 0.5];
    [self.contentView addSubview:avaterIV];
    [avaterIV mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.mas_equalTo(-35);
        make.centerY.mas_equalTo(self);
        make.width.height.mas_equalTo(avaterWH);
    }];
    avaterIV.hidden = YES;
    _avaterIV = avaterIV;
    
    //titleLabel
    UILabel *titleLabel = [MNLabel mn_labelWithTitle:@"照片"
                                                font:HZ_15FontSize
                                               color:HZ_777777Color
                                          parentView:self.contentView];
    [titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(DefaultMargin);
        make.top.mas_equalTo(19);
    }];
    
    UILabel *detailLabel = [MNLabel mn_labelWithTitle:@"请上传证件照或职业照"
                                                 font:HZ_13FontSize
                                                color:HZ_BBBBBBColor
                                           parentView:self.contentView];
    [detailLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(titleLabel);
        make.top.mas_equalTo(titleLabel.mas_bottom).mas_equalTo(5);
    }];
    
}

- (void)setBasicModel:(MNCellModel *)basicModel{
    self.rightIV.hidden = NO;
    _avaterIV.hidden = NO;
    
    /**
     1.图片选择上传的时候，拿到的是UIImage对象 - 所以这里只能声明UIImage属性去接收，显示选中的UIImage
     2.如果没有选中图片，显示网络拿到的头像
     3.如果都没有，显示默认占位头像
     */
    if (basicModel.selectedImage){
        _avaterIV.image = basicModel.selectedImage;
    }
    else if (basicModel.rightValue) {
        _avaterIV.yy_imageURL = [NSURL URLWithString:basicModel.rightValue];
    }
    else{
        _avaterIV.image = [UIImage imageNamed:@"Avatarsample"];
    }
}


@end
