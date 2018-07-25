//
//  MNBaseViewController.h
//  HCCF
//
//  Created by Lyh on 2018/2/1.
//  Copyright © 2018年 xmhccf. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MNBaseViewController : UIViewController

@property (nonatomic, weak)UITableView *tableView;

@property (nonatomic, copy)NSArray *datas;

- (void)baseSetting;

- (void)setupUI;

- (void)loadDatas;

- (void)receiveNotis;

//下拉加载更多
- (void)loadMoreDatas;

//上拉刷新
- (void)refreshData;

///UITableViewStyleGrouped 类型的tableView
- (void)createTableView;

///TableViewStylePlain 类型的tableView
- (void)createTableViewStylePlain;

/**有需要为默认tableView添加常用占位视图的再自己写这个方法，这里先不打开了*/

////当前控制器 - 不需要占位图片
//- (void)mn_hiddenEmptyView;
//
////网络请求结束 - 展示占位图片
//- (void)mn_fetchDatasShowEmptyView;

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath;

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath;

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath;

- (void)mn_fixTableViewHeightWithTableView:(UITableView *)tableView;

@end

/*数据结构是 - @[],没有section的tableVIew*/
@interface MNBaseControllerTypeNoSection : MNBaseViewController

@end

/*数据结构是 - @[@[]],有section的tableVIew*/
@interface MNBaseControllerTypeHadSection : MNBaseViewController

@end
