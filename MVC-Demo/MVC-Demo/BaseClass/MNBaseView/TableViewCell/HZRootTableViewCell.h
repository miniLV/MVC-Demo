//
//  HZRootTableViewCell.h
//  HCCF
//
//  Created by Lyh on 2017/11/23.
//  Copyright © 2017年 xmhccf. All rights reserved.
//

#import <UIKit/UIKit.h>
@class MNCellModel;
@interface HZRootTableViewCell : UITableViewCell

@property (nonatomic, strong) MNCellModel * _Nullable basicModel;

@property (nonatomic, strong) NSIndexPath * _Nullable basicIndexPath;

+ (instancetype _Nullable )loadCell;
+ (NSString *_Nullable)getID;

///快速创建自定义cell
+ (instancetype _Nullable )createCellWithTableView:(UITableView *_Nullable)tableView;

///带reuseIdentifier的tableViewCell
+ (instancetype _Nullable )createReuseIdentifier:(NSString *_Nullable)reuseIdentifier
                                   WithTableView:(UITableView *_Nullable)tableView;

///详细的tableViewCell
+ (instancetype _Nullable )createCellWithStyle:(UITableViewCellStyle)style
                               reuseIdentifier:(NSString *_Nullable)reuseIdentifier
                                 WithTableView:(UITableView *_Nullable)tableView;

//子类reWrite - 设置控件布局
- (void)createControls;
- (void)setupControls;

@end
