//
//  SLPRaiseUpBaseView.h
//  Sleepace
//
//  Created by mac on 9/7/17.
//  Copyright © 2017 YJ. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SLPRaiseUpBaseView : UIView
@property (nonatomic,weak) IBOutlet UIView *maskView;
@property (nonatomic,weak) IBOutlet UIView *contentView;
@property (nonatomic,weak) IBOutlet NSLayoutConstraint *contentViewTopEdge;

- (void)raiseUpInViewController:(UIViewController *)viewController Animated:(BOOL)animated;
- (void)dropDownAnimated:(BOOL)animated;
@end
