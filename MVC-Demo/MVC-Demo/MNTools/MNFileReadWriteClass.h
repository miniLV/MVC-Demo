//
//  MNFileReadWriteClass.h
//  HCCF
//
//  Created by 梁宇航 on 2018/7/25.
//  Copyright © 2018年 xmhccf. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MNFileReadWriteClass : NSObject

+ (BOOL)writeToFile:(NSString *)fileName content:(id)content;

+ (id)getFileDatasWithFileName:(NSString *)fileName;

+ (id)loadLocalFileWithFileName:(NSString *)fileName;

@end
