//
//  CarCheckDatas.m
//  HCCF
//
//  Created by Lyh on 2018/4/13.
//  Copyright © 2018年 xmhccf. All rights reserved.
//

#import "Demo3Datas.h"

@implementation Demo3Datas

+ (NSArray *)localDatas{
    
    MNCellModel *section0 = [self p_section0];
    MNCellModel *section1 = [self p_section1];
    MNCellModel *section2 = [self p_section2];
    MNCellModel *section3 = [self p_section3];
    MNCellModel *section4 = [self p_section4];
    MNCellModel *section5 = [self p_section5];
    return @[section0, section1, section2, section3, section4, section5];
}

+ (MNCellModel *)p_section0{
    
    MNCellModel *section0 = [[MNCellModel alloc]init];
    section0.titleLabel = @"车辆信息";
    section0.expand = YES;
    
    NSArray *titles = @[@"车牌号:",
                        @"车主姓名:",
                        @"品牌型号:",
                        @"车架号:",
                        @"发动机号:",
                        @"注册日期:", ];
    
    NSMutableArray *arrayM = [NSMutableArray arrayWithCapacity:titles.count];
    for (int i = 0; i < titles.count; i++) {
        MNCellModel *model = [[MNCellModel alloc]init];
        model.titleLabel = titles[i];
        model.type = 0;
        [arrayM addObject:model];
    }
    section0.cellModels = arrayM;
    return section0;
}

+ (MNCellModel *)p_section1{
    
    MNCellModel *section1 = [[MNCellModel alloc]init];
    section1.titleLabel = @"被保人信息";
    section1.expand = YES;
    
    NSArray *titles = @[@"被保人姓名:",
                        @"证件类型:",
                        @"证件号码:",
                        @"手机号码:",
                        @"电子邮箱:",];
    NSMutableArray *arrayM = [NSMutableArray arrayWithCapacity:titles.count];
    
    for (int i = 0; i < titles.count; i++) {
        MNCellModel *model = [[MNCellModel alloc]init];
        model.titleLabel = titles[i];
        model.type = 0;
        [arrayM addObject:model];
    }
    section1.cellModels = arrayM;
    return section1;
}

+ (MNCellModel *)p_section2{
    
    MNCellModel *section2 = [[MNCellModel alloc]init];
    section2.titleLabel = @"投保人信息";
    section2.expand = YES;
    
    NSArray *titles = @[@"投保人姓名:",
                        @"证件类型:",
                        @"证件号码:",
                        @"手机号码:",
                        @"电子邮箱:",];
    NSMutableArray *arrayM = [NSMutableArray arrayWithCapacity:titles.count];
    
    for (int i = 0; i < titles.count; i++) {
        MNCellModel *model = [[MNCellModel alloc]init];
        model.titleLabel = titles[i];
        model.type = 0;
        [arrayM addObject:model];
    }
    section2.cellModels = arrayM;
    return section2;
}

+ (MNCellModel *)p_section3{
    MNCellModel *section3 = [[MNCellModel alloc]init];
    section3.expand = YES;
    NSArray *titles = @[@"应缴保费:", @"保单折扣:"];
    NSArray *types = @[@"11",@"10"];
    
    NSMutableArray *arrayM = [NSMutableArray arrayWithCapacity:titles.count];
    for (int i = 0 ; i < titles.count; i ++) {
        
        MNCellModel *model = [[MNCellModel alloc]init];
        model.titleLabel = titles[i];
        model.type = [types[i] integerValue];
        [arrayM addObject:model];
    }
    section3.cellModels = arrayM;
    return section3;
}

+ (MNCellModel *)p_section4{
    
    MNCellModel *section4 = [[MNCellModel alloc]init];
    section4.titleLabel = @"交强险";
    section4.expand = YES;
    NSArray *titles = @[@"保障期:", @"保费:", @"车船税:"];
    NSArray *types = @[@"1",@"21", @"21"];
    
    NSMutableArray *arrayM = [NSMutableArray arrayWithCapacity:titles.count];
    for (int i = 0 ; i < titles.count; i ++) {
        
        MNCellModel *model = [[MNCellModel alloc]init];
        model.titleLabel = titles[i];
        model.type = [types[i] integerValue];
        [arrayM addObject:model];
    }
    section4.cellModels = arrayM;
    return section4;
}

+ (MNCellModel *)p_section5{
    
    MNCellModel *section5 = [[MNCellModel alloc]init];
    section5.expand = YES;
    section5.titleLabel = @"商业险";
    NSArray *titles = @[@"保障期:",@"保费:",@"报价内容:"];
    NSArray *types = @[@"1",@"21",@"200"];
    
    NSMutableArray *arrayM = [NSMutableArray arrayWithCapacity:titles.count];
    for (int i = 0 ; i < titles.count; i ++) {
        
        MNCellModel *model = [[MNCellModel alloc]init];
        model.titleLabel = titles[i];
        model.type = [types[i] integerValue];
        [arrayM addObject:model];
    }
    section5.cellModels = arrayM;
    return section5;
}

/**
 网络数据-赋值
 */

+ (void)set_datasWithModel:(CarQuotationModel *)dataModel datas:(NSArray *)datas{
    
    //1.section0 - 车辆信息
    MNCellModel *section0 = datas.firstObject;
    [self p_setSection0:section0.cellModels model:dataModel];
    
    //2.section1 - 被保人信息
    MNCellModel *section1 = datas[1];
    [self p_setSection1:section1.cellModels model:dataModel];
    
    //3.section2 - 投保人信息
    MNCellModel *section2 = datas[2];
    [self p_setSection2:section2.cellModels model:dataModel];
    
    //4.section3 - 订单信息
    MNCellModel *section3 = datas[3];
    [self p_setSection3:section3.cellModels model:dataModel];
    
    //5.section4 - 交强险
    MNCellModel *section4 = datas[4];
    [self p_setSection4:section4.cellModels model:dataModel];
    
    //6.section5 - 商业险
    MNCellModel *section5 = datas[5];
    [self p_setSection5:section5.cellModels model:dataModel];
}


+ (void)p_setSection0:(NSArray *)section0 model:(CarQuotationModel *)dataModel{
    
    MNCellModel *carNum = section0[0];
    carNum.rightValue = @"闽D12345";
    
    MNCellModel *carOwner = section0[1];
    carOwner.rightValue = @"小蠢驴";
    
    MNCellModel *carType = section0[2];
    carType.rightValue = @"兰博基尼-电池版";
    
    MNCellModel *vin = section0[3];
    vin.rightValue = @"猜猜我号码多少";
    
    MNCellModel *engine = section0[4];
    engine.rightValue = @"猜猜我号码多少";
    
    MNCellModel *registDate = section0[5];
    registDate.rightValue = @"2018-06-27";
}

+ (void)p_setSection1:(NSArray *)section1 model:(CarQuotationModel *)dataModel{
    MNCellModel *nameModel = section1[0];
    nameModel.rightValue = @"miniLV";
    
    MNCellModel *cardType = section1[1];
    cardType.rightValue = @"新司机滴滴证";
    
    MNCellModel *cardNum = section1[2];
    cardNum.rightValue = @"350xxxxxxxxxxxxxxx";
    
    MNCellModel *mobile = section1[3];
    mobile.rightValue = @"1305527xxxx";
    
    MNCellModel *email = section1[4];
    email.rightValue = @"liangyuhangApple@gmail.com";
    
}

+ (void)p_setSection2:(NSArray *)section2 model:(CarQuotationModel *)dataModel{
    MNCellModel *nameModel = section2[0];
    nameModel.rightValue = @"miniLV";
    
    MNCellModel *cardType = section2[1];
    cardType.rightValue = @"新司机滴滴证";
    
    MNCellModel *cardNum = section2[2];
    cardNum.rightValue = @"350xxxxxxxxxxxxxxx";
    
    MNCellModel *mobile = section2[3];
    mobile.rightValue = @"1305527xxxx";
    
    MNCellModel *email = section2[4];
    email.rightValue = @"liangyuhangApple@gmail.com";
    
}

+ (void)p_setSection3:(NSArray *)section3 model:(CarQuotationModel *)dataModel{
    
    MNCellModel *row0_0 = section3[0];
    row0_0.rightValue = @"100";
    
    MNCellModel *row0_1 = section3[1];
    row0_1.rightValue = @"60" ? : @"无";
}

+ (void)p_setSection4:(NSArray *)section4 model:(CarQuotationModel *)dataModel{
    
    //保障期
    MNCellModel *row1_0 = section4[0];
    NSString *compulsoryStart = @"2018/07/25 00:00:00";
    NSString *compulsoryEnd = @"2018/07/27 23:59:59";
    
    NSString *compulsoryStr = [[[@"起 " stringByAppendingString:compulsoryStart] stringByAppendingString:@"\n"]stringByAppendingString:[@"止 " stringByAppendingString:  compulsoryEnd]];
    row1_0.rightValue = compulsoryStr;
    
    MNCellModel *row1_1 = section4[1];
    row1_1.rightValue = @"100.00";
    
    MNCellModel *row1_2 = section4[2];
    row1_2.rightValue = @"200.00";
}

+ (void)p_setSection5:(NSArray *)section5 model:(CarQuotationModel *)dataModel{
    
    //商业险
    MNCellModel *row2_0 = section5[0];
    NSString *bussinessStart = @"2018/07/25 00:00:00";
    NSString *bussinessEnd = @"2018/07/27 23:59:59";
    NSString *bussinessStr = [[[@"起 " stringByAppendingString:bussinessStart] stringByAppendingString:@"\n"]stringByAppendingString:[@"止 " stringByAppendingString:  bussinessEnd]];
    
    row2_0.rightValue = bussinessStr;
    
    MNCellModel *row2_1 = section5[1];
    row2_1.rightValue = @"668.00";
    
    //报价内容
//    [self p_handleFormDatasWithModel:dataModel section5:section5];
}


//+ (void)p_handleFormDatasWithModel:(CarQuotationModel *)model
//                          section5:(NSArray *)section5{
//    
//    //1.数据过滤-如果没投保的就不展示了(服务端没做过滤)
//    NSArray *dataArray = model.insurance_type;
//    
//    NSMutableArray *totalArrayM = [NSMutableArray array];
//    for (CarInsurance_Type *model in dataArray) {
//        
//        if (model.is_insure) {
//            [totalArrayM addObject:model];
//        }
//    }
//    
//    //2.数据处理成-form表单需要的格式
//    NSMutableArray *result = [NSMutableArray arrayWithCapacity:totalArrayM.count];
//    
//    for (int i = 0; i < totalArrayM.count; i++) {
//        
//        CarInsurance_Type *carModel = totalArrayM[i];
//        
//        MNFormModel *model = [[MNFormModel alloc]init];
//        model.title = carModel.name;
//        model.price = carModel.insure_premium;
//        
//        //详情model
//        MNFormDetailModel *detailModel = [[MNFormDetailModel alloc]init];
//        detailModel.firstShow = carModel.insure_type;
//        detailModel.free = carModel.is_insure_free;
//        detailModel.detailStr = carModel.insure_coverage;
//        
//        model.detail = detailModel;
//        
//        [result addObject:model];
//    }
//    
//    //拿到result赋值到数据源中
//    MNCellModel *cellModel = section5.lastObject;
//    cellModel.modelDatas = result;
//}














@end
