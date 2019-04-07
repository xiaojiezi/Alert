//
//  SLPBaseAlertView.m
//  Sleepace
//
//  Created by mac on 8/23/17.
//  Copyright © 2017 YJ. All rights reserved.
//

#import "SLPAlertView.h"

static BOOL g_isShown = NO;

@implementation SLPAlertView

//- (void)dealloc{
//    g_isShown = NO;
//}

- (void)removeFromSuperview{
    [super removeFromSuperview];
    [self performSelectorOnMainThread:@selector(checkAndSetUnShow) withObject:nil waitUntilDone:NO];
}

- (void)checkAndSetUnShow{
    NSArray *subViews = [Utils keyWindow].subviews;
    BOOL hasAlertView = NO;
    
    for (UIView *subView in subViews){
        if ([subView isKindOfClass:[self class]]){
            hasAlertView = YES;
            break;
        }
    }
    
    if (!hasAlertView){
        g_isShown = NO;
    }
}

- (void)awakeFromNib{
    [super awakeFromNib];
    [Utils setView:self.contentView cornerRadius:4 borderWidth:0 color:nil];
    [self.titleLabel setFont:SLPThemeFont.T1];
    [self.titleLabel setTextColor:SLPThemeColor.C10];
    [self.messageLabel setFont:SLPThemeFont.T4];
    [self.messageLabel setTextColor:SLPThemeColor.C4];
    [self.messageLabel setTextAlignment:NSTextAlignmentCenter];
    
    [self.contentView setBackgroundColor:SLPThemeColor.C9];
}

- (void)setTitle:(NSString *)title{
    [self.titleLabel setText:title];
    CGFloat messageTopEdge = 0;
    if (title.length > 0){
        messageTopEdge = 10;
    }
    [self.messageTopEdge setConstant:messageTopEdge];
}

- (void)setMessage:(NSString *)message{
    [Utils setLable:self.messageLabel text:message font:SLPThemeFont.T4 lineGap:SLPThemeFont.t4LineGap];
    [self.messageLabel setTextAlignment:NSTextAlignmentCenter];
}

- (void)showInViewController:(UIViewController *)viewController animated:(BOOL)animated{
    if (!g_isShown){
        g_isShown = YES;
        [super showInViewController:viewController animated:animated];
    }
}

- (void)unshowAnimated:(BOOL)animated{
    g_isShown = NO;
    [super unshowAnimated:animated];
}

+ (void)setNextAlertIsVeryImportant{
    g_isShown = NO;
}
@end
