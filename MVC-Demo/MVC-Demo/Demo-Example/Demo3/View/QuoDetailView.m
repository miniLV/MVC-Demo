//
//  QuoDetailView.m
//  HCCF
//
//  Created by Lyh on 2018/4/12.
//  Copyright © 2018年 xmhccf. All rights reserved.
//

#import "QuoDetailView.h"

static CGFloat topViewH = 68;

@implementation QuoDetailViewTypeSuccess{
    UIImageView *_logoIV;
    UILabel *_titleLabel;
}

- (void)set_headerViewWithModel:(CarQuotationModel *)model{
    
    _logoIV.image = MNImage(@"miniLV.jpg");
    _titleLabel.text = @"小蠢驴经济公司";
}

- (void)head_setSettings{
    self.frame = Frame(0, 0, ScreenW, topViewH);
    self.backgroundColor = [UIColor whiteColor];
}

- (void)head_createControls{
    
    UIView *topView = [MNView topViewWithBackgroudColor:[UIColor whiteColor]
                                                 height:topViewH
                                             parentView:self];
    
    UIImageView *logoIV = [[UIImageView alloc]init];
    [topView addSubview:logoIV];
    [logoIV mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.mas_equalTo(topView);
        make.left.mas_equalTo(DefaultMargin);
        make.width.height.mas_equalTo(55);
    }];
    _logoIV = logoIV;
    
    UILabel *titleLabel = [MNLabel mn_labelWithFont:HZ_16FontSize
                                              color:HZ_494949Color
                                         parentView:topView];
    [titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(73);
        make.centerY.mas_equalTo(topView);
    }];
    _titleLabel = titleLabel;

}

+ (instancetype)bottomViewWithParentView:(UIView *)parentView
{
    
    return [[self alloc]initBottomViewWithParentView:parentView];
}

- (instancetype)initBottomViewWithParentView:(UIView *)parentView{
    
    if (self = [super init]) {
        
        [parentView addSubview:self];
        [self mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.bottom.right.mas_equalTo(0);
            make.height.mas_equalTo(DefaultBottomTabBarHeight);
        }];
        [self p_createControls];
    }
    return self;
}

- (void)p_createControls{
    
    NSArray *titles = @[@"重新报价", @"立即投保"];
//    NSArray *titles = @[@"重新报价"];
    NSArray *backgroundColors = @[HZ_F9B03EColor, HZ_24C789Color];
    
    CGFloat btnW = ScreenW / titles.count;
    CGFloat btnH = DefaultBottomTabBarHeight;
    for (int i = 0 ; i < titles.count; i ++) {
        
        UIButton *button = [MNButton buttonWithTitle:titles[i]
                                          titleColor:HZ_FFF8EDColor
                                            fontSize:HZ_17FontSize
                                     backgroundColor:backgroundColors[i]
                                          parentView:self
                                          targetName:@selector(p_clickBottomBtn:)
                                            delegate:self];
        button.tag = i;
        
        CGFloat btnX = btnW * i;
        button.frame = Frame(btnX, 0, btnW, btnH);
        
    }
}

- (void)p_clickBottomBtn:(UIButton *)sender{
    
    switch (sender.tag) {
        case 0:
        {
            [_delegate respondsToSelector:@selector(clickRePlanBtn)] ?
            [_delegate clickRePlanBtn] : nil;
            break;
        }
        case 1:{
            [_delegate respondsToSelector:@selector(pushToNext)] ?
            [_delegate pushToNext] : nil;
            break;
        }
        default:
            break;
    }
}

@end


@implementation QuoDetailViewTypeFailed

+ (instancetype)contentViewWithModel:(CarQuotationModel *)model{

    return [[self alloc]initContentViewWithModel:model];
}

- (instancetype)initContentViewWithModel:(CarQuotationModel *)model{
    
    if ( self = [super init]) {
        
        self.frame = Frame(0, DefaultNaviHeight, ScreenW, ScreenH);
        [self p_createControlsWithWithModel:model];
    }
    return self;
}

- (void)p_createControlsWithWithModel:(CarQuotationModel *)model{
    
    UIImageView *stateIV = [[UIImageView alloc]init];
    [self addSubview:stateIV];
    [stateIV mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.mas_equalTo(self);
        make.top.mas_equalTo(65);
        make.width.height.mas_equalTo(50);
    }];
    stateIV.image = MNImage(@"dd-fail");
    
    UILabel *title = [MNLabel mn_labelWithTitle:@"报价失败！"
                                           font:HZ_20FontSize
                                          color:HZ_494949Color
                                     parentView:self];
    [title mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.mas_equalTo(self);
        make.top.mas_equalTo(stateIV.mas_bottom).mas_equalTo(15);
    }];
    
//    NSString *tempStr = model.quote_msg ? : @"";
    NSString *tempStr = @"test";
    NSString *reasonStr = [@"原因：" stringByAppendingString:tempStr];
    UILabel *reasonLabel = [MNLabel mn_labelWithTitle:reasonStr
                                                 font:HZ_14FontSize
                                                color:HZ_777777Color
                                           parentView:self];
    reasonLabel.numberOfLines = 17;
    reasonLabel.textAlignment = NSTextAlignmentCenter;
    [reasonLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(title.mas_bottom).mas_equalTo(25);
        make.left.mas_equalTo(70);
        make.right.mas_equalTo(-70);
    }];
    
    
    UIButton *btn = [MNButton buttonWithTitle:@""
                                   titleColor:HZ_EDFFF8Color
                                     fontSize:HZ_16FontSize
                              backgroundColor:HZ_24C789Color
                                   parentView:self
                                   targetName:@selector(p_clickBtn:)
                                     delegate:self];
    [btn hg_setAllCornerWithCornerRadius:5];
    
    [btn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.mas_equalTo(self);
        make.top.mas_equalTo(reasonLabel.mas_bottom).mas_equalTo(25);
        make.width.mas_equalTo(163);
        make.height.mas_equalTo(33);
    }];

//    CarQuoteEnumType type = [CarQuoteType getQuoteTypeFromState:model.state];
//    if (type == carQuoteTypeFailed || type == carQuoteTypeRepeatedInsurance) {
//        [btn setTitle:@"重新报价" forState:UIControlStateNormal];
//        btn.tag = 0;
//    }else if (type == carQuoteTypeBadCarModel){
//        [btn setTitle:@"重新校验车型" forState:UIControlStateNormal];
//        btn.tag = 1;
//    }else{
//        MNLog(@"error type!! - type=%ld",(long)type)
//    }
}

- (void)p_clickBtn:(UIButton *)sender{
    
    [_delegate respondsToSelector:@selector(clickCenterBtn:)] ?
    [_delegate clickCenterBtn:sender] : nil;
}


@end
