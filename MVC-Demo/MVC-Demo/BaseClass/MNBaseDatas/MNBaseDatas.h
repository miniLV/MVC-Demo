//
//  MNBaseDatas.h
//  HCCF
//
//  Created by Lyh on 2018/3/20.
//  Copyright © 2018年 xmhccf. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "MNLoadMoreModel.h"
@interface MNBaseDatas : NSObject

//请求数据成功
typedef void (^MNsuccessBlock)(NSArray *array);
typedef void (^MNsuccessModelBlock)(id model);
typedef void (^MNsuccessStringBlock)(NSString *string);

//请求数据成功 - 需要回传多个参数的(用字典 or 自己在那个子类ViewModel里面自定义一个多参数的回调block)
typedef void (^MNsuccessFullBlock)(NSDictionary *dict);
typedef void (^MNsuccessNilBlock)(void);

//下拉加载更多
typedef void (^MN_loadMoreBlock)(NSDictionary *dict);

typedef void (^MN_loadMoreModelBlock)(MNLoadMoreModel *model);

//网络请求错误
typedef void (^MNfailureBlock)(void);

//回调alertC让 controller调用显示 - datas 无法 presentVC
typedef void (^MNfailureAlertShowBlock)(UIAlertController *alertC);


+ (void)fetchDatasSuccessBlock:(MNsuccessBlock)block;

+ (void)fetchDatasSuccessBlock:(MNsuccessBlock)block
                  failureBlock:(MNfailureBlock)failure;

+ (void)fetchDatas;

+ (NSArray *)localDatas;

//上拉加载更多
+ (void)LoadMoreCarDatasWithNextUrl:(NSString *)nextUrl
                         basicArray:(NSMutableArray *)basicArray
                         modelClass:(Class)modelClass
                              block:(MN_loadMoreModelBlock)block
                            failure:(MNfailureBlock)failure;

@end
