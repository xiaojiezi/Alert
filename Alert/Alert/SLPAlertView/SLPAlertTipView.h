//
//  SLPAlertTipView.h
//  Sleepace
//
//  Created by mac on 6/28/17.
//  Copyright © 2017 YJ. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SLPAlertTipView : UIView
@property (nonatomic,weak) IBOutlet UILabel *tipLable;

- (void)showAtView:(UIView *)view animated:(BOOL)animated;

@end
