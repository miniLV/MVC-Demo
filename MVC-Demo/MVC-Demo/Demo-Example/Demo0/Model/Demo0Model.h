//
//  LFMineModel.h
//  HCCF
//
//  Created by xxkj on 17/12/4.
//  Copyright © 2017年 xmhccf. All rights reserved.
//

#import <Foundation/Foundation.h>
typedef enum authType:NSInteger{
    
    ///未认证
    MyAuthTypeDefault,
    ///认证中
    MyAuthTypePending,
    ///已通过
    MyAuthTypeApprover,
    ///未通过
    MyAuthTypeRejected,
    //未知
    MyAuthTypeUnknown
    
}MyAuthType;

@class MY_User,MY_Sex,Org,MY_Area,MY_Certificate_Info,MY_Certificate_Image,MY_Approval_Status,MY_Id_Info,MY_Id_Type,Avatar,MY_Approval_Status;
@interface Demo0Model : NSObject

+(MyAuthType)getAuthType:(NSString *)typeStr;

@property (nonatomic, copy) NSString *approve_ts;

@property (nonatomic, copy) NSString *reason;

@property (nonatomic, copy) NSString *source;

@property (nonatomic, strong) MY_Approval_Status *approval_status;

@property (nonatomic, assign) BOOL is_signed;

@property (nonatomic, copy) NSString *source_name;

@property (nonatomic, strong) NSArray *attrs;

@property (nonatomic, strong) MY_User *user;

@property (nonatomic, copy) NSString *balance;

@property (nonatomic, copy) NSString *total;

@end

@interface MY_User : NSObject

@property (nonatomic, copy) NSString *areacode;

@property (nonatomic, copy) NSString *nickname;

@property (nonatomic, strong) MY_Sex *sex;

@property (nonatomic, copy) NSString *id_card;

@property (nonatomic, copy) NSString *last_login;

@property (nonatomic, strong) MY_Id_Info *id_info;

@property (nonatomic, copy) NSString *user_uuid;

@property (nonatomic, copy) NSString *email;

@property (nonatomic, strong) NSArray<NSNumber *> *groups;

@property (nonatomic, copy) NSString *mobile;

@property (nonatomic, strong) Org *org;

@property (nonatomic, copy) NSString *career_info;

@property (nonatomic, strong) Avatar *avatar;

@property (nonatomic, strong) MY_Area *area;

@property (nonatomic, strong) MY_Certificate_Info *certificate_info;

@property (nonatomic, copy) NSString *created_at;

@property (nonatomic, copy) NSString *qq;

@property (nonatomic, copy) NSString *wx_info;

@property (nonatomic, copy) NSString *bound_bankcard_num;

@property (nonatomic, copy) NSString *address;

@property (nonatomic, copy) NSString *username;

@end

@interface MY_Sex : NSObject

@property (nonatomic, assign) NSInteger ID;

@property (nonatomic, copy) NSString *name;

@end



@interface MY_Area : NSObject

@property (nonatomic, copy) NSString *depth;

@property (nonatomic, copy) NSString *parentname;

@property (nonatomic, assign) long long parentid;

@property (nonatomic, assign) long long ID;

@property (nonatomic, copy) NSString *zipcode;

@property (nonatomic, copy) NSString *areacode;

@property (nonatomic, assign) NSInteger sub_areas;

@property (nonatomic, copy) NSString *full_name;

@property (nonatomic, copy) NSString *name;

@end

@interface MY_Certificate_Info : NSObject

@property (nonatomic, copy) NSString *id_num;

@property (nonatomic, strong) MY_Certificate_Image *certificate_first_image;

@property (nonatomic, strong) MY_Certificate_Image *certificate_second_image;

@property (nonatomic, copy) NSString *reason;

@property (nonatomic, strong) MY_Certificate_Image *certificate_third_image;

@property (nonatomic, copy) NSString *realname;

@property (nonatomic, strong) MY_Approval_Status *approval_status;

@property (nonatomic, copy) NSString *updated_at;

@property (nonatomic, copy) NSString *certificate_num;

@end

@interface MY_Certificate_Image : NSObject

@property (nonatomic, copy) NSString *file_uuid;

@property (nonatomic, copy) NSString *org_file_name;

@property (nonatomic, copy) NSString *url;

@end

@interface MY_Approval_Status : NSObject

@property (nonatomic, copy) NSString *key;

@property (nonatomic, copy) NSString *name;

@end

@interface MY_Id_Info : NSObject

@property (nonatomic, copy) NSString *id_num;

@property (nonatomic, copy) NSString *address;

@property (nonatomic, strong) MY_Id_Type *id_type;

@property (nonatomic, strong) MY_Certificate_Image *id_back_image;

@property (nonatomic, copy) NSString *realname;

@property (nonatomic, copy) NSString *updated_at;

@property (nonatomic, strong) MY_Certificate_Image *id_front_image;

@end

@interface MY_Id_Type : NSObject

@property (nonatomic, assign) NSInteger ID;

@property (nonatomic, copy) NSString *name;

@end


@interface Avatar : NSObject

@property (nonatomic, copy) NSString *org_file_name;

@property (nonatomic, copy) NSString *url;

@property (nonatomic, copy) NSString *extension;

@property (nonatomic, copy) NSString *object_uuid;

@end


