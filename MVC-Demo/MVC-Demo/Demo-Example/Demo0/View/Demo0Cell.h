//
//  MYPersonalCell.h
//  HCCF
//
//  Created by Lyh on 2018/1/30.
//  Copyright © 2018年 xmhccf. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "LFSimpleRightCell.h"

@protocol  MYPersonalVCDelegate<NSObject>

- (void)PersonalEndEdit:(UITextField *)sender;

- (void)PersonalListenEditor:(UITextField *)sender;

@end

@interface Demo0Cell : LFSimpleRightCell

@property (nonatomic, strong) NSIndexPath *indexpath;

@property (nonatomic, weak) id <MYPersonalVCDelegate> delegate;

@end


@interface MYPersonalAvaterCell : Demo0Cell

@end
