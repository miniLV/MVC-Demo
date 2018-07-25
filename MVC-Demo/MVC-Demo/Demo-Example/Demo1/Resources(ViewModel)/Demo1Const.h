//
//  LFOrderConst.h
//  HCCF
//
//  Created by Lyh on 2017/12/12.
//  Copyright © 2017年 xmhccf. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef enum orderType:NSInteger{
    TypeAll = 0,
    TypeWatiPay,
    TypeHadPay,
    TypeSucceed,
    TypeTimeOut,
    TypeClosed,
    
}LFOrderType;

@interface Demo1Const : NSObject

extern CGFloat const LFOrderTopViewH;

extern CGFloat const btnsViewH;

extern CGFloat const contentScrollViewY;

extern CGFloat const tableHeaderViewH;

extern CGFloat const lineViewH;

#define contentScrollViewY (LFOrderTopViewH + DefaultNaviHeight)
#define contentScrollViewH (ScreenH - contentScrollViewY)

///获取当前订单状态
+ (LFOrderType)getState:(NSString *)state;

@end
