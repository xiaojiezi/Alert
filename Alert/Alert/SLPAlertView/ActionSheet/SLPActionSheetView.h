//
//  SLPActionSheet1View.h
//  Sleepace
//
//  Created by mac on 9/6/17.
//  Copyright © 2017 YJ. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SLPRaiseUpBaseView.h"

@interface SLPActionSheetView : SLPRaiseUpBaseView

- (void)setTitle:(NSString *)title itemList:(NSArray *)itemList
            destructiveTitle:(NSString *)destructiveTitle cancelTitle:(NSString *)cancelTitle
            normalItemClicked:(void(^)(NSInteger index))normalItemClicked
            destructiveItemClicked:(void(^)())destructiveItemClicked
            cancelItemClicked:(void(^)())cancelItemClicked;
@end
