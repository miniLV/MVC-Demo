//
//  HZNoCellLineTableView.m
//  HCCF
//
//  Created by Lyh on 2017/12/20.
//  Copyright © 2017年 xmhccf. All rights reserved.
//

#import "HZNoCellLineTableView.h"
#import "UITableView+adapteriOS11.h"

@implementation HZNoCellLineTableView

- (instancetype)init{
    
    if (self = [super init]) {
        
        self.separatorStyle = UITableViewCellSeparatorStyleNone;
        self.showsVerticalScrollIndicator = NO;
        [self adapterIOS11WithTableView];
    }
    return self;
    
}

- (instancetype)initWithFrame:(CGRect)frame style:(UITableViewStyle)style{
    
    if (self = [super initWithFrame:frame style:style]) {
        
        self.separatorStyle = UITableViewCellSeparatorStyleNone;
        self.showsVerticalScrollIndicator = NO;
        [self adapterIOS11WithTableView];
        
    }
    return self;
}

@end
