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
    // Do any additional setup after loading the view, typically from a nib.
}


#pragma mark - loadDatas
- (void)loadDatas{
    
    self.datas = @[@"1",@"2",@"3",@"4",@"5",@"6",@"7",@"8",];
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

@end
