//
//  SLPAlertTipView.m
//  Sleepace
//
//  Created by mac on 6/28/17.
//  Copyright © 2017 YJ. All rights reserved.
//

#import "SLPAlertTipView.h"
#import "SLPTimer.h"

#define kAnimationInterval (0.3)
@implementation SLPAlertTipView

- (void)awakeFromNib{
    [super awakeFromNib];
    
    [self.tipLable setFont:SLPThemeFont.T3];
    [self.tipLable setTextColor:SLPThemeColor.C9];
}

- (void)showAtView:(UIView *)view animated:(BOOL)animated{
    [self setTranslatesAutoresizingMaskIntoConstraints:NO];
    [view addSubview:self];
    
    CGFloat tipViewHeight = 64;
    UIView *tipView = self;
    NSDictionary *subViews = NSDictionaryOfVariableBindings(tipView);
    [view addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|[tipView]|" options:0 metrics:nil views:subViews]];
    NSLayoutConstraint *topEdge = [NSLayoutConstraint constraintWithItem:tipView attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual toItem:view attribute:NSLayoutAttributeTop multiplier:1.0 constant:-tipViewHeight];
    [view addConstraint:topEdge];
    [tipView addConstraint:[NSLayoutConstraint constraintWithItem:tipView attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:nil attribute:0 multiplier:1.0 constant:tipViewHeight]];
    
    __weak typeof(self) weakSelf = self;
    [topEdge setConstant:0];
    [UIView animateWithDuration:kAnimationInterval animations:^{
        [weakSelf setNeedsUpdateConstraints];
    }completion:^(BOOL finished) {
        [SLPTimer scheduledTimerWithTimeInterval:2 target:weakSelf userInfo:nil repeats:NO handle:^(SLPTimer * _Nonnull timer) {
            [weakSelf unshow];
        }];
    }];
}

- (void)unshow{
    [UIView animateWithDuration:kAnimationInterval animations:^{
        self.alpha = 0.0;
    }completion:^(BOOL finished) {
        [self removeFromSuperview];
    }];
}
@end
