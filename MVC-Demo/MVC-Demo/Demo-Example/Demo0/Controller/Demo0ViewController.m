//
//  Demo0ViewController.m
//  MVC-Demo
//
//  Created by 梁宇航 on 2018/7/25.
//  Copyright © 2018年 xmhccf. All rights reserved.
//

#import "Demo0ViewController.h"
#import "MYPersonalCell.h"
#import "MYPersonalDatas.h"
@interface Demo0ViewController ()

@end

@implementation Demo0ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"Demo0VC";
}

#pragma mark - loadDatas
- (void)loadDatas{
    
    [MYPersonalDatas fetchDatasSuccessBlock:^(NSArray *array) {
        self.datas = array;
        [self.tableView reloadData];
    }];
    
}

#pragma mark - setupUI
- (void)setupUI{
    [super setupUI];
}

#pragma mark - <tableViewDelegate>
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    MNCellModel *model = self.datas[indexPath.section][indexPath.row];
    if(model.type == 52){
        MYPersonalAvaterCell *cell = [MYPersonalAvaterCell createCellWithTableView:tableView];
        cell.basicModel = model;
        return cell;
    }
    MYPersonalCell *cell = [self quickCreateCellWithType:model.type
                                                   model:model
                                               indexPath:indexPath
                                               tableView:tableView];
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    MNCellModel *model = self.datas[indexPath.section][indexPath.row];
    if (model.type == 52) {
        return 75;
    }
    return DefaultCellHeight;
}

- (MYPersonalCell *)quickCreateCellWithType:(NSInteger)type
                                      model:(MNCellModel *)model
                                  indexPath:(NSIndexPath *)indexPath
                                  tableView:(UITableView *)tableView{
    MYPersonalCell *cell = [MYPersonalCell createReuseIdentifier:[NSString stringWithFormat:@"%ld",(long)type] WithTableView:tableView];
    cell.indexpath = indexPath;
    cell.basicModel = model;
    return cell;
}

@end
