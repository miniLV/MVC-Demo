//
//  LFOrderConst.m
//  HCCF
//
//  Created by Lyh on 2017/12/12.
//  Copyright © 2017年 xmhccf. All rights reserved.
//

#import "Demo1Const.h"

@implementation Demo1Const

CGFloat const LFOrderTopViewH = 44 + 10;

CGFloat const btnsViewH = 44;

CGFloat const defaultNaviHeight = 64;

CGFloat const lineViewH = 10;




+ (LFOrderType)getState:(NSString *)state{
    
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


@end
