//
//  CarAddInfoDatas.h
//  HCCF
//
//  Created by Lyh on 2018/4/12.
//  Copyright © 2018年 xmhccf. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Demo2Datas : MNBaseDatas

//开关“是否投保人” - 修改模型数据
+ (NSArray *)local_changeSection1FromDatas:(NSArray *)datas;

//test-数据提交
+ (void)postDatasWithDatas:(NSArray *)datas successBlock:(MNsuccessStringBlock)block failure:(MNfailureAlertShowBlock)failure;

@end
