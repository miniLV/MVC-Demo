//
//  LFOrderHomeModel.m
//  HCCF
//
//  Created by Lyh on 2018/4/25.
//  Copyright © 2018年 xmhccf. All rights reserved.
//

#import "Demo1Model.h"

@implementation Demo1Model

+ (NSDictionary<NSString *,id> *)modelContainerPropertyGenericClass{
    return @{@"insured_set" : [Order_Insured_Set class]};
}

@end

@implementation Order_Product


@end


@implementation Order_Insured_Set


@end



