//
//  MNView.m
//  HCCF
//
//  Created by Lyh on 2018/2/27.
//  Copyright © 2018年 xmhccf. All rights reserved.
//

#import "MNView.h"

@implementation MNView

+ (instancetype)viewWithFrame:(CGRect)frame{
    return [[self alloc]initWithFrame:frame];
}

+ (instancetype)viewWithBackgroudColor:(UIColor *)backgroudColor{
    return [[self alloc]initWithBackgroudColor:backgroudColor
                                        height:0
                                    parentView:nil
                                         isTop:NO
                                      isBottom:NO];
}

///快速创建-高度=10，top约束=0，背景色=F2F3F7的View
+ (instancetype)topViewDefaultWithParentView:(UIView *)parentView{

    return [self topViewF2F3F7ColorWithHeight:10 parentView:parentView];
}

+ (instancetype)topViewF2F3F7ColorWithHeight:(CGFloat)height
                                  parentView:(UIView *)parentView{
    return [self topViewWithBackgroudColor:HZ_f2f3f7Color
                                    height:height
                                parentView:parentView];
}

+ (instancetype)topViewWithBackgroudColor:(UIColor *)backgroudColor
                                   height:(CGFloat)height
                               parentView:(UIView *)parentView{
    return [[self alloc]initWithBackgroudColor:backgroudColor
                                        height:height
                                    parentView:parentView
                                         isTop:YES
                                      isBottom:NO];
}


///快速创建-高度=10，top约束=0，背景色=F2F3F7的View
+ (instancetype)bottomDefaultWithParentView:(UIView *)parentView{
    return [self bottomViewF2F3F7ColorWithHeight:10 parentView:parentView];
}

+ (instancetype)bottomViewF2F3F7ColorWithHeight:(CGFloat)height
                                     parentView:(UIView *)parentView{
    return [self bottomViewWithBackgroudColor:HZ_f2f3f7Color
                                       height:height
                                   parentView:parentView];
}

+ (instancetype)bottomViewWithBackgroudColor:(UIColor *)backgroudColor
                                   height:(CGFloat)height
                               parentView:(UIView *)parentView{
    return [[self alloc]initWithBackgroudColor:backgroudColor
                                        height:height
                                    parentView:parentView
                                         isTop:NO
                                      isBottom:YES];
}


- (instancetype)initWithBackgroudColor:(UIColor *)backgroudColor
                                height:(CGFloat)height
                            parentView:(UIView *)parentView
                                 isTop:(BOOL)isTop
                              isBottom:(BOOL)isBottom{
    
    if (self = [super init]) {
        
        self = [[MNView alloc]init];
        self.backgroundColor = backgroudColor;
        if (!parentView)  return self;
        
        [parentView addSubview:self];
        if (isTop) {
            [self mas_makeConstraints:^(MASConstraintMaker *make) {
                make.left.top.right.mas_equalTo(0);
                make.height.mas_equalTo(height);
            }];
        }
        if (isBottom) {
            [self mas_makeConstraints:^(MASConstraintMaker *make) {
                make.left.bottom.right.mas_equalTo(0);
                make.height.mas_equalTo(height);
            }];
        }
    }
    return self;
}

//getViewH - 屏幕宽度
+ (CGFloat)mn_getViewHeightWithImageWidth:(CGFloat)imageWidth imageHeight:(CGFloat)imageHeight{
    
    CGFloat ratio = imageWidth / (imageHeight * 1.0);
    
    return ScreenW / ratio;
}

//控件宽度，！= 屏幕宽度
+ (CGFloat)mn_getViewHeightWithImageWidth:(CGFloat)imageWidth imageHeight:(CGFloat)imageHeight viewWidth:(CGFloat)viewWidth{
    
    CGFloat ratio = imageWidth / (imageHeight * 1.0);
    
    return viewWidth / ratio;
}


@end
