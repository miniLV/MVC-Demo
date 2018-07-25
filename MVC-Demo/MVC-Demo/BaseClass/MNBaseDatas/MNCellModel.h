//
//  LFbasicCellModel.h
//  HCCF
//
//  Created by Lyh on 2017/11/22.
//  Copyright © 2017年 xmhccf. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MNCellModel : NSObject <NSCoding>

///左侧label
@property (nonatomic, copy) NSString *titleLabel;

///右侧value - 右侧显示的值
@property (nonatomic, copy) NSString *rightValue;

///显示的imageStr
@property (nonatomic, copy) NSString *showImageStr;

///右侧数值列表 - 是一个下拉列表
@property (nonatomic, copy) NSArray *rightList;

///收缩展开cell - 点击展开的子cell
@property (nonatomic, copy) NSArray *cellModels;


/**
 省市区 - 单级联动 - tableView数据源
 1.只显示单层数据
 2.第一层是省，点击cell发送post请求，请求市数据，以此类推得到区
 3.这里的tableView的省份数据源，就应该是完整的数据源，才能显示‘省份名称’的同事，在点击的同时获取当前的省份的url，从而才能发送http请求，获取城市数据
 */
@property (nonatomic, copy) NSArray *provinceDatas;

///下拉列表 - 原始数据模型
@property (nonatomic, copy) NSArray *modelDatas;

///省市区 - 三级联动的数据！
@property (nonatomic, copy) NSArray *provincesList;

//选择的值
@property (nonatomic, copy) NSString *selectedValue;

//选择的值的 - code (选择的值，但是要传的是编码！)
@property (nonatomic, copy) NSString *selectedCode;

///跳转的值
@property (nonatomic, copy) NSString *nextUrl;

//占位文字
@property (nonatomic, copy) NSString *placeholder;

//textField的值
@property (nonatomic, copy) NSString *textFieldValue;

///中间label
@property (nonatomic, copy) NSString *contentLabel;

///保险 - 保障责任的类型(第一行是长大疾病保障金，第二行是次年的重大疾病保障金...)
@property (nonatomic ,assign)NSInteger hiddenRow;

//是否展开(switch)
@property (nonatomic, assign) BOOL expand;

//是否选中(中间圆圆的按钮)
@property (nonatomic, assign) BOOL isSelected;

//最左侧的icon
@property (nonatomic, copy) NSString *leftIconStr;

//左侧详情label
@property (nonatomic, copy) NSString *leftDetailLabel;

//右侧详情label
@property (nonatomic, copy) NSString *rightDetailLabel;

/**
 type:类型
    0.左右都是普通label
    1.左边是红色label，右边是灰色label - 价格 && 销量  
    2.左边是label，右边是btn - 点击展开下拉列表选取 ==> 年限选取等等
    3.左边是label，右边是btn - 点开展现产品详细说明 ==> 重大疾病保险金-detail
    4.左边是label, 右边是image - PDF展示
    5.只有一个label - 灰色内容详情 - 重大疾病保险金-detail
    6.左边label, 中间只有一个textField
    7.左边label，中间label，中间label显示灰色
    8.左边label, 中间label(灰色)，右边按钮 - 选择日期
    9.左边label, 中间label(灰色)，右边按钮 - 点击展开下拉列表选取 ==> 年限选取等等，与2的区别，中间有灰色label
    10.左边labl， 省市区三级联动
    11.只有一个textField - 详细地址
    12.左边label, 中间label(黑色)，右边按钮 - 点击展开下拉列表选取 ==> 年限选取等等，与9的区别，label黑色
    13.左边label，中间一个下拉按钮(选择车牌省份名称)，中间一个textField
    14.左边label，中间label，右边switch
    15.左边label，中间button，右边switch
    16.左边label，中间button，右边list
    17.左边label，中间label，右边label
    18.左边label，           右边swich

    20.左边label,中间特殊按钮2，右边switch //中间例如-新增客户
 
    21.左边label，右边红色label - 金额
    30.左边label，中间普通的textField！
    31.左边label，中间身份证textField！ - 特殊键盘样式
    32.左边是label，中间是数字键盘 - 手机号之类的
    33.左边是label，中间是邮箱键盘
 
    40.最左侧是icon，中间黑色label，右侧箭头
    41.最左侧是icon，中间黑色label，右侧箭头 + 右侧黑色详情label
    42.最左侧是icon，中间黑色label，右侧箭头 + 右侧绿色详情label
 
    50.左侧label，右侧textField
    51.左侧label，右侧 > 箭头 - 列表选择
    52.左侧label，右侧image + “>”箭头
 
    61.证件照片-上方一个label，下方两张大照片
 
    99.我已认真阅读并同意<支付授权声明>
    100. 法定受益人 - 我已认真阅读<投保声明>...
 
    200. 表格展示
 */
@property (nonatomic, assign) NSInteger type;

@property (nonatomic, copy) NSString *detail;

//右侧 - 选择的是一个图片对象！(图片选择上传的时候)
@property (nonatomic, strong)UIImage *selectedImage;

//产品详情选择列表 - 数值list
@property (nonatomic, copy) NSArray *nameList;
//产品详情选择列表 - 单位list
@property (nonatomic, copy) NSArray *unitList;

+ (void)fetchDatas;

@end
