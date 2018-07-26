//
//  QuoDetailView.h
//  HCCF
//
//  Created by Lyh on 2018/4/12.
//  Copyright © 2018年 xmhccf. All rights reserved.
//

#import <UIKit/UIKit.h>

@class CarQuotationModel;

@protocol QuoDetailSuccessDelegate <NSObject>

- (void)clickRePlanBtn;

- (void)pushToNext;

@end

@interface Demo3View : MNBaseView

+ (instancetype)bottomViewWithParentView:(UIView *)parentView;

- (void)set_headerViewWithModel:(CarQuotationModel *)model;

@property (nonatomic, weak)id<QuoDetailSuccessDelegate> delegate;

@end

