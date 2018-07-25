//
//  LFLabel.m
//  HCCF
//
//  Created by Lyh on 2018/1/23.
//  Copyright © 2018年 xmhccf. All rights reserved.
//

#import "MNLabel.h"
#import "UILabel+Utils.h"

@implementation MNLabel

#pragma mark - createLabel

+(instancetype)labelWithFont:(UIFont *)font color:(UIColor *)color{
    return [self labelWithTitle:nil font:font color:color];
}

+(instancetype)labelWithTitle:(NSString *)title font:(UIFont *)font color:(UIColor *)color{
    
    return [self labelWithTitle:title font:font color:color lineSpacing:0];
}

+(instancetype)labelWithTitle:(NSString *)title font:(UIFont *)font color:(UIColor *)color lineSpacing:(CGFloat)lineSpacing{
    
    return [self mn_labelWithTitle:title font:font color:color lineSpacing:lineSpacing parentView:nil];
    
}

+(instancetype)mn_labelWithFont:(UIFont *)font color:(UIColor *)color parentView:(UIView *)parentView{
    
    return [self mn_labelWithTitle:nil font:font color:color parentView:parentView];
}

+(instancetype)mn_labelWithTitle:(NSString *)title font:(UIFont *)font color:(UIColor *)color parentView:(UIView *)parentView{
    
    return [self mn_labelWithTitle:title font:font color:color lineSpacing:0 parentView:parentView];
}

+(instancetype)mn_labelWithTitle:(NSString *)title font:(UIFont *)font color:(UIColor *)color lineSpacing:(CGFloat)lineSpacing parentView:(UIView *)parentView{
    
    return [[self alloc]initWithTitle:title font:font color:color lineSpacing:lineSpacing parentView:parentView];
}

- (instancetype)initWithTitle:(NSString *)title font:(UIFont *)font color:(UIColor *)color lineSpacing:(CGFloat)lineSpacing parentView:(UIView *)parentView{
    
    if (self = [super init]) {
        
        self.textColor = color;
        self.font = font;
        self.numberOfLines = 0;
        
        [self setText:title lineSpacing:lineSpacing];
        
        if (parentView) {
            //添加到父视图
            [parentView addSubview:self];
        }
    }
    return self;
}


#pragma mark - calLabelHeight

+ (CGFloat)calLabelsHeight:(NSArray *)contentLabels
        heightWithFontSize:(UIFont *)fontSize
                     width:(CGFloat)width
               lineSpacing:(CGFloat)lineSpacing
{
    return [self calLabelsHeight:contentLabels
                        fontSize:fontSize width:width
                     lineSpacing:lineSpacing
                paragraphSpacing:0];
    
}


+ (CGFloat)calLabelsHeight:(NSArray *)contentLabels
                  fontSize:(UIFont *)fontSize
                     width:(CGFloat)width
               lineSpacing:(CGFloat)lineSpacing
          paragraphSpacing:(CGFloat)paragraphSpacing{
    
    CGFloat labelViewH = 0;
    for (UILabel *label in contentLabels) {
        
        CGFloat labelH = [UILabel text:label.text
                            HZFontSize:fontSize
                                 width:width
                           lineSpacing:lineSpacing];
        
        labelViewH += labelH + paragraphSpacing;
    }
    return labelViewH + 25;
}

@end


