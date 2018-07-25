//
//  LFMineModel.m
//  HCCF
//
//  Created by xxkj on 17/12/4.
//  Copyright © 2017年 xmhccf. All rights reserved.
//

#import "Demo0Model.h"

@implementation Demo0Model

+(MyAuthType)getAuthType:(NSString *)typeStr{
    
    if (typeStr.length == 0) {
        return MyAuthTypeDefault;
    }
    else if ([typeStr isEqualToString:@"default"]) {
        return MyAuthTypeDefault;
    }
    //认证中
    else if ([typeStr isEqualToString:@"pending"]){
        return MyAuthTypePending;
    }
    //未通过
    else if ([typeStr isEqualToString:@"rejected"]){
        return MyAuthTypeRejected;
    }
    //已经通过
    else if ([typeStr isEqualToString:@"approved"]){
        return MyAuthTypeApprover;
    }
    MNLog(@"MyAuthTypeUnknown - 未知类型！ - %@",typeStr)
    return MyAuthTypeUnknown;
}

@end


@implementation MY_User


@end


@implementation MY_Sex


+ (NSDictionary<NSString *,id> *)modelCustomPropertyMapper{
    return @{@"ID":@"id"};
}

@end


@implementation MY_Area


+ (NSDictionary<NSString *,id> *)modelCustomPropertyMapper{
    return @{@"ID":@"id"};
}

@end


@implementation MY_Certificate_Info


@end



@implementation MY_Approval_Status


@end


@implementation MY_Id_Info


@end


@implementation MY_Id_Type


+ (NSDictionary<NSString *,id> *)modelCustomPropertyMapper{
    return @{@"ID":@"id"};
}

@end


@implementation Avatar

@end

