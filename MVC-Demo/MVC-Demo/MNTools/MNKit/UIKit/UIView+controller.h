//
//  UIView+controller.h
//  HCCF
//
//  Created by Lyh on 2018/1/29.
//  Copyright © 2018年 xmhccf. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (controller)

///获取当前view对应的控制器
- (UIViewController *)viewController;
@end


@interface NSObject (controller)

///获取当前对象的最上层控制器
- (UIViewController*)topMostController;

@end

