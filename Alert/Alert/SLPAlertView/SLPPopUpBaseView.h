//
//  SLPPopUpBaseView.h
//  Sleepace
//
//  Created by mac on 8/29/17.
//  Copyright © 2017 YJ. All rights reserved.
//

#import <UIKit/UIKit.h>

#define kAlertAnimationInterval (0.3)
@interface SLPPopUpBaseView : UIView
@property (nonatomic,weak) IBOutlet UIView *maskView;
@property (nonatomic,weak) IBOutlet UIView *contentView;

@property (weak, nonatomic) IBOutlet UIView *bgView;


- (void)showInViewController:(UIViewController *)viewController animated:(BOOL)animated;
- (void)unshowAnimated:(BOOL)animated;
@end
