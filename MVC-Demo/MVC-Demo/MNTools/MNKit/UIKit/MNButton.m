//
//  MNButton.m
//  HCCF
//
//  Created by Lyh on 2018/2/28.
//  Copyright © 2018年 xmhccf. All rights reserved.
//

#import "MNButton.h"

/** #import "Masonry.h" 注意事项
 如果有pch导入，这里就不用import
 如果是cocoapods， - #import <Masonry.h>
 */
#import "Masonry.h"

@implementation MNButton

//取消按钮的高亮状态
-(void)setHighlighted:(BOOL)highlighted {
    
}

+ (instancetype)buttonWithTitle:(NSString *)title
                     titleColor:(UIColor *)titleColor
                       fontSize:(UIFont *)fontSize
                backgroundColor:(UIColor *)backgroundColor
                     parentView:(UIView *)parentView
                     targetName:(SEL)targetName
                       delegate:(id)delegate{
    
    return [self buttonWithTitle:title
                      titleColor:titleColor
                        fontSize:fontSize
                 backgroundColor:backgroundColor
                 backgroundImage:nil
                      parentView:parentView
                      targetName:targetName
                        delegate:delegate];
    
}

+ (instancetype)buttonWithBackgroundImage:(UIImage *)backgroundImage
                               parentView:(UIView *)parentView
                               targetName:(SEL)targetName
                                 delegate:(id)delegate{
    return [self buttonWithTitle:nil
                      titleColor:nil
                        fontSize:nil
                 backgroundColor:nil
                 backgroundImage:backgroundImage
                      parentView:parentView
                      targetName:targetName
                        delegate:delegate];
    
}

+ (instancetype)mn_bottomBtnWithTitle:(NSString *)title
                           titleColor:(UIColor *)titleColor
                             fontSize:(UIFont *)fontSize
                      backgroundColor:(UIColor *)backgroundColor
                           parentView:(UIView *)parentView
                               height:(CGFloat)height
                           targetName:(SEL)targetName
                             delegate:(id)delegate{
    
    MNButton *btn = [self buttonWithTitle:title
                               titleColor:titleColor
                                 fontSize:fontSize
                          backgroundColor:backgroundColor
                               parentView:parentView
                               targetName:targetName delegate:delegate];
    [btn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.bottom.right.mas_equalTo(0);
        make.height.mas_equalTo(height);
    }];
    return btn;
}


+ (instancetype)buttonWithTitle:(NSString *)title
                     titleColor:(UIColor *)titleColor
                       fontSize:(UIFont *)fontSize
                backgroundColor:(UIColor *)backgroundColor
                backgroundImage:(UIImage *)backgroundImage
                     parentView:(UIView *)parentView
                     targetName:(SEL)targetName
                       delegate:(id)delegate{
    
    return [[self alloc]initWithTitle:title
                           titleColor:titleColor
                             fontSize:fontSize
                      backgroundColor:backgroundColor
                      backgroundImage:backgroundImage
                           parentView:parentView
                           targetName:targetName
                             delegate:delegate];
}

- (instancetype)initWithTitle:(NSString *)title
                   titleColor:(UIColor *)titleColor
                     fontSize:(UIFont *)fontSize
              backgroundColor:(UIColor *)backgroundColor
              backgroundImage:(UIImage *)backgroundImage
                   parentView:(UIView *)parentView
                   targetName:(SEL)targetName
                     delegate:(id)delegate{
    
    if (self = [super init]) {
        
        self = [[MNButton alloc]init];
        self.titleLabel.font = fontSize;
        [self setTitle:title forState:UIControlStateNormal];
        [self setTitleColor:titleColor forState:UIControlStateNormal];
        if (backgroundColor) {
            [self setBackgroundColor:backgroundColor];
        }
        if (backgroundImage) {
            [self setBackgroundImage:backgroundImage forState:UIControlStateNormal];
        }
        if (parentView) {
            [parentView addSubview:self];
        }
        if (targetName && delegate) {
            [self addTarget:delegate action:targetName forControlEvents:UIControlEventTouchUpInside];
        }
    }
    return self;
}

//清楚按钮的所有选择状态
+ (void)mn_clearBtnsState:(NSArray *)btns{
    
    for (UIButton *btn in btns) {
        btn.selected = NO;
    }
}

@end
