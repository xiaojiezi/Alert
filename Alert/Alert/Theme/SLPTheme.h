//
//  SLPTheme.h
//  Sleepace
//
//  Created by mac on 4/5/17.
//  Copyright © 2017 YJ. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "SLPFont.h"
#import "SLPColor.h"
#import "SLPResource.h"
#import "SLPFrame.h"

#define SLPThemeFont [SLPTheme theme].font
#define SLPThemeColor [SLPTheme theme].color
#define SLPThemeResource [SLPTheme theme].resource
#define SLPThemeFrame [SLPTheme theme].frame

@interface SLPTheme : NSObject
@property (nonatomic,readonly) SLPFont *font;
@property (nonatomic,readonly) SLPColor *color;
@property (nonatomic,readonly) SLPResource *resource;
@property (nonatomic,readonly) SLPFrame *frame;

+ (SLPTheme *)theme;
@end
