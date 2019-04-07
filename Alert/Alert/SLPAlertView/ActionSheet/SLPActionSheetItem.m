//
//  SLPActionSheetItem.m
//  Sleepace
//
//  Created by mac on 9/7/17.
//  Copyright © 2017 YJ. All rights reserved.
//

#import "SLPActionSheetItem.h"

@implementation SLPActionSheetItem

- (id)init{
    if (self = [super init]){
        [self setType:SLPActionSheetItemType_Normal];
    }
    return self;
}

@end
