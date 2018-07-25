//
//  HZBasicCustonTableView.m
//  HCCF
//
//  Created by Lyh on 2017/12/20.
//  Copyright © 2017年 xmhccf. All rights reserved.
//

#import "HZBasicCustonTableView.h"
#import "UITableView+adapteriOS11.h"
@implementation HZBasicCustonTableView

- (instancetype)initWithFrame:(CGRect)frame{

    if (self = [super initWithFrame:frame]) {
        
        self.separatorColor = HZ_EEEEEEColor;
        self.showsVerticalScrollIndicator = NO;
        [self adapterIOS11WithTableView];
    }
    return self;
}



- (instancetype)initWithFrame:(CGRect)frame style:(UITableViewStyle)style{

    if (self = [super initWithFrame:frame style:style]) {

        self.separatorColor = HZ_EEEEEEColor;
        self.showsVerticalScrollIndicator = NO;
        [self adapterIOS11WithTableView];
    }
    return self;
}

@end
