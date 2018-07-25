//
//  LFOrderHomeModel.h
//  HCCF
//
//  Created by Lyh on 2018/4/25.
//  Copyright © 2018年 xmhccf. All rights reserved.
//

#import <Foundation/Foundation.h>

@class Order_Product,Order_Insured_Set;
@interface Demo1Model : NSObject

@property (nonatomic, copy) NSString *premium;

@property (nonatomic, strong) Order_Product *product;

@property (nonatomic, copy) NSString *start_date;

@property (nonatomic, strong) NSArray<Order_Insured_Set *> *insured_set;

@property (nonatomic, copy) NSString *created_at;

@property (nonatomic, copy) NSString *policy_uuid;

@property (nonatomic, copy) NSString *applicant;

@property (nonatomic, copy) NSString *duration_desc;

@property (nonatomic, copy) NSString *end_date;

@property (nonatomic, copy) NSString *state;

@property (nonatomic, copy) NSString *pay_url;

@property (nonatomic, copy) NSString *platform_order_id;

@property (nonatomic, copy) NSString *brokerage_info;

@end

@interface Order_Product : NSObject

@property (nonatomic, copy) NSString *name;

@property (nonatomic, copy) NSString *product_uuid;

@property (nonatomic, copy) NSString *thumbnail_url;

@property (nonatomic, copy) NSString *h5_url;

@property (nonatomic, copy) NSString *claim_url;

@end

@interface Order_Insured_Set : NSObject

@property (nonatomic, copy) NSString *name;

@end


