//
//  LFOrderHomeCell.h
//  HCCF
//
//  Created by Lyh on 2017/12/12.
//  Copyright © 2017年 xmhccf. All rights reserved.
//

#import <UIKit/UIKit.h>
@class LFOrderHomeModel;

@protocol LFOrderHomeDelegate <NSObject>

- (void)clickOrderStateBtn:(UIButton *)sender;

@end

@interface LFOrderHomeCell : HZRootTableViewCell

@property (nonatomic, weak) id <LFOrderHomeDelegate> delegate;

@property (nonatomic, strong) LFOrderHomeModel *model;

@property (nonatomic, strong) NSIndexPath *indexPath;

@end
