//
//  ViewController.m
//  MVC-Demo
//
//  Created by Lyh on 2018/7/25.
//  Copyright © 2018年 xmhccf. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    self.title = @"RootVC";
}


#pragma mark - loadDatas
- (void)loadDatas{
    
    self.datas = @[@"Demo0 -- 基础展示cell",
                   @"Demo1 -- 创建复杂样式cell",
                   @"Demo2 -- 快速创建输入表格",
                   @"Demo3 -- 表格搜索折叠", ];
}

#pragma mark - setupUI
- (void)setupUI{
    [super setupUI];
    
}

#pragma mark - <UITableViewDelegate>
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    UITableViewCell *cell = [UITableViewCell new];
    cell.textLabel.text = self.datas[indexPath.row];
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    Class cls = NSClassFromString([NSString stringWithFormat:@"Demo%ldViewController",indexPath.row]);
    
    if (cls) {
        [self.navigationController pushViewController:[[cls alloc]init] animated:YES];
    }
}

@end
