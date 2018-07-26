//
//  HZSectionView.m
//  HCCF
//
//  Created by Lyh on 2018/1/22.
//  Copyright © 2018年 xmhccf. All rights reserved.
//

#import "HZSectionView.h"

@implementation HZSectionView



//宽度4，高度15的旧版section
+ (instancetype)sectionNormalViewWithTitle:(NSString *)title
                              leftImageStr:(NSString *)leftImageStr
                              isBottomLine:(BOOL)isBottomLine{
    
    return [self sectionFullViewWithTitle:title
                             leftImageStr:leftImageStr
                           leftImageWidth:4
                          leftImageHeight:15
                             isBottomLine:isBottomLine];
}

+ (instancetype)sectionFullViewWithTitle:(NSString *)title
                            leftImageStr:(NSString *)leftImageStr
                          leftImageWidth:(CGFloat)leftImageWidth
                         leftImageHeight:(CGFloat)leftImageHeight
                            isBottomLine:(BOOL)isBottomLine{
 
    return [[self alloc]initSectionViewWithTitle:title
                                    leftImageStr:leftImageStr
                                  leftImageWidth:leftImageWidth
                                 leftImageHeight:leftImageHeight
                                    isBottomLine:isBottomLine];
}

- (instancetype)initSectionViewWithTitle:(NSString *)title
                            leftImageStr:(NSString *)leftImageStr
                          leftImageWidth:(CGFloat)leftImageWidth
                         leftImageHeight:(CGFloat)leftImageHeight
                            isBottomLine:(BOOL)isBottomLine{
    
    if (self = [super init]) {
        
        //1.整个titleView
        self.frame = CGRectMake(0, 0, ScreenW, 44);
        self.backgroundColor = [UIColor whiteColor];
        
        //2.左侧的绿色线条
        UIImageView *leftGreenLineView = [[UIImageView alloc]init];
        [leftGreenLineView setImage:[UIImage imageNamed:leftImageStr]];
        [self addSubview:leftGreenLineView];
        [leftGreenLineView mas_makeConstraints:^(MASConstraintMaker *make) {
            
            make.left.mas_equalTo(DefaultMargin);
            make.centerY.mas_equalTo(self);
            make.width.mas_equalTo(leftImageWidth);
            make.height.mas_equalTo(leftImageHeight);
        }];
        
        //3.title
        UILabel *iasLabel = [[UILabel alloc]init];
        iasLabel.text = title;
        iasLabel.font = HZ_15FontSize;
        iasLabel.textColor = HZ_39393DColor;
        [self addSubview:iasLabel];
        [iasLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(15+4+10);
            make.top.mas_equalTo(15-2.5);
        }];
        
        //4.底部灰色细线
        if (isBottomLine) {
            UIView *bottomGrayView = [[UIView alloc]init];
            bottomGrayView.backgroundColor = HZ_EEEEEEColor;
            [self addSubview:bottomGrayView];
            [bottomGrayView mas_makeConstraints:^(MASConstraintMaker *make) {
                make.left.right.bottom.mas_equalTo(0);
                make.height.mas_equalTo(0.5);
            }];
        }
    }
    return self;
}


+ (instancetype)mn_sectionFullViewWithHeight:(CGFloat)height
                                       Title:(NSString *)title
                                leftImageStr:(NSString *)leftImageStr
                         leftImageLeftMargin:(CGFloat)leftImageLeftMargin
                              leftImageWidth:(CGFloat)leftImageWidth
                             leftImageHeight:(CGFloat)leftImageHeight
                             titleLeftMargin:(CGFloat)titleLeftMargin
                                   titleFont:(UIFont *)titleFont
                                  titleColor:(UIColor *)titleColor
                               rightLabelStr:(NSString *)rightLabelStr
                                   rightFont:(UIFont *)rightFont
                                  rightColor:(UIColor *)rightColor
                                   rightUnit:(NSString *)rightUnit
                                    unitFont:(UIFont *)unitFont
                                   unitColor:(UIColor *)unitColor
                                isBottomLine:(BOOL)isBottomLine{
    
    return [[self alloc]initSectionFullViewWithHeight:height
                                                Title:title
                                         leftImageStr:leftImageStr
                                  leftImageLeftMargin:leftImageLeftMargin
                                       leftImageWidth:leftImageWidth
                                      leftImageHeight:leftImageHeight
                                      titleLeftMargin:titleLeftMargin
                                            titleFont:titleFont
                                           titleColor:titleColor
                                        rightLabelStr:rightLabelStr
                                            rightFont:rightFont
                                           rightColor:rightColor
                                            rightUnit:rightUnit
                                             unitFont:unitFont
                                            unitColor:unitColor
                                         isBottomLine:isBottomLine];
}

- (instancetype)initSectionFullViewWithHeight:(CGFloat)height
                                        Title:(NSString *)title
                                 leftImageStr:(NSString *)leftImageStr
                          leftImageLeftMargin:(CGFloat)leftImageLeftMargin
                               leftImageWidth:(CGFloat)leftImageWidth
                              leftImageHeight:(CGFloat)leftImageHeight
                              titleLeftMargin:(CGFloat)titleLeftMargin
                                    titleFont:(UIFont *)titleFont
                                   titleColor:(UIColor *)titleColor
                                rightLabelStr:(NSString *)rightLabelStr
                                    rightFont:(UIFont *)rightFont
                                   rightColor:(UIColor *)rightColor
                                    rightUnit:(NSString *)rightUnit
                                     unitFont:(UIFont *)unitFont
                                    unitColor:(UIColor *)unitColor
                                 isBottomLine:(BOOL)isBottomLine{
    
    if (self = [super init]) {
        
        //1.整个titleView
        self.frame = CGRectMake(0, 0, ScreenW, height);
        self.backgroundColor = [UIColor whiteColor];
        
        //2.左侧的绿色线条
        UIImageView *leftIV = [[UIImageView alloc]init];
        [leftIV setImage:[UIImage imageNamed:leftImageStr]];
        [self addSubview:leftIV];
        [leftIV mas_makeConstraints:^(MASConstraintMaker *make) {
            
            make.left.mas_equalTo(leftImageLeftMargin);
            make.centerY.mas_equalTo(self);
            make.width.mas_equalTo(leftImageWidth);
            make.height.mas_equalTo(leftImageHeight);
        }];
        
        //3.title
        UILabel *titleLabel = [MNLabel mn_labelWithTitle:title
                                                    font:titleFont
                                                   color:titleColor
                                              parentView:self];
        [titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(titleLeftMargin);
            make.centerY.mas_equalTo(self);
        }];
        
        //4.rightLabel
        UILabel *rightLabel = [MNLabel mn_labelWithTitle:rightLabelStr
                                                    font:rightFont
                                                   color:rightColor
                                              parentView:self];
        [rightLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.right.mas_equalTo(-DefaultMargin);
            make.centerY.mas_equalTo(self);
        }];
        
        //5.unit
        UILabel *unitLabel = [MNLabel mn_labelWithTitle:@"¥"
                                                   font:unitFont
                                                  color:unitColor
                                             parentView:self];
        [unitLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.right.mas_equalTo(rightLabel.mas_left).mas_equalTo(-2);
            make.bottom.mas_equalTo(rightLabel.mas_bottom).mas_equalTo(-2);
        }];
        
        //6.底部灰色细线
        if (isBottomLine) {
            UIView *bottomGrayView = [[UIView alloc]init];
            bottomGrayView.backgroundColor = HZ_EEEEEEColor;
            [self addSubview:bottomGrayView];
            [bottomGrayView mas_makeConstraints:^(MASConstraintMaker *make) {
                make.left.right.bottom.mas_equalTo(0);
                make.height.mas_equalTo(0.5);
            }];
        }
    }
    return self;
}


+ (instancetype)sectionViewTypeNormal:(NSString *)title{
    return [self sectionNormalViewWithTitle:title
                               leftImageStr:@"sign"
                               isBottomLine:NO];
}

+ (instancetype)sectionViewTypeBottomLine:(NSString *)title{
    return [self sectionNormalViewWithTitle:title
                               leftImageStr:@"sign"
                               isBottomLine:YES];
}
@end
