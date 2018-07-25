//
//  Demo1Datas.m
//  MVC-Demo
//
//  Created by 梁宇航 on 2018/7/25.
//  Copyright © 2018年 xmhccf. All rights reserved.
//

#import "Demo1Datas.h"
#import "MNFileReadWriteClass.h"
#import "LFOrderHomeModel.h"

@implementation Demo1Datas

+ (void)fetchDatasSuccessBlock:(MNsuccessBlock)block{
    
    id jsonDatas = [MNFileReadWriteClass getFileDatasWithFileName:@"order.json"];
    
    NSArray *result = [NSArray yy_modelArrayWithClass:[LFOrderHomeModel class] json:jsonDatas[@"results"]];

    block(result);
    
}

@end
