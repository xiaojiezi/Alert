//
//  SLPAlert.m
//  SLPAlert
//
//  Created by mac on 4/9/17.
//  Copyright © 2017 YJ. All rights reserved.
//

#import "SLPAlert.h"
#import "SLPAlertView.h"
#import "SLPAlertTipView.h"
#import "SLPTwoAlertView.h"
#import "SLPOneAlertView.h"
#import "SLPURLAlertView.h"
#import "SLPActionSheetView.h"


@implementation SLPAlert

+ (void)showActionSheetInViewController:(UIViewController *)viewController
                              withTitle:(NSString *)title
                               itemList:(NSArray *)itemList
                       destructiveTitle:(NSString *)destructiveTitle
                            cancelTitle:(NSString *)cancelTitle
                           itemCallback:(void(^)(NSInteger index))itemCallback
                    destructiveCallback:(void(^)(void))destructiveCallback
                         cancelCallback:(void(^)(void))cancelCallback{
    SLPActionSheetView *actionSheet = [[[NSBundle mainBundle] loadNibNamed:@"SLPActionSheetView" owner:self options:nil] firstObject];
    [actionSheet setTitle:title itemList:itemList destructiveTitle:destructiveTitle cancelTitle:cancelTitle normalItemClicked:itemCallback destructiveItemClicked:destructiveCallback cancelItemClicked:cancelCallback];
    [actionSheet raiseUpInViewController:viewController Animated:YES];
}

+ (void)showTip:(NSString *)tip level:(SLPTipLevel)level atView:(UIView *)view animated:(BOOL)animated{
    UIView *windowView = [Utils keyWindow];
    SLPAlertTipView *tipView = [[[NSBundle mainBundle] loadNibNamed:@"SLPAlertTipView" owner:self options:nil] firstObject];
    UIColor *bgColor = nil;
    switch (level) {
        case SLPTipLevel_Positive:
            bgColor = SLPThemeColor.C6;
            break;
        case SLPTipLevel_UnPositive:
            bgColor = SLPThemeColor.C7;
            break;
        default:
            break;
    }
    [tipView setBackgroundColor:bgColor];
    [tipView.tipLable setText:tip];
    [tipView showAtView:windowView animated:animated];
}

+ (void)showAlertWithTitle:(NSString *)title
                   message:(NSString *)message
                 leftTitle:(NSString *)leftTitle
                rightTitle:(NSString *)rightTitle
                    handle:(SLPAlertViewCompletion)handle {
    
    CGFloat alertViewWidth = [[UIScreen mainScreen] bounds].size.width * 0.72f;
    
    SCLAlertView *alert = [[SCLAlertView alloc] initWithNewWindowWidth:alertViewWidth];
    [alert removeTopCircle];
    [alert.labelTitle setFont:SLPThemeFont.T1];
    [alert.labelTitle setTextColor:SLPThemeColor.C3];
    [alert setButtonsTextFontFamily:@"HelveticaNeue" withSize:15];
    [alert setHideAnimationType:SCLAlertViewHideAnimationSlideOutToCenter];
    
    alert.attributedFormatBlock = ^NSAttributedString* (NSString *value)
    {
        NSMutableAttributedString *subTitle = [[NSMutableAttributedString alloc]initWithString:value];
        NSMutableParagraphStyle *paragraphStyle = [[NSMutableParagraphStyle alloc] init];
        paragraphStyle.alignment = NSTextAlignmentJustified;
        paragraphStyle.minimumLineHeight = 14 + 6;
        paragraphStyle.maximumLineHeight = paragraphStyle.minimumLineHeight;
        paragraphStyle.hyphenationFactor = 0.97;
        NSDictionary *attributes = @{
                                     NSFontAttributeName:SLPThemeFont.T4,
                                     NSParagraphStyleAttributeName:paragraphStyle,
                                     NSForegroundColorAttributeName:SLPThemeColor.C4,
                                     };
        NSRange rang = [value rangeOfString:message options:NSCaseInsensitiveSearch];
        [subTitle addAttributes:attributes range:rang];
        return subTitle;
    };
    
    NSString *lTitle = nil;
    NSString *rTitle = nil;
    
    if (leftTitle && rightTitle) {
        lTitle = leftTitle;
        rTitle = rightTitle;
        [alert setHorizontalButtons:YES];
    } else {
        if (leftTitle) {
            rTitle = leftTitle;
        } else {
            rTitle = rightTitle;
        }
    }
    
    if (lTitle) {
        SCLButton *leftButton = [alert addButton:lTitle actionBlock:^(void) {
            if (handle) {
                handle(TappedButtonTypeLeft);
            }
        }];
        
        leftButton.buttonFormatBlock = ^NSDictionary* (void)
        {
            NSMutableDictionary *buttonConfig = [[NSMutableDictionary alloc] init];
            
            buttonConfig[@"backgroundColor"] = SLPThemeColor.C9;
            buttonConfig[@"textColor"] = SLPThemeColor.C1;
            buttonConfig[@"borderWidth"] = @2.0f;
            buttonConfig[@"borderColor"] = SLPThemeColor.C1;
            
            return buttonConfig;
        };
    }
    
    if (rTitle) {
        SCLButton *rightButton = [alert addButton:rTitle actionBlock:^(void) {
            if (handle) {
                handle(TappedButtonTypeRight);
            }
        }];
        
        rightButton.buttonFormatBlock = ^NSDictionary* (void)
        {
            NSMutableDictionary *buttonConfig = [[NSMutableDictionary alloc] init];
            
            buttonConfig[@"backgroundColor"] = SLPThemeColor.C1;
            buttonConfig[@"textColor"] = SLPThemeColor.C9;
            buttonConfig[@"borderWidth"] = @2.0f;
            buttonConfig[@"borderColor"] = SLPThemeColor.C1;
            
            return buttonConfig;
        };
    }
    //animation type
    alert.showAnimationType=SCLAlertViewShowAnimationSlideInToCenter;
    [alert showSuccess:title subTitle:message closeButtonTitle:nil duration:0.0f];
}


+ (void)hideAlertView
{
    
    
}

+ (void)showVerticalAlertWithTitle:(NSString *)title
                           message:(NSString *)message
                          TopTitle:(NSString *)topTitle
                       BottomTitle:(NSString *)bottomTitle
                      animatedType:(SCLAlertViewShowAnimation)animtionType
                            handle:(SLPAlertViewCompletion)handle
{
    CGFloat alertViewWidth = [[UIScreen mainScreen] bounds].size.width * 0.8f;
    
    SCLAlertView *alert = [[SCLAlertView alloc] initWithNewWindowWidth:alertViewWidth];
    [alert removeTopCircle];
    [alert.labelTitle setFont:SLPThemeFont.T1];
    [alert.labelTitle setTextColor:SLPThemeColor.C3];
    [alert setButtonsTextFontFamily:@"HelveticaNeue" withSize:15];
    [alert setHideAnimationType:SCLAlertViewHideAnimationSlideOutToCenter];
    
    alert.attributedFormatBlock = ^NSAttributedString* (NSString *value)
    {
        NSMutableAttributedString *subTitle = [[NSMutableAttributedString alloc]initWithString:value];
        NSMutableParagraphStyle *paragraphStyle = [[NSMutableParagraphStyle alloc] init];
        paragraphStyle.alignment = NSTextAlignmentJustified;
        paragraphStyle.minimumLineHeight = 14 + 6;
        paragraphStyle.maximumLineHeight = paragraphStyle.minimumLineHeight;
        paragraphStyle.hyphenationFactor = 0.97;
        NSDictionary *attributes = @{
                                     NSFontAttributeName:SLPThemeFont.T4,
                                     NSParagraphStyleAttributeName:paragraphStyle,
                                     NSForegroundColorAttributeName:SLPThemeColor.C4,
                                     };
        NSRange rang = [value rangeOfString:message options:NSCaseInsensitiveSearch];
        [subTitle addAttributes:attributes range:rang];
        return subTitle;
    };
    
    NSString *tTitle = nil;
    NSString *bTitle = nil;
    
    if (topTitle && bottomTitle) {
        tTitle = topTitle;
        bTitle = bottomTitle;
        [alert setHorizontalButtons:NO];
    } else {
        if (topTitle) {
            tTitle = topTitle;
        } else {
            bTitle = bottomTitle;
        }
    }
    
    if (tTitle) {
        SCLButton *topButton = [alert addButton:tTitle actionBlock:^(void) {
            if (handle) {
                handle(TappedButtonTypeTop);
            }
        }];
        
        topButton.buttonFormatBlock = ^NSDictionary* (void)
        {
            NSMutableDictionary *buttonConfig = [[NSMutableDictionary alloc] init];
            
            buttonConfig[@"backgroundColor"] = SLPThemeColor.C1;
            buttonConfig[@"textColor"] = SLPThemeColor.C9;
            buttonConfig[@"borderWidth"] = @2.0f;
            buttonConfig[@"borderColor"] = SLPThemeColor.C1;
            
            return buttonConfig;
        };
    }
    
    if (bTitle) {
        SCLButton *bottomButton = [alert addButton:bTitle actionBlock:^(void) {
            if (handle) {
                handle(TappedButtonTypeBottom);
            }
        }];
        
        bottomButton.buttonFormatBlock = ^NSDictionary* (void)
        {
            NSMutableDictionary *buttonConfig = [[NSMutableDictionary alloc] init];
            
            buttonConfig[@"backgroundColor"] = SLPThemeColor.C9;
            buttonConfig[@"textColor"] = SLPThemeColor.C1;
            buttonConfig[@"borderWidth"] = @2.0f;
            buttonConfig[@"borderColor"] = SLPThemeColor.C9;
            
            return buttonConfig;
        };
    }
    
    if (animtionType) {
        alert.showAnimationType=animtionType;
    }
    
    [alert showSuccess:title subTitle:message closeButtonTitle:nil duration:0.0f];
}


+ (void)showAlertViewInViewController:(UIViewController *)viewController
                            withTitle:(NSString *)title message:(NSString *)message
                          cancelTitle:(NSString *)cancelTitle
                         confirmTitle:(NSString *)confirmTitle
                             animated:(BOOL)animated
                           completion:(SLPAlertCompletion)completion{
    if (title.length > 0 && message.length == 0){
        message = title;
    }
    
    if (message.length == 0){
        message = @" ";
    }
    
    if (cancelTitle.length > 0 && confirmTitle.length == 0){
        confirmTitle = cancelTitle;
        cancelTitle = nil;
    }
    if (confirmTitle.length == 0){
        confirmTitle = @" ";
    }
    SLPAlertView *alertView = nil;
    if (cancelTitle.length == 0){
        SLPOneAlertView *alert = [[[NSBundle mainBundle] loadNibNamed:@"SLPOneAlertView" owner:self options:nil] firstObject];
        [alert setTitle:title message:message confirmTitle:confirmTitle completion:completion];
        alertView = alert;
    }else{
        SLPTwoAlertView *alert = [[[NSBundle mainBundle] loadNibNamed:@"SLPTwoAlertView" owner:self options:nil] firstObject];
        [alert.cancelButton setTitle:cancelTitle forState:UIControlStateNormal];
        [alert.confirmButton setTitle:confirmTitle forState:UIControlStateNormal];
        [alert setTitle:title message:message cacelTitle:cancelTitle confirmTitle:confirmTitle completion:completion];
        alertView = alert;
    }
    
    [alertView showInViewController:viewController animated:YES];
}

/*AlertView提示框
 title：标题 可以为空
 message：内容 不能为空
 confirmTitle:确定 不能为空
 clickableTitle：可以点击的label 不能为空
 completion 点击返回
 */
+ (void)showAlertViewInViewController:(UIViewController *)viewController
                            withTitle:(NSString *)title
                              message:(NSString *)message
                         confirmTitle:(NSString *)confirmTitle
                       clickableTitle:(NSString *)clickableTitle
                             animated:(BOOL)animated
                           completion:(SLPAlertCompletion)completion{
    if (title.length > 0 && message.length == 0){
        message = title;
    }
    
    if (message.length == 0){
        message = @" ";
    }
    
    if (confirmTitle.length == 0){
        confirmTitle = @" ";
    }
    NSAssert(clickableTitle.length != 0, @"clickable title can not be nil");
    SLPURLAlertView *alertView = [[[NSBundle mainBundle] loadNibNamed:@"SLPURLAlertView" owner:self options:nil] firstObject];
    [alertView setTitle:title message:message confirmTitle:confirmTitle clickableTitle:clickableTitle completion:completion];
    [alertView showInViewController:viewController animated:YES];
    
}

+ (void)showAlertViewInViewController:(UIViewController *)viewController
                            withTitle:(NSString *)title
                              message:(NSString *)message
                         confirmTitle:(NSString *)confirmTitle
                       clickableTitle:(NSString *)clickableTitle
                          closeButton:(BOOL)isHave
                             animated:(BOOL)animated
                           completion:(SLPAlertCompletion)completion
{
    if (title.length > 0 && message.length == 0){
        message = title;
    }
    
    if (message.length == 0){
        message = @" ";
    }
    
    if (confirmTitle.length == 0){
        confirmTitle = @" ";
    }
    NSAssert(clickableTitle.length != 0, @"clickable title can not be nil");
    SLPURLAlertView *alertView = [[[NSBundle mainBundle] loadNibNamed:@"SLPURLAlertView" owner:self options:nil] firstObject];
    [alertView setTitle:title message:message confirmTitle:confirmTitle clickableTitle:clickableTitle closeButton:isHave completion:completion];
    [alertView showInViewController:viewController animated:YES];
}
@end
