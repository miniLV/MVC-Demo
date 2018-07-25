//
//  LFOrderHomeCell.m
//  HCCF
//
//  Created by Lyh on 2017/12/12.
//  Copyright © 2017年 xmhccf. All rights reserved.
//

#import "Demo1Cell.h"
#import "Demo1Model.h"
#import "UIView+HGCorner.h"
#import "Demo1StateBtn.h"
#import "Demo1Const.h"
#import "Demo1Label.h"

@implementation Demo1Cell{

    //顶部时间
    UILabel *_dateLabel;
    //订单状态label
    UILabel *_topStateLabel;
    //左侧缩略图
    UIImageView *_icon;
    //顶部标题 - 保险名称
    UILabel *_titleLabel;
    //投保人label
    UILabel *_payNameLabel;
    //被保人label
    UILabel *_insuredLabel;
    //起保时间
    UILabel *_startDateLabel;
    //保障期限
    UILabel *_durationLabel;
    
    
    //订单金额label
    UILabel *_priceLabel;
    //右下角状态btn
    UIButton *_stateRightBtn;
    UIButton *_stateLeftBtn;
    
    //佣金金额
    UILabel *_brokerageLabel;
}


- (void)createControls{
    
    //1.创建顶部View
    [self createTopView];
    
    //2.创建中间部分内容
    [self createCenterView];
    
    //3.创建下方的View
    [self createFooterView];
    
    //4.底部线条
    [self createGrayView];
    
}

- (void)createTopView{

    UIView *topView = [[UIView alloc]init];
    [self.contentView addSubview:topView];
    [topView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.top.right.mas_equalTo(0);
        make.height.mas_equalTo(44);
    }];
    
    //1.时间label
    UILabel *timeLabel = [[UILabel alloc]init];
    timeLabel.font = HZ_14FontSize;
    timeLabel.textColor = HZ_383838Color;
    [topView addSubview:timeLabel];
    [timeLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.mas_equalTo(topView);
        make.left.mas_equalTo(DefaultMargin);
    }];
    _dateLabel = timeLabel;
    
    //2.xx状态label
    UILabel *stateLabel = [[UILabel alloc]init];
    stateLabel.font = HZ_12FontSize;
    stateLabel.textColor = HZ_17D487Color;
    [topView addSubview:stateLabel];
    [stateLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.mas_equalTo(topView);
        make.right.mas_equalTo(-DefaultMargin);
    }];
    _topStateLabel = stateLabel;
    
    //底部细线
    UIView *lineView = [[UIView alloc]init];
    [topView addSubview:lineView];
    lineView.backgroundColor = HZ_f2f3f7Color;
    [lineView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.bottom.right.mas_equalTo(0);
        make.height.mas_equalTo(0.5);
    }];
    
}

- (void)createCenterView{

    UIView *centerView = [[UIView alloc]init];
    [self.contentView addSubview:centerView];
    [centerView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.mas_equalTo(0);
        make.top.mas_equalTo(44);
        make.height.mas_equalTo(109 + 15);
    }];
    
    
    //1.icon
    UIImageView *icon = [[UIImageView alloc]init];
    [icon hg_setAllCornerWithCornerRadius:5];
    [centerView addSubview:icon];
    [icon mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(5);
        make.top.mas_equalTo(DefaultMargin);
        make.width.height.mas_equalTo(64);
    }];
    _icon = icon;
    
    //2.title
    UILabel *titleLabel = [[UILabel alloc]init];
    titleLabel.font = HZ_14FontSize;
    titleLabel.textColor = HZ_39393DColor;
    [centerView addSubview:titleLabel];
    [titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(DefaultMargin);
        make.left.mas_equalTo(icon.mas_right).mas_equalTo(DefaultMargin);
    }];
    _titleLabel = titleLabel;
    
    //3.投保人标题label
    Demo1Label *payLeftLabel = [Demo1Label leftLabelTitle:@"投保人:"];
    [centerView addSubview:payLeftLabel];
    [payLeftLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(titleLabel);
        make.top.mas_equalTo(titleLabel.mas_bottom).mas_equalTo(15);
    }];
    
    //3.1投保人name
    Demo1Label *payNameLabel = [Demo1Label contentLabel];
    [centerView addSubview:payNameLabel];
    [payNameLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(payLeftLabel.mas_right).mas_equalTo(2);
        make.top.mas_equalTo(payLeftLabel);
    }];
    _payNameLabel = payNameLabel;
    
    //4. 被保人
    Demo1Label *insuredLeftLabel = [Demo1Label leftLabelTitle:@"被保人:"];
    [centerView addSubview:insuredLeftLabel];
    [insuredLeftLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(titleLabel);
        make.top.mas_equalTo(payLeftLabel.mas_bottom).mas_equalTo(3);
    }];
    
    //4.1被保人姓名
    Demo1Label *insuredLabel = [Demo1Label contentLabel];
    [centerView addSubview:insuredLabel];
    [insuredLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(insuredLeftLabel.mas_right).mas_equalTo(2);
        make.top.mas_equalTo(insuredLeftLabel);
    }];
    _insuredLabel = insuredLabel;
    
    //5.起保时间
    Demo1Label *startDateTitle = [Demo1Label leftLabelTitle:@"起保时间:"];
    [centerView addSubview:startDateTitle];
    [startDateTitle mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(titleLabel);
        make.top.mas_equalTo(insuredLeftLabel.mas_bottom).mas_equalTo(3);
    }];
    
    Demo1Label *startDateContent = [Demo1Label contentLabel];
    [centerView addSubview:startDateContent];
    [startDateContent mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(startDateTitle.mas_right).mas_equalTo(2);
        make.top.mas_equalTo(startDateTitle);
    }];
    _startDateLabel = startDateContent;
    
    
    //6.保险期间
    Demo1Label *durationTitleLabel = [Demo1Label leftLabelTitle:@"保险期间:"];
    [centerView addSubview:durationTitleLabel];
    [durationTitleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(titleLabel);
        make.top.mas_equalTo(startDateTitle.mas_bottom).mas_equalTo(3);
    }];
    
    //6.1内容
    Demo1Label *durationLabel = [Demo1Label contentLabel];
    [centerView addSubview:durationLabel];
    [durationLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(durationTitleLabel.mas_right).mas_equalTo(2);
        make.top.mas_equalTo(durationTitleLabel);
    }];
    _durationLabel = durationLabel;

}

- (void)createFooterView{

    //1.footerView
    UIView *footerView = [[UIView alloc]init];
    [self.contentView addSubview:footerView];
    [footerView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.mas_equalTo(0);
        make.height.mas_equalTo(64);
        make.bottom.mas_equalTo(-10);
    }];
    
    //2.顶部线条
    UIView *lineView = [[UIView alloc]init];
    [footerView addSubview:lineView];
    lineView.backgroundColor = HZ_f2f3f7Color;
    [lineView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.top.right.mas_equalTo(0);
        make.height.mas_equalTo(0.5);
    }];
    
    //3.订单金额Titlelabel
    MNLabel*priceTitleLabel = [MNLabel mn_labelWithTitle:@"订单金额:"
                                                     font:HZ_13FontSize
                                                    color:HZ_494949Color
                                               parentView:footerView];
    
    [priceTitleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(DefaultMargin);
        make.bottom.mas_equalTo(footerView.mas_centerY).mas_equalTo(-3);
    }];
    
    //3.1 金额内容label
    UILabel *priceLabel = [MNLabel mn_labelWithFont:HZ_15FontSize
                                              color:HZ_FF4D4DColor
                                         parentView:footerView];
    [priceLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(priceTitleLabel.mas_right).mas_equalTo(2);
        make.top.mas_equalTo(priceTitleLabel);
    }];
    _priceLabel = priceLabel;
    
    //4.佣金金额
    UILabel *brokerageTitle = [MNLabel mn_labelWithTitle:@"佣金金额:"
                                                    font:HZ_13FontSize
                                                   color:HZ_494949Color
                                              parentView:footerView];
    [brokerageTitle mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(priceTitleLabel);
        make.top.mas_equalTo(footerView.mas_centerY).mas_equalTo(3);
    }];
    
    //4.1佣金
    UILabel *brokerageLabel = [MNLabel mn_labelWithFont:HZ_15FontSize
                                                  color:HZ_FF4D4DColor
                                             parentView:footerView];
    [brokerageLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(brokerageTitle.mas_right).mas_equalTo(2);
        make.top.mas_equalTo(brokerageTitle);
    }];
    _brokerageLabel = brokerageLabel;
    
    //5.底部按钮 - 右侧按钮
    Demo1StateBtn *rightBtn = [Demo1StateBtn stateBtn];
    [rightBtn addTarget:self action:@selector(clickStateBtn:) forControlEvents:UIControlEventTouchUpInside];
    [footerView addSubview:rightBtn];
    [rightBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.centerY.mas_equalTo(footerView);
        make.width.mas_equalTo(75);
        make.height.mas_equalTo(29);
        make.right.mas_equalTo(-DefaultMargin);
    }];
    _stateRightBtn = rightBtn;
    _stateRightBtn.hidden = YES;
    //6.底部按钮 - 如果有2个，左侧按钮
    Demo1StateBtn *leftBtn = [Demo1StateBtn stateBtn];
    [leftBtn addTarget:self action:@selector(clickStateBtn:) forControlEvents:UIControlEventTouchUpInside];
    [footerView addSubview:leftBtn];
    [leftBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.centerY.mas_equalTo(footerView);
        make.width.mas_equalTo(75);
        make.right.mas_equalTo(rightBtn.mas_left).mas_equalTo(-DefaultMargin);
    }];
    _stateLeftBtn = leftBtn;
    _stateLeftBtn.hidden = YES;
    
}

- (void)createGrayView{

    UIView *grayView = [[UIView alloc]init];
    grayView.backgroundColor = HZ_f2f3f7Color;
    [self.contentView addSubview:grayView];
    [grayView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.left.right.mas_equalTo(0);
        make.height.mas_equalTo(10);
    }];
    
}



- (void)setModel:(Demo1Model *)model{
    
    _titleLabel.text = model.product.name;
    _payNameLabel.text = model.applicant;
    
    _icon.yy_imageURL = [NSURL URLWithString:model.product.thumbnail_url];
 
    //被保人
    NSArray *insuredSets = model.insured_set;
    NSString *result = @"";
    for (int i = 0 ; i < insuredSets.count ; i ++) {
        Order_Insured_Set *SetModel = insuredSets[i];
        NSString *tempName = SetModel.name;
        if (tempName.length) {
            
            result = [result stringByAppendingString:tempName];

            if(i < insuredSets.count - 1){
                //不到最后一个，就用、号隔开
                result = [result stringByAppendingString:@"、"];
            }
        }
    }
    _insuredLabel.text = result;
    
    _priceLabel.text = [@"¥" stringByAppendingString:model.premium];
    
    _dateLabel.text = model.created_at;

    _brokerageLabel.text = model.brokerage_info;

    _startDateLabel.text = model.start_date ? : @"";
    
    _durationLabel.text = model.duration_desc;
    
    LFOrderType type = [self getState:model.state];
    
    /**
     按钮的顺序tag + 当前row*1000 = btn的tag
     待支付 - 立即支付 - tag = 0
     已支付 - 电子保单 - tag = 1
           - 我要理赔 - tag = 2
     已关闭 - 重新购买 - tag = 3
     */
    
    _stateLeftBtn.tag = _indexPath.row;
    _stateRightBtn.tag = _indexPath.row;
    switch (type) {
        case TypeWatiPay:
        {
            _topStateLabel.text = @"待支付";
            [_stateRightBtn setTitle:@"立即支付" forState:UIControlStateNormal];
            _stateRightBtn.hidden = NO;
            
            break;
        }
        case TypeSucceed:
        case TypeHadPay:
        {
            _topStateLabel.text = @"已支付";
            [_stateRightBtn setTitle:@"我要理赔" forState:UIControlStateNormal];
            _stateRightBtn.hidden = NO;
            /**电子表单功能暂时隐藏，如果回头有需要，打开下方注释即可*/
//            [_stateLeftBtn setTitle:@"电子保单" forState:UIControlStateNormal];
//            _stateLeftBtn.hidden = NO;
            
            break;
        }
        case TypeClosed:
        {
            _topStateLabel.text = @"已关闭";
            [_stateRightBtn setTitle:@"重新购买" forState:UIControlStateNormal];
            _stateRightBtn.hidden = NO;
           
            break;
        }
        default:
            break;
    }
}



- (LFOrderType)getState:(NSString *)state{

    if ([state isEqualToString:@"pending payment"]) {
        return TypeWatiPay;
    }
    else if ([state isEqualToString:@"placed order"]){
        return TypeHadPay;
    }
    else if ([state isEqualToString:@"succeed"]){
        return TypeSucceed;
    }
    return TypeClosed;
}

- (void)clickStateBtn:(UIButton *)sender{

    if ([_delegate respondsToSelector:@selector(clickOrderStateBtn:)]) {
        [_delegate clickOrderStateBtn:sender];
    }
}

@end
