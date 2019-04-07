//
//  SLPOneAlertView.h
//  Sleepace
//
//  Created by mac on 8/23/17.
//  Copyright © 2017 YJ. All rights reserved.
//

#import "SLPAlertView.h"

@interface SLPOneAlertView : SLPAlertView
@property (nonatomic,weak) IBOutlet UIButton *confirmButton;

- (void)setTitle:(NSString *)title message:(NSString *)message
    confirmTitle:(NSString *)confirmTitle completion:(SLPAlertCompletion)completion;
@end
