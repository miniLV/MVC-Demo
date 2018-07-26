//
//  CarSelectePlanView.m
//  HCCF
//
//  Created by Lyh on 2018/4/9.
//  Copyright © 2018年 xmhccf. All rights reserved.
//

#import "Demo3SectionView.h"
#import "HZSectionView.h"

@implementation Demo3SectionView

+ (instancetype)sectionViewWithTitle:(NSString *)title section:(NSInteger)section{
    
    return [[self alloc]initSectionViewWithTitle:title section:section];
}

- (instancetype)initSectionViewWithTitle:(NSString *)title section:(NSInteger)section{
    
    if (self = [super init]) {
        
        [self createControlsWithTitle:title section:section];
    }
    return self;
    
}

- (void)createControlsWithTitle:(NSString *)title section:(NSInteger)section{
    
    self.frame = Frame(0, 0, ScreenW, 44);
    self.backgroundColor = [UIColor whiteColor];
    UIButton *btn = [MNButton buttonWithBackgroundImage:nil
                                             parentView:self
                                             targetName:@selector(clickSectionBtn:)
                                               delegate:self];
    [btn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.top.bottom.mas_equalTo(0);
    }];
    btn.tag = section;
    HZSectionView *view = [HZSectionView sectionViewTypeBottomLine:title];
    /**
     响应链机制，默认UIView是开启用户交互的，如果打开就是上面的view响应，不是下面的button，与预期不符，所以关闭上层的uiview交互，实现按钮控制
     */
    view.userInteractionEnabled = NO;
    [btn addSubview:view];
    
    //设置图片
    UIButton *arrowBtn = [[UIButton alloc]init];
    [arrowBtn setImage:MNImage(@"arrow-s") forState:UIControlStateNormal];
    [arrowBtn setImage:MNImage(@"arrow-x") forState:UIControlStateSelected];
    
    arrowBtn.userInteractionEnabled = NO;
    [btn addSubview:arrowBtn];
    [arrowBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.mas_equalTo(btn);
        make.right.mas_equalTo(-DefaultMargin);
        make.width.height.mas_equalTo(16);
    }];
    _arrowBtn = arrowBtn;
}


- (void)clickSectionBtn:(UIButton *)sender{
    
    [_delegate respondsToSelector:@selector(car_clickSectionBtn:)] ?
    [_delegate car_clickSectionBtn:sender] : nil;
}


@end
