//
//  SLPActionSheetItem.h
//  Sleepace
//
//  Created by mac on 9/7/17.
//  Copyright © 2017 YJ. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef NS_ENUM(NSInteger,SLPActionSheetItemType) {
    SLPActionSheetItemType_Normal = 0,
    SLPActionSheetItemType_Cancel,
    SLPActionSheetItemType_Destructive,
};

@interface SLPActionSheetItem : NSObject
@property (nonatomic,copy) NSString *title;
@property (nonatomic,assign) SLPActionSheetItemType type;

@end
