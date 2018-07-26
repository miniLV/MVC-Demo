//
//  CMAddressCell.h
//  HCCF
//
//  Created by Lyh on 2018/3/21.
//  Copyright © 2018年 xmhccf. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MNPlaceholderTextView.h"
@protocol CMAddressDelegate <NSObject>

- (void)endEditAddressTextView:(UITextView *)sender;

@end

@interface CMAddressCell : HZRootTableViewCell{
    UILabel *_titleLabel;
    MNPlaceholderTextView *_addressTextView;
}
@property (nonatomic, weak) id <CMAddressDelegate> delegate;

@end
