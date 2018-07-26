//
//  CarAddInfoDatas.m
//  HCCF
//
//  Created by Lyh on 2018/4/12.
//  Copyright © 2018年 xmhccf. All rights reserved.
//

#import "Demo2Datas.h"


@implementation Demo2Datas

+ (NSArray *)localDatas{
    
    NSArray *section0 = [self p_section0];
    NSArray *section1 = [self p_section1];
    NSArray *section2 = [self p_section2];
    NSArray *section3 = [self p_section3];
    
    return @[section0,section1,section2,section3];
}

+ (NSArray *)p_section0{
    NSArray *titles = @[@"车主姓名:",
                        @"证件类型:",
                        @"证件号码:"];
    NSArray *types = @[@"6",@"9",@"31",];
    NSArray *placeholders = @[@"请输入车主姓名",@"请选择证件类型",@"请输入证件号码"];
    
    NSMutableArray *arrayM = [NSMutableArray arrayWithCapacity:titles.count];
    for (int i = 0 ; i < titles.count; i++) {
        MNCellModel *model = [[MNCellModel alloc]init];
        model.titleLabel = titles[i];
        model.placeholder = placeholders[i];
        model.type = [types[i] integerValue];
        
        if (model.type == 9) {
//            model.rightList = [HZLocalSaveDatas getCardTypeNameList];
            model.selectedValue = @"测试工作证~";
        }
        [arrayM addObject:model];
    }
    return arrayM;
    
}

+ (NSArray *)p_section1{
    NSArray *titles = @[@"被保人姓名:",
                        @"证件类型:",
                        @"证件号码:",
                        @"手机号码:",
                        @"电子邮箱:"];
    NSArray *types = @[@"6",@"9",@"31",@"6",@"6",];
    NSArray *placeholders = @[@"请输入被保人姓名",@"请选择证件类型",@"请输入证件号码",@"请输入手机号码",@"请输入邮箱"];
    
    NSMutableArray *arrayM = [NSMutableArray arrayWithCapacity:titles.count];
    for (int i = 0 ; i < titles.count; i++) {
        MNCellModel *model = [[MNCellModel alloc]init];
        model.titleLabel = titles[i];
        model.placeholder = placeholders[i];
        model.type = [types[i] integerValue];
        if (model.type == 9) {
//            model.rightList = [HZLocalSaveDatas getCardTypeNameList];
            model.selectedValue = @"测试工作证~";
        }
        [arrayM addObject:model];
    }
    return arrayM;
}

+ (NSArray *)p_section2{
    
    MNCellModel *model = [[MNCellModel alloc]init];
    model.titleLabel = @"投保人与被保人一致";
    model.expand = YES;
    model.type = 18;
    return @[model];
}


+ (NSArray *)p_section3{
    NSArray *titles = @[@"收件人姓名:",
                        @"手机号码:",
                        @"所在省市区:",
                        @"详细地址:"];
    NSArray *types = @[@"6",@"6",@"10",@"11",];
    NSArray *placeholders = @[@"请输入收件人姓名",@"请输入手机号",@"请选择省市区",@"请输入详细地址(至少6个汉字)"];
    
    NSMutableArray *arrayM = [NSMutableArray arrayWithCapacity:titles.count];
    for (int i = 0 ; i < titles.count; i++) {
        MNCellModel *model = [[MNCellModel alloc]init];
        model.titleLabel = titles[i];
        model.placeholder = placeholders[i];
        model.type = [types[i] integerValue];
        if (model.type == 10) {
//            model.rightList = [HZLocalSaveDatas getCardTypeNameList];
            model.selectedValue = @"小蠢驴的地址~";
        }
        [arrayM addObject:model];
    }
    return arrayM;
    
}

+ (NSArray *)local_changeSection1FromDatas:(NSArray *)datas{
    
    NSInteger section2Count = [datas[2] count];
    if (section2Count == 1) {
        
        //需要insert
        return [self local_inserSection2WithDatas:datas];
    }
    else if (section2Count == 6){
        return [self local_deleteSection2WithDatas:datas];
    }
    return datas;
}

+ (NSArray *)local_inserSection2WithDatas:(NSArray *)datas{
    
    //要insert的列表
    NSArray *inserList = [self p_changeSection2];
    
    NSMutableArray *arrayM = datas.mutableCopy;
    
    //插入列表
    NSMutableArray *section2 = [arrayM[2] mutableCopy];
    [section2 addObjectsFromArray:inserList];
    [arrayM replaceObjectAtIndex:2 withObject:section2];
    
    return arrayM.copy;
}

+ (NSArray *)local_deleteSection2WithDatas:(NSArray *)datas{
    
    NSMutableArray *arrayM = datas.mutableCopy;
    MNCellModel *model = [arrayM[2] firstObject];
    NSArray *newSection2 = @[model];
    [arrayM replaceObjectAtIndex:2 withObject:newSection2];
    return arrayM.copy;
}

+ (NSArray *)p_changeSection2{
    
    NSArray *basicSection1 = [self p_section1];
    MNCellModel *model = basicSection1[0];
    model.titleLabel = @"投保人姓名:";
    model.placeholder = @"请输入投保人姓名";
    
    return basicSection1;
}


+ (void)postDatasWithDatas:(NSArray *)datas successBlock:(MNsuccessStringBlock)block failure:(MNfailureAlertShowBlock)failure{
    
    NSString *quoteset = @"";
    NSDictionary *dict = [self p_getParametersWithDatas:datas quoteset:quoteset];
    
    if(dict){
        
        //发送网络请求
        BOOL requestSucess = YES;
        if (requestSucess) {
            
            //success 等价于 AFN网络请求成功，在sucees的 {block} 中
            block(@"test");
            
        }else{
            
            //alert弹框提示,bugly收集错误信息
        }
    }
}

+ (NSDictionary *)p_getParametersWithDatas:(NSArray *)datas quoteset:(NSString *)quoteset{
    
    quoteset = quoteset ? : @"";
    
    /********车主信息***********/
    //车主姓名
    MNCellModel *ownerNameModel = datas[0][0];
    NSString *ownerName = ownerNameModel.textFieldValue;
    if ([MNSVProgressClass isValueNilWithSVTips:@"请输入车主姓名" key:ownerName]) {
        return nil;
    }
    
    //证件类型
    MNCellModel *ownerTypeModel = datas[0][1];
    NSString *owner_cu_id_type = ownerTypeModel.selectedValue;
    
    //车主证件号码
    MNCellModel *ownerIDCardModel = datas[0][2];
    NSString *owner_cu_id_num = ownerIDCardModel.textFieldValue;
    BOOL owner_q1 = [owner_cu_id_type isEqualToString:@"1"];
    BOOL owner_q2 = ![MNCheakTools checkIdentityCard:owner_cu_id_num];
    if ([MNSVProgressClass isValueNilWithSVTips:@"请输入车主证件号码" key:owner_cu_id_num]) {
        return nil;
    }
    else if (owner_q1 && owner_q2){
        [MNSVProgressClass showNormalTitle:@"请输入车主正确的证件号码"];
        return nil;
    }
    
    /********被保人信息***********/
    //被保人姓名
    MNCellModel *insuredNameModel = datas[1][0];
    NSString *insuredName = insuredNameModel.textFieldValue;
    if ([MNSVProgressClass isValueNilWithSVTips:@"请输入被保人姓名" key:insuredName]) {
        return nil;
    }
    
    //证件类型
    MNCellModel *insuredTypeModel = datas[1][1];
    NSString *insured_cu_id_type = insuredTypeModel.selectedValue;
    
    //被保人证件号码
    MNCellModel *insuredIDCardModel = datas[1][2];
    NSString *insured_cu_id_num = insuredIDCardModel.textFieldValue;
    BOOL insured_q1 = [insured_cu_id_type isEqualToString:@"1"];
    BOOL insured_q2 = ![MNCheakTools checkIdentityCard:insured_cu_id_num];
    if ([MNSVProgressClass isValueNilWithSVTips:@"请输入被保人证件号码" key:insured_cu_id_num]) {
        return nil;
    }
    else if (insured_q1 && insured_q2){
        [MNSVProgressClass showNormalTitle:@"请输入正确的被保人证件号码"];
        return nil;
    }
    
    //被保人手机号码
    MNCellModel *insuredMobileModel = datas[1][3];
    NSString *insured_mobile = insuredMobileModel.textFieldValue;
    if ([MNSVProgressClass isValueNilWithSVTips:@"请输入被保人手机号码" key:insured_mobile]) {
        return nil;
    }
    else if (![MNCheakTools checkTelNumber:insured_mobile]){
        [MNSVProgressClass showNormalTitle:@"请输入正确的被保人手机号码"];
        return nil;
    }
    
    //被保人电子邮箱
    MNCellModel *insuredEmailModel = datas[1][4];
    NSString *insured_email = insuredEmailModel.textFieldValue ? : @"";
    if ([MNSVProgressClass isValueNilWithSVTips:@"请输入被保人电子邮箱" key:insured_email]) {
        return nil;
    }
    else if (![MNCheakTools checkEmailAdress:insured_email]){
        [MNSVProgressClass showNormalTitle:@"请输入正确的被保人电子邮箱"];
        return nil;
    }
    
    /********投保人信息***********/
    MNCellModel *applicantModel = datas[2][0];
    NSString *applicant_name = nil;
    NSString *applicant_cu_id_type = nil;
    NSString *applicant_cu_id_num = nil;
    NSString *applicant_mobile = nil;
    NSString *applicant_email = nil;
    if (applicantModel.expand) {
        //说明被保人和投保人一致
        applicant_name = insuredName;
        applicant_cu_id_type = insured_cu_id_type;
        applicant_cu_id_num = insured_cu_id_num;
        applicant_mobile = insured_mobile;
        applicant_email = insured_email;
    }else{
        //投保人姓名
        MNCellModel *applicantNameModel = datas[2][1];
        applicant_name = applicantNameModel.textFieldValue;
        if ([MNSVProgressClass isValueNilWithSVTips:@"请输入投保人姓名" key:applicant_name]) {
            return nil;
        }
        
        //证件类型
        MNCellModel *applicantTypeModel = datas[2][2];
        applicant_cu_id_type = applicantTypeModel.selectedValue;
        
        //投保人证件号码
        MNCellModel *applicantIDCardModel = datas[2][3];
        applicant_cu_id_num = applicantIDCardModel.textFieldValue;
        BOOL applicant_q1 = [applicant_cu_id_type isEqualToString:@"1"];
        BOOL applicant_q2 = ![MNCheakTools checkIdentityCard:applicant_cu_id_num];
        
        if ([MNSVProgressClass isValueNilWithSVTips:@"请输入投保人证件号码" key:applicant_cu_id_num]) {
            return nil;
        }
        else if (applicant_q1 && applicant_q2){
            [MNSVProgressClass showNormalTitle:@"请输入正确的投保人证件号码"];
            return nil;
        }
        
        //投保人手机号码
        MNCellModel *applicantMobileModel = datas[2][4];
        applicant_mobile = applicantMobileModel.textFieldValue;
        if ([MNSVProgressClass isValueNilWithSVTips:@"请输入投保人手机号码" key:applicant_mobile]) {
            return nil;
        }
        else if (![MNCheakTools checkTelNumber:applicant_mobile]){
            [MNSVProgressClass showNormalTitle:@"请输入正确的投保人手机号码"];
            return nil;
        }
        
        //投保人电子邮箱
        MNCellModel *applicantEmailModel = datas[2][5];
        applicant_email = applicantEmailModel.textFieldValue;
        if ([MNSVProgressClass isValueNilWithSVTips:@"请输入投保人电子邮箱" key:applicant_email]) {
            return nil;
        }
        else if (![MNCheakTools checkEmailAdress:applicant_email]){
            [MNSVProgressClass showNormalTitle:@"请输入正确的投保人电子邮箱"];
            return nil;
        }
    }
    
    /*********保单配送信息************/
    
    //收件人姓名
    MNCellModel *addressNameModel = datas[3][0];
    NSString *address_name = addressNameModel.textFieldValue;
    if ([MNSVProgressClass isValueNilWithSVTips:@"请输入收件人姓名" key:address_name]) {
        return nil;
    }
    
    //收件人手机
    MNCellModel *addressMobileModel = datas[3][1];
    NSString *address_mobile = addressMobileModel.textFieldValue;
    if ([MNSVProgressClass isValueNilWithSVTips:@"请输入收件人手机号码" key:address_mobile]) {
        return nil;
    }
    else if (![MNCheakTools checkTelNumber:address_mobile]){
        [MNSVProgressClass showNormalTitle:@"请输入正确的收件人手机号码"];
        return nil;
    }
    
    //所在地区
    MNCellModel *areaModel = datas[3][2];
    NSString *areaStr = areaModel.selectedValue;
    if ([MNSVProgressClass isValueNilWithSVTips:@"请选择所在省市区" key:areaStr]) {
        return nil;
    }
    
    //详细地址
    MNCellModel *addressModel = datas[3][3];
    NSString *address_address = [areaStr stringByAppendingString:addressModel.textFieldValue];
    if ([MNSVProgressClass isValueNilWithSVTips:@"请输入收件人详细地址" key:address_address]) {
        return nil;
    }
    
    NSDictionary *dict = @{
                           @"test_quoteset":quoteset,
                           @"test_owner":@{
                                   @"test_name": ownerName,
                                   @"test_cu_id_type": owner_cu_id_type,
                                   @"test_cu_id_num": owner_cu_id_num
                                   },
                           @"test_insured":@{
                                   @"test_name": insuredName,
                                   @"test_mobile": insured_mobile,
                                   @"test_email": insured_email,
                                   @"test_cu_id_type": insured_cu_id_type,
                                   @"test_cu_id_num": insured_cu_id_num
                                   },
                           @"test_applicant":@{
                                   @"test_name": applicant_name,
                                   @"test_mobile": applicant_mobile,
                                   @"test_email": applicant_email,
                                   @"test_cu_id_type": applicant_cu_id_type,
                                   @"test_cu_id_num": applicant_cu_id_num
                                   },
                           @"test_address": @{
                                   @"test_name": address_name,
                                   @"test_mobile": address_mobile,
                                   @"test_address": address_address
                                   }
                           };
    MNLog(@"body==== %@",dict)
    return dict;
}


@end
