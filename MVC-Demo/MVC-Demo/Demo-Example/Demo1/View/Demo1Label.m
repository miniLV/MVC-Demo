//
//  Demo1Label.m
//  MVC-Demo
//
//  Created by 梁宇航 on 2018/7/25.
//  Copyright © 2018年 xmhccf. All rights reserved.
//

#import "Demo1Label.h"

@implementation Demo1Label

///投保人、被保人之类的标题label

+ (instancetype) leftLabelTitle:(NSString *)title{
    
    return [super labelWithTitle:title font:HZ_13FontSize color:HZ_777777Color];
}

///首页内容Label
+ (instancetype) contentLabel{
    return [super labelWithTitle:nil font:HZ_13FontSize color:HZ_39393DColor];
}


//详情页header 主标题
+ (instancetype) detailViewTitleLabel{
    return [super labelWithFont:HZ_15FontSize color:HZ_1D1D26Color];
}
+ (instancetype) detailViewTitleLabel:(NSString *)title{
    return [super labelWithTitle:title font:HZ_15FontSize color:HZ_1D1D26Color];
}

@end
