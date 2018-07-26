//
//  MYPersonalDatas.m
//  HCCF
//
//  Created by Lyh on 2018/1/30.
//  Copyright © 2018年 xmhccf. All rights reserved.
//

#import "Demo0Datas.h"
#import "Demo0Model.h"
#import "MNFileReadWriteClass.h"

@implementation Demo0Datas

+ (void)fetchDatasSuccessBlock:(MNsuccessBlock)block{
    
    //发起AFN网络请求...假设jsonDatas 是AFN请求成功的回调
    id jsonDatas = [MNFileReadWriteClass loadLocalFileWithFileName:@"personal"];
    
    Demo0Model *model = [Demo0Model yy_modelWithJSON:jsonDatas];
    
    NSArray *result = [self setHttpDatas:model];
    
    block(result);
}

+ (NSArray *)setHttpDatas:(Demo0Model *)dataModel{
    
    NSArray *basicArray = [self getLocalDatas];

    [self setSection0:dataModel section:basicArray[0]];
    [self setSection1:dataModel section:basicArray[1]];
    [self setSection2:dataModel section:basicArray[2]];
    
    return basicArray;
}

+ (void)setSection0:(Demo0Model *)dataModel section:(NSArray *)section{
    
    //1.头像
    MNCellModel *avaterModel = section[0];
    avaterModel.rightValue = dataModel.user.avatar.url;
    
    //2.昵称
    MNCellModel *nameModel = section[1];
    nameModel.rightValue = dataModel.user.nickname;
}

+ (void)setSection1:(Demo0Model *)dataModel section:(NSArray *)section{
    
    //0.真实姓名
    MNCellModel *nameModel = section[0];
    nameModel.rightValue = dataModel.user.id_info.realname;
    
    //1.性别
    MNCellModel *sexModel = section[1];
    sexModel.selectedValue = dataModel.user.sex.name;
    
    //2.手机号码
    MNCellModel *mobileModel = section[2];
    mobileModel.rightValue = dataModel.user.mobile;
    
    //3.实名认证状态
    MNCellModel *approvalModel = section[3];
    approvalModel.rightValue = dataModel.approval_status.name;

    //4.专业认证
    MNCellModel *professionalModel = section[4];
    professionalModel.rightValue = dataModel.user.certificate_info.approval_status.name;
    if(!dataModel.user.certificate_info){
        professionalModel.rightValue = @"未认证";
    }
    
    //5.绑定银行卡
    MNCellModel *banksModel = section[5];
    banksModel.rightValue = dataModel.user.bound_bankcard_num;
}

+ (void)setSection2:(Demo0Model *)dataModel section:(NSArray *)section{
    
    //1.电子邮箱
    MNCellModel *emailModel = section[0];
    emailModel.rightValue = dataModel.user.email;
    
    //2.所在省市区
    MNCellModel *areaModel = section[1];
    areaModel.selectedCode = dataModel.user.areacode;
    
    //获取详细地区
//    areaModel.selectedValue = [HZJGModel getAreaNameFromGaodeAdcode:dataModel.user.areacode];
    
    //3.详细地址
    MNCellModel *detailAddressModel = section[2];
    detailAddressModel.rightValue = dataModel.user.address;
}


#pragma mark - initDatas
+ (NSArray *)getLocalDatas{
    
    NSArray *section0 = [self getSection0];
    
    NSArray *section1 = [self getSection1];
    
    NSArray *section2 = [self getSection2];
    
    return @[section0, section1, section2];
}

+ (NSArray *)getSection0{
    
    NSArray *titles = @[@"我的头像", @"昵称",];
    NSArray *types =  @[@"52", @"50",];
    NSArray *placeholders = @[@"", @"请填写昵称",];
    NSMutableArray *arrayM = [NSMutableArray arrayWithCapacity:titles.count];
    for (int i = 0;  i < titles.count; i ++) {
        
        MNCellModel *model = [[MNCellModel alloc]init];
        model.titleLabel = titles[i];
        model.type = [types[i] integerValue];
        model.placeholder = placeholders[i];
        [arrayM addObject:model];
    }
    return arrayM.copy;
}


+ (NSArray *)getSection1{
    
    NSArray *titles = @[@"真实姓名", @"性别", @"手机号码", @"实名认证", @"专业认证", @"绑定银行卡"];
    NSArray *types =  @[@"3", @"4", @"0", @"1", @"2", @"5",];
    NSMutableArray *arrayM = [NSMutableArray arrayWithCapacity:titles.count];
    for (int i = 0;  i < titles.count; i ++) {
        
        MNCellModel *model = [[MNCellModel alloc]init];
        model.titleLabel = titles[i];
        model.type = [types[i] integerValue];
        
        if(model.type == 4){
//            model.rightList = [HZLocalSaveDatas getGenderNameList];
        }
        
        [arrayM addObject:model];
    }
    return arrayM.copy;
}


+ (NSArray *)getSection2{
    NSArray *titles = @[@"电子邮箱", @"所在省市区", @"详细地址"];
    NSArray *types =  @[@"50", @"51", @"50",];
    NSArray *placeholders = @[@"请填写电子邮箱", @"请选择所在省市区", @"请填写详细地址"];
    NSMutableArray *arrayM = [NSMutableArray arrayWithCapacity:titles.count];
    for (int i = 0;  i < titles.count; i ++) {

        MNCellModel *model = [[MNCellModel alloc]init];
        model.titleLabel = titles[i];
        model.type = [types[i] integerValue];
        model.placeholder = placeholders[i];
        [arrayM addObject:model];
    }
    return arrayM.copy;
}


@end
