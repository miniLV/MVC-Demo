//
//  CarSelectePlanView.h
//  HCCF
//
//  Created by Lyh on 2018/4/9.
//  Copyright © 2018年 xmhccf. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol CarSelectePlanViewDelegate <NSObject>

- (void)car_clickSectionBtn:(UIButton *)sender;

@end

@interface Demo3SectionView : MNBaseView

+ (instancetype)sectionViewWithTitle:(NSString *)title section:(NSInteger)section;

@property (nonatomic, weak)id<CarSelectePlanViewDelegate> delegate;

@property (nonatomic, weak)UIButton *arrowBtn;

//rewrite
- (void)clickSectionBtn:(UIButton *)sender;

@end
