//
//  Demo3ViewController.m
//  MVC-Demo
//
//  Created by Lyh on 2018/7/26.
//  Copyright © 2018年 xmhccf. All rights reserved.
//

#import "Demo3ViewController.h"
#import "CarCheckDatas.h"
#import "QuoDetailCell.h"
#import "QuoDetailView.h"
#import "CarSelectePlanView.h"
@interface Demo3ViewController ()<CarSelectePlanViewDelegate>

@end

@implementation Demo3ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

}

#pragma mark - loadDatas
- (void)loadDatas{
    self.datas = [CarCheckDatas localDatas];
    
    [CarCheckDatas set_datasWithModel:nil datas:self.datas];
    [self.tableView reloadData];
}

#pragma mark - setupUI
- (void)setupUI{
    [super setupUI];

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
    
    QuoDetailCell_TypeSuccess *cell = [self p_quickCreateCellWithModel:model
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
- (QuoDetailCell_TypeSuccess *)p_quickCreateCellWithModel:(MNCellModel *)model
                                                indexPath:(NSIndexPath *)indexPath
                                                tableView:(UITableView *)tableView{
    NSString *typeStr = [NSString stringWithFormat:@"%ld",(long)model.type];
    QuoDetailCell_TypeSuccess *cell = [QuoDetailCell_TypeSuccess createReuseIdentifier:typeStr WithTableView:tableView];
    cell.basicIndexPath = indexPath;
    cell.basicModel = model;
    return cell;
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    
    MNCellModel *sectionModel = self.datas[section];
    
    if (!sectionModel.titleLabel) {
        QuoDetailViewTypeSuccess *headerView = [QuoDetailViewTypeSuccess headerView];
        [headerView set_headerViewWithModel:nil];
        return headerView;
    }else{
        CarSelectePlanView *view = [CarSelectePlanView sectionViewWithTitle:sectionModel.titleLabel section:section];
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
