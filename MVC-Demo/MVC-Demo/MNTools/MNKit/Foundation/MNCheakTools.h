//
//  cheakTools.h
//  WorkDemo
//
//  Created by Lyh on 2017/5/20.
//  Copyright © 2017年 xmhccf. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MNCheakTools : NSObject


/**
 验证手机号是否正确

 @param telNumber 手机号
 @return 返回判断结果
 */
+ (BOOL)checkTelNumber:(NSString *) telNumber;



/**
 验证车牌号是否正确

 @param carNumber 车牌号
 @return 返回判断结果
 */
+ (BOOL)checkCarNumber:(NSString *) carNumber;


///判断银行卡号是否合法
+ (BOOL)checkBankCard:(NSString *)cardNumber;

///邮箱验证
+ (BOOL)checkEmailAdress:(NSString *)Email;


///身份证验证
+ (BOOL)checkIdentityCard: (NSString *)identityCard;

///邮编验证
+ (BOOL)checkCodeNumber:(NSString *) codeNumber;

///检验url是否正确
+ (BOOL)checkUrl:(NSString *)candidate;
@end
