//
//  SLPRaiseUpBaseView.m
//  Sleepace
//
//  Created by mac on 9/7/17.
//  Copyright © 2017 YJ. All rights reserved.
//

#import "SLPRaiseUpBaseView.h"

#define kMaskMaxAlpha (0.4)
@implementation SLPRaiseUpBaseView

- (void)awakeFromNib{
    [super awakeFromNib];
    [self.maskView setBackgroundColor:[UIColor blackColor]];
    [self.contentView setBackgroundColor:SLPThemeColor.C8];
}

- (IBAction)tap:(UIGestureRecognizer *)gestureRecognizer{
    [self dropDownAnimated:YES];
}

- (void)raiseUp{
    __weak typeof(self) weakSelf = self;
    CGRect rect = self.contentView.bounds;
    [self.contentViewTopEdge setConstant:rect.size.height];
    [UIView animateWithDuration:0.3 animations:^{
        [weakSelf layoutIfNeeded];
        [weakSelf.maskView setAlpha:kMaskMaxAlpha];
    }];
}

- (void)raiseUpInViewController:(UIViewController *)viewController Animated:(BOOL)animated{
    UIView *view = viewController.view;
    [self.maskView setAlpha:0.0];
    [Utils addSubView:self suitableTo:view];
    [view updateConstraints];
    [view setNeedsLayout];
    [view layoutIfNeeded];
    [self performSelectorOnMainThread:@selector(raiseUp) withObject:nil waitUntilDone:NO];
}

- (void)dropDownAnimated:(BOOL)animated{
    [self.contentViewTopEdge setConstant:0];
    [self updateConstraintsIfNeeded];
    __weak typeof(self) weakSelf = self;
    [UIView animateWithDuration:0.3 animations:^{
        [weakSelf layoutIfNeeded];
        [weakSelf.maskView setAlpha:0.0];
    }completion:^(BOOL finished) {
        [self removeFromSuperview];
    }];
}
@end
