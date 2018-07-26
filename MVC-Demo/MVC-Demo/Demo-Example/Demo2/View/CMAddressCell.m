  //
//  CMAddressCell.m
//  HCCF
//
//  Created by Lyh on 2018/3/21.
//  Copyright © 2018年 xmhccf. All rights reserved.
//

#import "CMAddressCell.h"

@interface CMAddressCell()
<UITextViewDelegate>
@end

@implementation CMAddressCell

CGFloat const CMAddressTextViewLeftMargin = 140;
CGFloat const CMAddressTextViewRightMargin = 35;

- (void)createControls{
    
    UILabel *titleLabel = [MNLabel labelWithFont:HZ_15FontSize color:HZ_777777Color];
    [self.contentView addSubview:titleLabel];
    [titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.left.mas_equalTo(DefaultMargin);
    }];
    _titleLabel = titleLabel;

    //addressTextView
    MNPlaceholderTextView *addressTextView = [[MNPlaceholderTextView alloc]initWithFrame:CGRectZero withPlaceholderColor:HZ_C8C8C8Color fontSize:15];
    addressTextView.textColor = HZ_494949Color;
    addressTextView.textAlignment = NSTextAlignmentRight;
    [self.contentView addSubview:addressTextView];
    [addressTextView mas_updateConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(CMAddressTextViewLeftMargin);
        make.right.mas_equalTo(-CMAddressTextViewRightMargin);
        make.top.mas_equalTo(5);
        make.bottom.mas_equalTo(-10);
    }];
    addressTextView.delegate = self;
    addressTextView.placeholderColor = HZ_C8C8C8Color;
    _addressTextView = addressTextView;

}

- (void)setBasicModel:(MNCellModel *)basicModel{

    NSInteger tag = self.basicIndexPath.section * 100 + self.basicIndexPath.row;
    _addressTextView.tag = tag;
    _titleLabel.text = basicModel.titleLabel;
    _addressTextView.text = basicModel.textFieldValue;
    _addressTextView.placeholder = basicModel.placeholder;
    
}


#pragma mark - <UITextViewDelegate>
- (BOOL)textViewShouldEndEditing:(UITextView *)sender{
    return YES;
}
- (void)textViewDidEndEditing:(UITextView *)sender{

    [_delegate respondsToSelector:@selector(endEditAddressTextView:)] ?
    [_delegate endEditAddressTextView:sender] : nil;
}

@end
