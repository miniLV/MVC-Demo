//
//  Demo1ViewController.m
//  MVC-Demo
//
//  Created by 梁宇航 on 2018/7/25.
//  Copyright © 2018年 xmhccf. All rights reserved.
//

#import "Demo1ViewController.h"
#import "LFOrderHomeModel.h"
#import "LFOrderHomeCell.h"
#import "Demo1Datas.h"
@interface Demo1ViewController ()

@end

@implementation Demo1ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

#pragma mark - setupUI
- (void)setupUI{
    
    [super setupUI];
}

#pragma mark - loadDatas
- (void)loadDatas{

    [Demo1Datas fetchDatasSuccessBlock:^(NSArray *array) {
        
        self.datas = array;
        [self.tableView reloadData];
    }];
}

#pragma mark - <UITableViewDelegate>
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    LFOrderHomeModel *model = self.datas[indexPath.row];
    LFOrderHomeCell *cell = [LFOrderHomeCell createCellWithTableView:tableView];
    cell.delegate = self;
    cell.indexPath = indexPath;
    cell.model = model;
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    return 44 + 109 + 15 + 64 + 10;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    MNLog(@"点击了tableView - cell！！ - row = %ld",(long)indexPath.row)
    
}

#pragma mark - tableView编辑模式
-(void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath{
    BOOL q1 = editingStyle == UITableViewCellEditingStyleDelete;
    if (q1)
    {
        
        LFOrderHomeModel *model = self.datas[indexPath.row];
        //发送撤单请求Http
            
//        [self loadDatasIsDelete:YES];
    }
    
}

-(NSString *)tableView:(UITableView *)tableView titleForDeleteConfirmationButtonForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return @"删除";
}
@end
