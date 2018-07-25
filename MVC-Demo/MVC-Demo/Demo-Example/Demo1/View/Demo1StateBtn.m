//
//  LFOrderStateBtn.m
//  HCCF
//
//  Created by Lyh on 2017/12/12.
//  Copyright © 2017年 xmhccf. All rights reserved.
//

#import "Demo1StateBtn.h"

@implementation Demo1StateBtn

+ (instancetype)stateBtn{

    return [[self alloc]initWithStateBtn];
}

- (instancetype)initWithStateBtn{

    if (self = [super init]) {
        
        [self setTitleColor:HZ_FF9646Color forState:UIControlStateNormal];
        [self.titleLabel setFont:HZ_13FontSize];
        [self.layer setBorderColor:HZ_FF9646Color.CGColor];
        [self.layer setBorderWidth:0.5];
        [self.layer setCornerRadius:5];
    }
    return self;
}

@end
