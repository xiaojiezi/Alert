//
//  SLPTheme.m
//  Sleepace
//
//  Created by mac on 4/5/17.
//  Copyright © 2017 YJ. All rights reserved.
//

#import "SLPTheme.h"

@interface SLPTheme ()
{
    SLPFont     *_font;
    SLPColor    *_color;
    SLPResource *_resource;
    SLPFrame    *_frame;
}
@end

@implementation SLPTheme
@synthesize font = _font;
@synthesize color = _color;
@synthesize resource = _resource;
@synthesize frame = _frame;

+ (SLPTheme *)theme{
    static dispatch_once_t onceToken;
    static SLPTheme *sharedInstance = nil;
    dispatch_once(&onceToken, ^{
        sharedInstance = [[SLPTheme alloc] init];
    });
    return sharedInstance;
}

- (id)init{
    if (self = [super init]){
        _font = [[SLPFont alloc] init];
        _color = [[SLPColor alloc] init];
        _resource = [[SLPResource alloc] init];
        _frame = [[SLPFrame alloc] init];
    }
    return self;
}

@end
