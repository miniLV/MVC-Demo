//
//  Demo2ViewController.m
//  MVC-Demo
//
//  Created by Lyh on 2018/7/26.
//  Copyright © 2018年 xmhccf. All rights reserved.
//

#import "Demo2ViewController.h"
#import "Demo2Datas.h"
#import "Demo2Cell.h"
#import "HZSectionView.h"
@interface Demo2ViewController ()
<
LFLabelNormalCellDelegate,
CMAddressDelegate
>
@end

@implementation Demo2ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)baseSetting{
    [super baseSetting];
    self.title = @"Demo2";
}

#pragma mark - loadDatas
- (void)loadDatas{
    
    self.datas = [Demo2Datas localDatas];
    [self.tableView reloadData];
}

#pragma mark - setupUI
- (void)setupUI{
    [super setupUI];

    [self mn_fixTableViewHeightWithTableView:self.tableView];
    
    //bottomBtn
    [MNButton mn_bottomBtnWithTitle:@"下一步"
                         titleColor:HZ_EDFFF8Color
                           fontSize:HZ_18FontSize
                    backgroundColor:HZ_24C789Color
                         parentView:self.view
                             height:DefaultBottomTabBarHeight
                         targetName:@selector(p_clickBottomBtn)
                           delegate:self];
}

- (void)p_clickBottomBtn{
    
    [self.view endEditing:YES];
    
    //编辑结束 - 提交数据(发起网络请求，请求结果回调到 当前控制器)
    [Demo2Datas postDatasWithDatas:self.datas successBlock:^(NSString *string) {
        [MNSVProgressClass mn_showSuccess:@"demo2 - 数据提交成功~"];
        
    } failure:^(UIAlertController *alertC) {
        if (alertC) {
            [self presentViewController:alertC animated:YES completion:nil];
        }
    }];
    
}

#pragma mark - private delegate
- (void)mn_endEditTextField:(UITextField *)sender{
    
    NSInteger section = sender.tag / 100;
    NSInteger row = sender.tag % 100;
    MNCellModel *model = self.datas[section][row];
    model.textFieldValue = sender.text;
}

- (void)mn_changeSwitchBtn:(UISwitch *)sender{
    
    NSInteger section = sender.tag / 100;
    NSInteger row = sender.tag % 100;
    
    self.datas = [Demo2Datas local_changeSection1FromDatas:self.datas];
    
    MNCellModel *model = self.datas[section][row];
    model.expand = sender.on;
    
    //动态改变样式
    [self.tableView reloadSections:[NSIndexSet indexSetWithIndex:2] withRowAnimation:UITableViewAutomaticDimension];
    
}

- (void)endEditAddressTextView:(UITextView *)sender{
    
    NSInteger section = sender.tag / 100;
    NSInteger row = sender.tag % 100;
    MNCellModel *model = self.datas[section][row];
    model.textFieldValue = sender.text;
}

#pragma mark - <UITableViewDelegate>
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    MNCellModel *model = self.datas[indexPath.section][indexPath.row];
    if (model.type == 11) {
        CarAddInfoAddressCell *cell = [CarAddInfoAddressCell createCellWithTableView:tableView];
        cell.basicIndexPath = indexPath;
        cell.basicModel = model;
        cell.delegate = self;
        return cell;
    }else{
        Demo2Cell *cell = [self p_quickCreateCellWithModel:model
                                                 indexPath:indexPath
                                                 tableView:tableView];
        
        return cell;
    }
}

- (Demo2Cell *)p_quickCreateCellWithModel:(MNCellModel *)model
                                indexPath:(NSIndexPath *)indexPath
                                tableView:(UITableView *)tableView{
    NSString *typeStr = [NSString stringWithFormat:@"%ld",(long)model.type];
    Demo2Cell *cell = [Demo2Cell createReuseIdentifier:typeStr WithTableView:tableView];
    cell.basicIndexPath = indexPath;
    cell.basicModel = model;
    cell.mnDelegate = self;
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    MNCellModel *model = self.datas[indexPath.section][indexPath.row];
    if (model.type == 11) {
        return 64;
    }
    return DefaultCellHeight;
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    
    NSArray *titles = @[@"section0", @"section1", @"section2", @"section3",];
    UIView *sectionView = [HZSectionView sectionViewTypeBottomLine:titles[section]];
    return sectionView;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
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
