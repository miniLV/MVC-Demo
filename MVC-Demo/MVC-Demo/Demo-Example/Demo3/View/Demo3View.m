//
//  QuoDetailView.m
//  HCCF
//
//  Created by Lyh on 2018/4/12.
//  Copyright © 2018年 xmhccf. All rights reserved.
//

#import "Demo3View.h"

static CGFloat topViewH = 68;

@implementation Demo3View{
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
