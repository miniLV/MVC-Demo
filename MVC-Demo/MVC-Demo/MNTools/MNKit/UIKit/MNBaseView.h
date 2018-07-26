//
//  MNBaseView.h
//  HCCF
//
//  Created by Lyh on 2018/4/3.
//  Copyright © 2018年 xmhccf. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MNBaseView : UIView

/**
 base function
 */
- (void)createControls;


/**
 headerView
 */
+ (instancetype)headerView;

//rewrite
- (instancetype)initHeaderView;

- (void)head_createControls;

- (void)head_setSettings;








@end
