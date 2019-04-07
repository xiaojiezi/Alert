//
//  SLPActionSheetItemTableCell.m
//  Sleepace
//
//  Created by mac on 9/7/17.
//  Copyright © 2017 YJ. All rights reserved.
//

#import "SLPActionSheetItemTableCell.h"
#import "SLPActionSheetItem.h"

@implementation SLPActionSheetItemTableCell

- (void)awakeFromNib {
    [super awakeFromNib];
}

- (void)load{
    SLPActionSheetItem *item = self.cellData;
    [self.titleLabel setFont:SLPThemeFont.T1];
    UIColor *color = SLPThemeColor.C2;
    if (item.type == SLPActionSheetItemType_Destructive){
        color = SLPThemeColor.C7;
    }
    [self.titleLabel setTextColor:color];
    [self.titleLabel setText:item.title];
}

@end
