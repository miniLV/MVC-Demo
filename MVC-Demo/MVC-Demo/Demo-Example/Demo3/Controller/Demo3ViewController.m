//
//  Demo3ViewController.m
//  MVC-Demo
//
//  Created by Lyh on 2018/7/26.
//  Copyright © 2018年 xmhccf. All rights reserved.
//

#import "Demo3ViewController.h"
#import "Demo3Datas.h"
#import "Demo3Cell.h"
#import "Demo3View.h"
#import "Demo3SectionView.h"
@interface Demo3ViewController ()<CarSelectePlanViewDelegate>

@end

@implementation Demo3ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"Demo3";
}

#pragma mark - loadDatas
- (void)loadDatas{
    self.datas = [Demo3Datas localDatas];
    
    [Demo3Datas set_datasWithModel:nil datas:self.datas];
    [self.tableView reloadData];
}

#pragma mark - setupUI
- (void)setupUI{
    [super setupUI];

    [self mn_fixTableViewHeightWithTableView:self.tableView];
    
    //buttomBtn
    [MNButton mn_bottomBtnWithTitle:@"重新核保"
                         titleColor:HZ_EDFFF8Color
                           fontSize:HZ_18FontSize
                    backgroundColor:HZ_24C789Color
                         parentView:self.view
                             height:DefaultBottomTabBarHeight
                         targetName:@selector(p_clickBottomBtn)
                           delegate:self];
}

- (void)p_clickBottomBtn{
    
    MNLog(@"p_clickBottomBtn")
}

#pragma mark - private Delegate
- (void)car_clickSectionBtn:(UIButton *)sender{
    NSInteger section = sender.tag;
    MNCellModel *sectionModel = self.datas[section];
    sectionModel.expand = !sectionModel.expand;
    
    [self.tableView reloadSections:[NSIndexSet indexSetWithIndex:section] withRowAnimation:UITableViewRowAnimationAutomatic];
}

#pragma mark - <UITableViewDelegate>
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    MNCellModel *sectionModel = self.datas[section];
    if (!sectionModel.expand) {
        return 0;
    }
    return [self.datas[section] cellModels].count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    NSArray *cellModels = [self.datas[indexPath.section] cellModels];
    MNCellModel *model = cellModels[indexPath.row];
    
    Demo3Cell *cell = [self p_quickCreateCellWithModel:model
                                                             indexPath:indexPath
                                                             tableView:tableView];
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    NSArray *cellModels = [self.datas[indexPath.section] cellModels];
    MNCellModel *model = cellModels[indexPath.row];
    if (model.type == 1) {
        return 64;
    }
    else if (model.type == 200) {
        return UITableViewAutomaticDimension;
    }
    return DefaultCellHeight;
}

- (CGFloat)tableView:(UITableView *)tableView estimatedHeightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return DefaultCellHeight;
}

- (Demo3Cell *)p_quickCreateCellWithModel:(MNCellModel *)model
                                indexPath:(NSIndexPath *)indexPath
                                tableView:(UITableView *)tableView{
    NSString *typeStr = [NSString stringWithFormat:@"%ld",(long)model.type];
    Demo3Cell *cell = [Demo3Cell createReuseIdentifier:typeStr WithTableView:tableView];
    cell.basicIndexPath = indexPath;
    cell.basicModel = model;
    return cell;
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    
    MNCellModel *sectionModel = self.datas[section];
    
    if (!sectionModel.titleLabel) {
        Demo3View *headerView = [Demo3View headerView];
        [headerView set_headerViewWithModel:nil];
        return headerView;
    }else{
        Demo3SectionView *view = [Demo3SectionView sectionViewWithTitle:sectionModel.titleLabel section:section];
        view.delegate = self;
        view.arrowBtn.selected = sectionModel.expand;
        
        return view;
    }
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    MNCellModel *sectionModel = self.datas[section];
    if (!sectionModel.titleLabel) {
        return 75;
    }
    else if(sectionModel.isSelected) {
        return DefaultCellHeight + 75;
    }
    return DefaultCellHeight;
}

- (UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section {
    UIView *view = [MNView viewWithBackgroudColor:HZ_f2f3f7Color];
    return view;
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section {
    return 10;
}


@end
