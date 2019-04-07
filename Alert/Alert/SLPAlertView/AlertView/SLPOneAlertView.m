//
//  SLPOneAlertView.m
//  Sleepace
//
//  Created by mac on 8/23/17.
//  Copyright © 2017 YJ. All rights reserved.
//

#import "SLPOneAlertView.h"

@implementation SLPOneAlertView

- (void)awakeFromNib{
    [super awakeFromNib];
//    self.contentView.backgroundColor=SLPThemeColor.C8;
//    [self.titleLabel setFont:SLPThemeFont.T1];
//    [self.titleLabel setTextColor:SLPThemeColor.C3];
//    [self.messageLabel setFont:SLPThemeFont.T4];
//    [self.messageLabel setTextColor:SLPThemeColor.C4];
    [self.confirmButton setTitleColor:SLPThemeColor.C9 forState:UIControlStateNormal];
    [self.confirmButton.titleLabel setFont:SLPThemeFont.T3];
    [self.confirmButton.titleLabel setNumberOfLines:2];
//    [SLPUtils configSomeKindOfButtonLikeRegister:self.confirmButton];
}

- (IBAction)confirmButtonClicked:(id)sender{
    [self unshowAnimated:YES];
    if (self.completion){
        self.completion (SLPAlertButtonIndex_Confirm,self);
    }
}

- (void)setTitle:(NSString *)title message:(NSString *)message
    confirmTitle:(NSString *)confirmTitle completion:(SLPAlertCompletion)completion{
    [self.confirmButton setTitle:confirmTitle forState:UIControlStateNormal];
    [self setTitle:title];
    [self setMessage:message];
    [self setCompletion:completion];
}

@end
