 //
//  HZRootTableViewCell.m
//  HCCF
//
//  Created by Lyh on 2017/11/23.
//  Copyright © 2017年 xmhccf. All rights reserved.
//

#import "HZRootTableViewCell.h"

@implementation HZRootTableViewCell

+ (instancetype)loadCell{
    
    return [[NSBundle mainBundle]loadNibNamed:NSStringFromClass([self class]) owner:nil options:nil].lastObject;
}

+ (NSString *)getID{

    return NSStringFromClass([self class]);
    
}

+ (instancetype)createCellWithTableView:(UITableView *_Nullable)tableView
{
    return [self createCellWithStyle:UITableViewCellStyleSubtitle
                     reuseIdentifier:[self getID]
                       WithTableView:tableView];
}

+ (instancetype _Nullable )createReuseIdentifier:(NSString *)reuseIdentifier
                                   WithTableView:(UITableView *_Nullable)tableView{
    
        return [self createCellWithStyle:UITableViewCellStyleSubtitle
                         reuseIdentifier: reuseIdentifier
                           WithTableView:tableView];
}




+ (instancetype)createCellWithStyle:(UITableViewCellStyle)style
                    reuseIdentifier:(NSString *)reuseIdentifier
                      WithTableView:(UITableView *_Nullable)tableView
{
    
    HZRootTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:reuseIdentifier];
    
    if (!cell) {

        cell = [[self alloc]initWithStyle:style
                       reuseIdentifier:reuseIdentifier];
    }
    return cell;
}

- (instancetype)initWithStyle:(UITableViewCellStyle)style
              reuseIdentifier:(NSString *)reuseIdentifier{
    
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier])
    {

        self.selectionStyle = UITableViewCellSelectionStyleNone;

        //1.创建控件
        [self createControls];
        
        //2.设置样式
        [self setupControls];
    }
    return self;
}

- (void)createControls{
    
}

- (void)setupControls{
    
}


@end
