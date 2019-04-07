//
//  SLPPopUpBaseView.m
//  Sleepace
//
//  Created by mac on 8/29/17.
//  Copyright © 2017 YJ. All rights reserved.
//

#import "SLPPopUpBaseView.h"

#define kMaskMaxAlpha (0.6)
@implementation SLPPopUpBaseView

- (void)awakeFromNib{
    [super awakeFromNib];
    
    [self.maskView setAlpha:0];
    [self.maskView setBackgroundColor:[UIColor blackColor]];
    [self setBackgroundColor:[UIColor clearColor]];
    [self.contentView setBackgroundColor:SLPThemeColor.C9];
}

- (void)showInViewController:(UIViewController *)viewController animated:(BOOL)animated{
    UIView *view = [Utils keyWindow];
    [Utils addSubView:self suitableTo:view];
    [self.bgView setAlpha:1.0];
    [self.bgView setTransform:CGAffineTransformMakeScale(0.01, 0.01)];
    [self.maskView setAlpha:0.0];
    [UIView animateWithDuration:kAlertAnimationInterval animations:^{
        [self.maskView setAlpha:kMaskMaxAlpha];
        [self.bgView setTransform:CGAffineTransformMakeScale(1.0, 1.0)];
    }];
}

- (void)unshowAnimated:(BOOL)animated{
    __weak typeof(self) weakSelf = self;
    [UIView animateWithDuration:kAlertAnimationInterval animations:^{
        [weakSelf.bgView setAlpha:0.0];
        [weakSelf.bgView setTransform:CGAffineTransformMakeScale(0.01, 0.01)];
        [weakSelf.maskView setAlpha:0.0];
    } completion:^(BOOL finished) {
        [weakSelf removeFromSuperview];
    }];
}
@end
