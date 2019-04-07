//
//  SLPBaseAlertView.h
//  Sleepace
//
//  Created by mac on 8/23/17.
//  Copyright © 2017 YJ. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SLPPopUpBaseView.h"

typedef NS_ENUM(NSInteger,SLPAlertButtonIndex) {
    SLPAlertButtonIndex_Cancel = 0,//取消
    SLPAlertButtonIndex_Confirm,//确定
    SLPAlertButtonIndex_Title,//title按钮
    SLPAlertButtonIndex_Close,//关闭按钮
};

@class SLPAlertView;
typedef void(^SLPAlertCompletion)(SLPAlertButtonIndex index,SLPAlertView *alertView);

@interface SLPAlertView : SLPPopUpBaseView

@property (nonatomic,weak) IBOutlet UILabel *titleLabel;
@property (nonatomic,weak) IBOutlet NSLayoutConstraint *messageTopEdge;
@property (nonatomic,weak) IBOutlet UILabel *messageLabel;

@property (nonatomic,copy) SLPAlertCompletion completion;

- (void)setTitle:(NSString *)title;

- (void)setMessage:(NSString *)message;

//下一个提示框非常重要
+ (void)setNextAlertIsVeryImportant;
@end
