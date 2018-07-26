//
//  MNPlaceholderTextView.h
//  MNPlaceholderTextView
//
//  Created by Lyh on 2017/10/20.
//  Copyright © 2017年 xmhccf. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MNPlaceholderTextView : UITextView


/**
 核心方法

 @param frame frame
 @param color placeholder颜色
 @param fontSize 字体大小
 @return 带placeholder的textView
 */
- (instancetype)initWithFrame:(CGRect)frame withPlaceholderColor:(UIColor *)color fontSize:(CGFloat)fontSize;

/**
 设置 - placeholder内容

 @param placeholder placeholder内容
 */
- (void)setPlaceholder:(NSString *)placeholder;


/**
 设置 - placeholder颜色

 @param placeholderColor placeholder颜色
 */
- (void)setPlaceholderColor:(UIColor *)placeholderColor;


/**
 设置 - textView 字体

 @param font UIfont
 */
- (void)setFont:(UIFont *)font;



/**
 设置 - 普通textView内容

 @param text textView内容
 */
- (void)setText:(NSString *)text;


/**
 设置 textView - 富文本属性字符串

 @param attributedText 富文本string
 */
- (void)setAttributedText:(NSAttributedString *)attributedText;

@end
