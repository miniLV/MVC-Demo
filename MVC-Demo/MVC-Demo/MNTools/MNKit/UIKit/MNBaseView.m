//
//  MNBaseView.m
//  HCCF
//
//  Created by Lyh on 2018/4/3.
//  Copyright © 2018年 xmhccf. All rights reserved.
//

#import "MNBaseView.h"

@implementation MNBaseView

+ (instancetype)headerView{
    
    return [[self alloc]initHeaderView];
}

- (instancetype)initHeaderView{
    
    if (self = [super init]) {
        
        [self head_setSettings];
        [self head_createControls];
    }
    return self;
}

- (void)head_createControls{
    
}

- (void)head_setSettings{
    
}

@end
