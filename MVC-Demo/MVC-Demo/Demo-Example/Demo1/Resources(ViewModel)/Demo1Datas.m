//
//  Demo1Datas.m
//  MVC-Demo
//
//  Created by 梁宇航 on 2018/7/25.
//  Copyright © 2018年 xmhccf. All rights reserved.
//

#import "Demo1Datas.h"
#import "MNFileReadWriteClass.h"
#import "Demo1Model.h"

@implementation Demo1Datas

+ (void)fetchDatasSuccessBlock:(MNsuccessBlock)block{
    
    id jsonDatas = [MNFileReadWriteClass loadLocalFileWithFileName:@"order"];
    
    NSArray *result = [NSArray yy_modelArrayWithClass:[Demo1Model class] json:jsonDatas[@"results"]];

    block(result);
    
}

@end
