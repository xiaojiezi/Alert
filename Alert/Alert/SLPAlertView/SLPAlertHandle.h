//
//  SLPAlertHandle.h
//  SLPAlert
//
//  Created by mac on 4/9/17.
//  Copyright © 2017 YJ. All rights reserved.
//

#ifndef SLPAlertHandle_h
#define SLPAlertHandle_h

typedef NS_ENUM(NSInteger, TappedButtonType) {
    TappedButtonTypeLeft = 0,
    TappedButtonTypeRight,
    TappedButtonTypeTop,
    TappedButtonTypeBottom,
    
};
typedef void(^SLPAlertViewCompletion)(TappedButtonType type);

#endif /* SLPAlertHandle_h */
