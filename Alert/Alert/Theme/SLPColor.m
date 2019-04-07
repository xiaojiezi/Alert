//
//  SLPColor.m
//  Sleepace
//
//  Created by mac on 4/5/17.
//  Copyright © 2017 YJ. All rights reserved.
//

#import "SLPColor.h"

@implementation SLPColor

- (UIColor *)C1{
    return [Utils colorWithRGB:0x6d7acf alpha:1.0];
}

- (UIColor *)C1Disable{
    return [Utils colorWithRGB:0x6d7acf alpha:0.5];
}

- (UIColor *)C2{
    return [Utils colorWithRGB:0x7986ff alpha:1.0];
}

- (UIColor *)C3{
    return [Utils colorWithRGB:0xbcc2ea alpha:1.0];
}

- (UIColor *)C4{
    return [Utils colorWithRGB:0x747db1 alpha:1.0];
}

- (UIColor *)C5{
    return [Utils colorWithRGB:0xffffff alpha:0.05];
}

- (UIColor *)C6{
    return [Utils colorWithRGB:0x14cf67 alpha:1.0];
}

- (UIColor *)C7{
    return [Utils colorWithRGB:0xff4949 alpha:1.0];
}

- (UIColor *)C8{
    return [Utils colorWithRGB:0x222642 alpha:1.0];
}

- (UIColor *)C9{
    return [Utils colorWithRGB:0xffffff alpha:1.0];
}

- (UIColor *)C10{
    return [Utils colorWithRGB:0x353b66 alpha:1.0];
}

- (UIColor *)C11{
    return [Utils colorWithRGB:0x1d2036 alpha:1.0];
}

- (UIColor *)C12{
    return [Utils colorWithRGB:0x4d5582 alpha:1.0];
}

- (UIColor *)headColor{
    return [Utils colorWithRGB:0x282e53 alpha:1.0];
}

- (UIColor *)colorOf:(UIColor *)color alpha:(CGFloat)alpha{
    CGFloat r,g,b;
    
    [color getRed:&r green:&g blue:&b alpha:nil];
    return [UIColor colorWithRed:r green:g blue:b alpha:alpha];
}

- (UIColor *)lineColor{
    UIColor *c5 = self.C5;
    CGFloat r,g,b;
    [c5 getRed:&r green:&g blue:&b alpha:nil];
    UIColor *lineColor = [UIColor colorWithRed:r green:g blue:b alpha:0.05];
    return lineColor;
}

- (UIColor *)seprator{
    return [Utils colorWithRGB:0xFFFFFF alpha:0.05];
}

- (UIColor *)placeHolder{
    return [Utils colorWithRGB:0xffffff alpha:0.5];
}

- (UIColor *)inputFieldBorder{
    return [Utils colorWithRGB:0xFFFFFF alpha:0.3];
}

- (UIColor *)positive{
    return [Utils colorWithRGB:0x04c979 alpha:0.1];
}

- (UIColor *)neutral1{
    return [Utils colorWithRGB:0x4d60bf alpha:0.1];
}

- (UIColor *)neutral2{
    return [Utils colorWithRGB:0xFFFFFF alpha:0.1];
}

- (UIColor *)selected{
    return [Utils colorWithRGB:0x0adbff alpha:0.1];
}

- (UIColor *)warn{
    return [Utils colorWithRGB:0xed8a61 alpha:0.1];
}

- (UIColor *)bg1{
    return [Utils colorWithRGB:0x0da6fc alpha:0.1];
}

- (UIColor *)bg2{
    return [Utils colorWithRGB:0xe6d665 alpha:0.1];
}

- (UIColor *)bg3{
    return [Utils colorWithRGB:0x1662f9 alpha:0.1];
}

- (UIColor *)assist1{
    return [Utils colorWithRGB:0x77afcf alpha:0.1];
}

- (UIColor *)assist2{
    return [Utils colorWithRGB:0xFFFFFF alpha:0.1];
}

//按钮
- (UIColor *)btnPositiveNormal{
    return [Utils colorWithRGB:0x04c979 alpha:0.0];
}

- (UIColor *)btnPositiveSelected{
    return [Utils colorWithRGB:0x00b368 alpha:0.1];
}

- (UIColor *)btnPositiveDisable{
    return [Utils colorWithRGB:0xFFFFFF alpha:0.2];
}

- (UIColor *)btnWarnNormal{
    return [Utils colorWithRGB:0xed8a61 alpha:0.1];
}

- (UIColor *)btnWarnSelected{
    return [Utils colorWithRGB:0xcc6e46 alpha:0.1];
}

- (UIColor *)btnWeakNormal{
    return [Utils colorWithRGB:0xFFFFFF alpha:0.1];
}

- (UIColor *)btnWeakSelected{
    return [Utils colorWithRGB:0xFFFFFF alpha:0.3];
}

- (UIColor *)btnWeakDisable{
    return [Utils colorWithRGB:0xFFFFFF alpha:0.2];
}
@end
