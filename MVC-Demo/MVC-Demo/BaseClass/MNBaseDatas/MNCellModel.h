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

//是否选中
@property (nonatomic, assign) BOOL isSelected;

//最左侧的icon
@property (nonatomic, copy) NSString *leftIconStr;

//左侧详情label
//@property (nonatomic, copy) NSString *leftDetailLabel;
//
////右侧详情label
//@property (nonatomic, copy) NSString *rightDetailLabel;

//cell的类型
@property (nonatomic, assign) NSInteger type;

@property (nonatomic, copy) NSString *detail;

//右侧 - 选择的是一个图片对象！(图片选择上传的时候)
@property (nonatomic, strong)UIImage *selectedImage;



@end
