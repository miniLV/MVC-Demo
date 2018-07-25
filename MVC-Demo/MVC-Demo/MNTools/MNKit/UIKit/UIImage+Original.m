//
//  UIImage+Original.m
//  BaiSi
//
//  Created by mac on 16/6/20.
//  Copyright © 2016年 lyh. All rights reserved.
//

#import "UIImage+Original.h"

@implementation UIImage (Original)
// 传递一个图片的名称进来，返回一个不渲染的图片
+ (UIImage *)imageNamedWithRenderOriginal:(NSString *)imageName
{
    // 返回一个不渲染的图片
    return [[self imageNamed:imageName] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
}

@end
