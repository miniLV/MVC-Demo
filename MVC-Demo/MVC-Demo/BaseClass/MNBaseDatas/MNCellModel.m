//
//  LFbasicCellModel.m
//  HCCF
//
//  Created by Lyh on 2017/11/22.
//  Copyright © 2017年 xmhccf. All rights reserved.
//

#import "MNCellModel.h"

@implementation MNCellModel

+ (NSDictionary *)modelContainerPropertyGenericClass{
    return @{@"cellModels" : [MNCellModel class]};
}

+ (void)fetchDatas{
    
}

#pragma mark - NSCoding


@end
