//
//  MNBaseViewController.m
//  HCCF
//
//  Created by Lyh on 2018/2/1.
//  Copyright © 2018年 xmhccf. All rights reserved.
//

#import "MNBaseViewController.h"
#import "MJRefresh.h"
#import "SVProgressHUD.h"
#import "HZBasicCustonTableView.h"

@interface MNBaseViewController ()
<
UITableViewDelegate,UITableViewDataSource
>


@end

@implementation MNBaseViewController



- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self baseSetting];
    
    /*
     当translucent = YES，controller中self.view的原点是从导航栏左上角开始计算
     当translucent = NO，controller中self.view的原点是从导航栏左下角开始计算
     */
    self.navigationController.navigationBar.translucent = YES;
    
    [self setupUI];

    [self loadDatas];
    
    if (!_closeNotis) {
        [self receiveNotis];
    }

    if (@available(iOS 11.0, *)) {
        _tableView.contentInsetAdjustmentBehavior = UIScrollViewContentInsetAdjustmentNever;
    } else {
        self.automaticallyAdjustsScrollViewInsets = NO;
    }

}

- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    
    if ([SVProgressHUD isVisible]) {
        [SVProgressHUD dismiss];
    }
}

- (void)viewWillDisappear:(BOOL)animated{
    [super viewWillDisappear:animated];
    if ([SVProgressHUD isVisible]) {
        [SVProgressHUD dismiss];
    }
    
    //取消当前控制器的网络请求
//    [YHAFNHelper mn_cancelRequet];
    
}

#pragma mark - 初始化tableView


- (void)setupUI{
    
    //子类继承一定要记得super！不然tableView没了！！
    [self createTableView];
    
    //上拉加载更多
    [self p_addMJRefshControls];
}

- (void)createTableView {

    HZBasicCustonTableView *tableView = [[HZBasicCustonTableView alloc]initWithFrame:Frame(0, DefaultNaviHeight, ScreenW, ScreenH - DefaultNaviHeight) style:UITableViewStyleGrouped];

    tableView.backgroundColor = [UIColor whiteColor];
    tableView.delegate = self;
    tableView.dataSource = self;
    tableView.estimatedRowHeight = 0;
    tableView.estimatedSectionFooterHeight = 0;
    tableView.estimatedSectionHeaderHeight = 0;
    [self.view addSubview:tableView];
    _tableView = tableView;
  
}

//UITableViewStylePlain 类型tableView
- (void)createTableViewStylePlain{
    
    HZBasicCustonTableView *tableView = [[HZBasicCustonTableView alloc]initWithFrame:Frame(0, DefaultNaviHeight, ScreenW, ScreenH - DefaultNaviHeight) style:UITableViewStylePlain];
    tableView.backgroundColor = [UIColor whiteColor];
    tableView.delegate = self;
    tableView.dataSource = self;
    tableView.estimatedRowHeight = 0;
    tableView.estimatedSectionFooterHeight = 0;
    tableView.estimatedSectionHeaderHeight = 0;
    [self.view addSubview:tableView];
    _tableView = tableView;
    
    [self p_addMJRefshControls];
}

- (void)p_addMJRefshControls{
    //上拉加载更多
    _tableView.mj_footer = [MJRefreshBackNormalFooter footerWithRefreshingTarget:self refreshingAction:@selector(loadMoreDatas)];
    _tableView.mj_footer.hidden = YES;
    
    //下拉刷新
    _tableView.mj_header = [MJRefreshNormalHeader headerWithRefreshingTarget:self refreshingAction:@selector(refreshData)];
    _tableView.mj_header.hidden = YES;
}



- (void)mn_fixTableViewHeightWithTableView:(UITableView *)tableView{
    tableView.frame = Frame(0, DefaultNaviHeight, ScreenW, ScreenH - DefaultNaviHeight - DefaultBottomTabBarHeight);
}

#pragma mark - loadDatas
- (void)loadDatas{
    
    
}

- (void)loadMoreDatas{
    
    [_tableView.mj_footer endRefreshingWithNoMoreData];
}

- (void)refreshData{
    
}

- (void)baseSetting{
    self.view.backgroundColor = [UIColor whiteColor];
}

- (void)receiveNotis{
    
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 0;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    return [UITableViewCell new];
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return DefaultCellHeight;
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    return nil;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    return CGFLOAT_MIN;
}

- (UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section {
    return nil;
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section {
    return CGFLOAT_MIN;
}



- (UIStatusBarStyle)preferredStatusBarStyle {
    return UIStatusBarStyleLightContent;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
}

@end


/**没有section的tableVIew**/
@implementation MNBaseControllerTypeNoSection

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return _datas.count;
}

@end


/**有section的tableVIew**/
@implementation MNBaseControllerTypeHadSection

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{

    return _datas.count;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return [_datas[section] count];
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    
    UIView *view = [[UIView alloc]init];
    view.backgroundColor = [UIColor lightGrayColor];
    return view;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    return 10;
}


- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section {
    return CGFLOAT_MIN;
}


@end
