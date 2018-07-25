//
//  UIView+controller.m
//  HCCF
//
//  Created by Lyh on 2018/1/29.
//  Copyright © 2018年 xmhccf. All rights reserved.
//

#import "UIView+controller.h"

@implementation UIView (controller)

- (UIViewController *)viewController {
    for (UIView* next = [self superview]; next; next = next.superview) {
        UIResponder *nextResponder = [next nextResponder];
        if ([nextResponder isKindOfClass:[UIViewController class]]) {
            return (UIViewController *)nextResponder;
        }
    }
    return nil;
}

@end


@implementation NSObject (controller)

///获取最上层控制器
- (UIViewController*)topMostController {
    
    UIViewController *topController = [UIApplication sharedApplication].keyWindow.rootViewController;
    
    while (topController.presentedViewController) {
        topController = topController.presentedViewController;
    }
    
    return topController;
}

@end
