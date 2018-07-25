//
//  LFOrderHomeCell.h
//  HCCF
//
//  Created by Lyh on 2017/12/12.
//  Copyright © 2017年 xmhccf. All rights reserved.
//

#import <UIKit/UIKit.h>
@class Demo1Model;

@protocol LFOrderHomeDelegate <NSObject>

- (void)clickOrderStateBtn:(UIButton *)sender;

@end

@interface Demo1Cell : HZRootTableViewCell

@property (nonatomic, weak) id <LFOrderHomeDelegate> delegate;

@property (nonatomic, strong) Demo1Model *model;

@property (nonatomic, strong) NSIndexPath *indexPath;

@end
