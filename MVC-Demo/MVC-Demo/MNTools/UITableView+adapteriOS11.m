//
//  UITableView+adapteriOS11.m
//  HCCF
//
//  Created by 梁宇航 on 2017/12/26.
//  Copyright © 2017年 xmhccf. All rights reserved.
//

#import "UITableView+adapteriOS11.h"
@implementation UITableView (adapteriOS11)

- (void)adapterIOS11WithTableView{

    if (@available(iOS 11.0, *)){
        self.estimatedRowHeight = 0;
        self.estimatedSectionHeaderHeight = 0;
        self.estimatedSectionFooterHeight = 0;
        self.contentInsetAdjustmentBehavior = UIScrollViewContentInsetAdjustmentNever;
    }
    
}

@end
