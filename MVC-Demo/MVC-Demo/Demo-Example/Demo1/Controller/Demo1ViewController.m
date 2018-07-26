//
//  Demo1ViewController.m
//  MVC-Demo
//
//  Created by 梁宇航 on 2018/7/25.
//  Copyright © 2018年 xmhccf. All rights reserved.
//

#import "Demo1ViewController.h"
#import "Demo1Model.h"
#import "Demo1Cell.h"
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
    
    Demo1Model *model = self.datas[indexPath.row];
    Demo1Cell *cell = [Demo1Cell createCellWithTableView:tableView];
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
    
    if (q1){
        //发送撤单请求Http,在刷新tableVieew

        Demo1Model *model = self.datas[indexPath.row];
        NSMutableArray *tempArray = self.datas.mutableCopy;
        [tempArray removeObject:model];
        self.datas = tempArray.copy;
        [self.tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewAutomaticDimension];
    }
    
}

-(NSString *)tableView:(UITableView *)tableView titleForDeleteConfirmationButtonForRowAtIndexPath:(NSIndexPath *)indexPath{
    return @"删除";
}
@end
