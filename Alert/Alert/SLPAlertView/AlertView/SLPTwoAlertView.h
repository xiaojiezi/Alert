//
//  SLPTwoAlertView.h
//  Sleepace
//
//  Created by mac on 8/23/17.
//  Copyright © 2017 YJ. All rights reserved.
//

#import "SLPAlertView.h"
#import "SLPBorderButton.h"

@interface SLPTwoAlertView : SLPAlertView
@property (nonatomic,weak) IBOutlet SLPBorderButton *cancelButton;
@property (nonatomic,weak) IBOutlet UIButton *confirmButton;

- (void)setTitle:(NSString *)title message:(NSString *)message cacelTitle:(NSString *)cancelTitle
    confirmTitle:(NSString *)confirmTitle completion:(SLPAlertCompletion)completion;
@end
