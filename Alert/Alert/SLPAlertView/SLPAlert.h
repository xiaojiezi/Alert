//
//  SLPAlert.h
//  SLPAlert
//
//  Created by mac on 4/9/17.
//  Copyright © 2017 YJ. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SLPAlertHandle.h"
#import "SCLAlertView.h"
#import "SLPAlertView.h"

typedef NS_ENUM(NSInteger,SLPTipLevel) {
    SLPTipLevel_Positive,//积极的 比如注册成功
    SLPTipLevel_UnPositive,//不积极的 比如注册失败
};

@interface SLPAlert : NSObject

/*AlertView提示框
 title：标题 可以为空
 message：内容 不能为空
 cancelTitle:取消 可以为空
 confirmTitle:确定 不能为空
 completion 点击返回
 */
+ (void)showAlertViewInViewController:(UIViewController *)viewController
                            withTitle:(NSString *)title
                              message:(NSString *)message
                          cancelTitle:(NSString *)cancelTitle
                         confirmTitle:(NSString *)confirmTitle
                                animated:(BOOL)animated
                           completion:(SLPAlertCompletion)completion;

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
                           completion:(SLPAlertCompletion)completion;
/*AlertView提示框
 title：标题 可以为空
 message：内容 不能为空
 confirmTitle:确定 不能为空
 clickableTitle：可以点击的label 不能为空
 isHave:是否有关闭按钮
 completion 点击返回
 */
+ (void)showAlertViewInViewController:(UIViewController *)viewController
                            withTitle:(NSString *)title
                              message:(NSString *)message
                         confirmTitle:(NSString *)confirmTitle
                       clickableTitle:(NSString *)clickableTitle
                          closeButton:(BOOL)isHave
                             animated:(BOOL)animated
                           completion:(SLPAlertCompletion)completion;

///提示框
+ (void)showVerticalAlertWithTitle:(NSString *)title
                           message:(NSString *)message
                          TopTitle:(NSString *)topTitle
                       BottomTitle:(NSString *)bottomTitle
                      animatedType:(SCLAlertViewShowAnimation)animtionType
                            handle:(SLPAlertViewCompletion)handle;

+ (void)showActionSheetInViewController:(UIViewController *)viewController
                              withTitle:(NSString *)title
                               itemList:(NSArray *)itemList
                       destructiveTitle:(NSString *)destructiveTitle
                            cancelTitle:(NSString *)cancelTitle
                            itemCallback:(void(^)(NSInteger index))itemCallback
                     destructiveCallback:(void(^)(void))destructiveCallback
                         cancelCallback:(void(^)(void))cancelCallback;

/*提示语
 应用场景：比如注册成功、注册失败
 tip    :提示语
 level  :提示语的级别
 view   :在哪个view上提示，为nil的时候默认为keywindow。
 */
+ (void)showTip:(NSString *)tip level:(SLPTipLevel)level atView:(UIView *)view animated:(BOOL)animated;
@end
