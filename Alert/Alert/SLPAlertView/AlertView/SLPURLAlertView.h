//
//  SLPURLAlertView.h
//  Sleepace
//
//  Created by mac on 8/23/17.
//  Copyright © 2017 YJ. All rights reserved.
//

#import "SLPAlertView.h"

@interface SLPURLAlertView : SLPAlertView
@property (nonatomic,weak) IBOutlet UIButton *confirmButton;
@property (nonatomic,weak) IBOutlet UIButton *titleButton;
@property (nonatomic,weak) IBOutlet UIButton *closeButton;

- (void)setTitle:(NSString *)title message:(NSString *)message confirmTitle:(NSString *)confirmTitle
            clickableTitle:(NSString *)clickableTitle
      completion:(SLPAlertCompletion)completion;

///带关闭按钮
- (void)setTitle:(NSString *)title message:(NSString *)message confirmTitle:(NSString *)confirmTitle
  clickableTitle:(NSString *)clickableTitle closeButton:(BOOL)isHave
      completion:(SLPAlertCompletion)completion;
@end
