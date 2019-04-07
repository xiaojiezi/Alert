//
//  SLPFont.m
//  Sleepace
//
//  Created by mac on 4/5/17.
//  Copyright © 2017 YJ. All rights reserved.
//

#import "SLPFont.h"

@implementation SLPFont

- (UIFont *)fontWithSize:(CGFloat)size weight:(SLPFontWeight)weight{
    NSString *fontName = nil;
    switch (weight) {
        case SLPFontWeight_Thin:
            fontName = @"HelveticaNeue-Thin";
            break;
        case SLPFontWeight_Regular:
            fontName = @"HelveticaNeue";
            break;
        case SLPFontWeight_Bold:
            fontName = @"Helvetica-Bold";
            break;
        default:
            break;
    }
    UIFont *font = [UIFont fontWithName:fontName size:size];
    return font;
}

- (UIFont *)T1{
    return [Utils fontWithSize:17];
}

- (UIFont *)T2{
    return [Utils fontWithSize:16];
}

- (UIFont *)T3{
    return [Utils fontWithSize:15];
}

- (UIFont *)T4{
    return [Utils fontWithSize:14];
}

- (UIFont *)T5{
    return [Utils fontWithSize:13];
}

- (UIFont *)T6{
    return [Utils fontWithSize:12];
}

- (UIFont *)T7{
    return [Utils fontWithSize:10];
}

- (CGFloat)t1LineGap{
    return 5.0;
}

- (CGFloat)t2LineGap{
    return 5.0;
}

- (CGFloat)t3LineGap{
    return 3.0;
}

- (CGFloat)t4LineGap{
    return 3.0;
}

- (CGFloat)t5LineGap{
    return 2.0;
}

- (CGFloat)t6LineGap{
    return 2.0;
}

- (CGFloat)t7LineGap{
    return 2.0;
}

- (UIFont *)weak1{
    return [self fontWithSize:9 weight:SLPFontWeight_Thin];
}

- (UIFont *)weak2{
    return [self fontWithSize:11 weight:SLPFontWeight_Thin];
}

- (UIFont *)body{
    return [self fontWithSize:12 weight:SLPFontWeight_Regular];
}

- (UIFont *)tag{
    return [self fontWithSize:14 weight:SLPFontWeight_Thin];
}

- (UIFont *)tinyTitle{
    return [self fontWithSize:16 weight:SLPFontWeight_Thin];
}

- (UIFont *)title{
    return [self fontWithSize:18 weight:SLPFontWeight_Regular];
}

- (UIFont *)bigTitle{
    return [self fontWithSize:20 weight:SLPFontWeight_Regular];
}

- (UIFont *)display1{
    return [self fontWithSize:28 weight:SLPFontWeight_Thin];
}

- (UIFont *)display2{
    return [self fontWithSize:40 weight:SLPFontWeight_Thin];
}

- (UIFont *)display3{
    return [self fontWithSize:70 weight:SLPFontWeight_Thin];
}
@end
