//
//  SLPURLAlertView.m
//  Sleepace
//
//  Created by mac on 8/23/17.
//  Copyright © 2017 YJ. All rights reserved.
//

#import "SLPURLAlertView.h"

@implementation SLPURLAlertView

- (void)awakeFromNib{
    [super awakeFromNib];
    [self.confirmButton setTitleColor:SLPThemeColor.C9 forState:UIControlStateNormal];
    [self.confirmButton.titleLabel setFont:SLPThemeFont.T3];
    [self.confirmButton.titleLabel setNumberOfLines:2];
    [Utils configSomeKindOfButtonLikeRegister:self.confirmButton];
    
    [self.titleButton.titleLabel setFont:SLPThemeFont.T3];
    [self.titleButton setTitleColor:SLPThemeColor.C2 forState:UIControlStateNormal];
    [self.titleButton.titleLabel setNumberOfLines:2];
}

- (IBAction)confirmButtonClicked:(id)sender{
    [self unshowAnimated:YES];
    if (self.completion){
        self.completion (SLPAlertButtonIndex_Confirm,self);
    }
}

- (IBAction)titleButtonClicked:(id)sender{
    [self unshowAnimated:YES];
    if (self.completion){
        self.completion (SLPAlertButtonIndex_Title,self);
    }
}

- (IBAction)closeButtonClicked:(id)sender
{
    [self unshowAnimated:YES];
    if (self.completion){
        self.completion (SLPAlertButtonIndex_Close,self);
    }
}

- (void)setTitle:(NSString *)title message:(NSString *)message confirmTitle:(NSString *)confirmTitle
  clickableTitle:(NSString *)clickableTitle
      completion:(SLPAlertCompletion)completion{
    [self setTitle:title];
    [self setMessage:message];
    [self.confirmButton setTitle:confirmTitle forState:UIControlStateNormal];
    [self.titleButton setTitle:clickableTitle forState:UIControlStateNormal];
    [self setCompletion:completion];
}


- (void)setTitle:(NSString *)title message:(NSString *)message confirmTitle:(NSString *)confirmTitle
  clickableTitle:(NSString *)clickableTitle closeButton:(BOOL)isHave
      completion:(SLPAlertCompletion)completion
{
    self.closeButton.hidden=!isHave;
    [self setTitle:title];
    [self setMessage:message];
    [self.confirmButton setTitle:confirmTitle forState:UIControlStateNormal];
    [self.titleButton setTitle:clickableTitle forState:UIControlStateNormal];
    [self setCompletion:completion];
}

@end
