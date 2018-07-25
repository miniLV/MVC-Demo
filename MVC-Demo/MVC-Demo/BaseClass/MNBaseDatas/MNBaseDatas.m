//
//  MNBaseDatas.m
//  HCCF
//
//  Created by Lyh on 2018/3/20.
//  Copyright © 2018年 xmhccf. All rights reserved.
//

#import "MNBaseDatas.h"

@implementation MNBaseDatas

+ (void)fetchDatas{
    
}

+ (NSArray *)localDatas{
    
    return @[];
}

+ (void)fetchDatasSuccessBlock:(MNsuccessBlock)block{
    
}

+ (void)fetchDatasSuccessBlock:(MNsuccessBlock)block
                  failureBlock:(MNfailureBlock)failure{
    
}

+ (void)LoadMoreCarDatasWithNextUrl:(NSString *)nextUrl
                         basicArray:(NSMutableArray *)basicArray
                         modelClass:(Class)modelClass
                              block:(MN_loadMoreModelBlock)block
                            failure:(MNfailureBlock)failure
                         {

        /**AFNetworking 上拉加载更多数据 - 调用接口*/
                             
//    [YHAFNHelper get:nextUrl parameter:nil success:^(id responseObject) {
//
//        NSArray *getArray = responseObject[@"results"];
//        [basicArray addObjectsFromArray:getArray];
//
//        NSArray *modelArray = [NSArray yy_modelArrayWithClass:[modelClass class] json:basicArray];
//
//        NSString *nextPageUrl = [MNString mn_getNextUrlWithUrl:responseObject[@"next"]];
//        NSDictionary *dict = @{
//                               @"basicArray":basicArray,
//                               @"modelArray":modelArray,
//                               @"nextPageUrl":nextPageUrl
//                               };
//        MNBaseModel *model = [MNBaseModel yy_modelWithJSON:dict];
//        block(model);
//    } faliure:^(NSError *error) {
//        failure();
//    }];
}
@end
