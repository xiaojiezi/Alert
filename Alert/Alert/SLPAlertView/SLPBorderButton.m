//
//  SLPBorderButton.m
//  Sleepace
//
//  Created by mac on 7/5/17.
//  Copyright © 2017 YJ. All rights reserved.
//

#import "SLPBorderButton.h"

@implementation SLPBorderButton

- (void)setBorderColor:(UIColor *)color{
    //设置layer
    CALayer *layer=[self layer];
    //是否设置边框以及是否可见
    [layer setMasksToBounds:YES];
    [layer setBorderWidth:1.0];
    //设置边框线的颜色
    [layer setBorderColor:[color CGColor]];
}

- (void)setSelected:(BOOL)selected{
    [super setSelected:selected];
    
    if (selected){
        if (self.borderSelectedColor){
            [self setBorderColor:self.borderSelectedColor];
        }
    }else{
        if (self.borderNormalColor){
            [self setBorderColor:self.borderNormalColor];
        }
    }
    
}

- (void)setEnabled:(BOOL)enabled{
    [super setEnabled:enabled];
    
    if (enabled){
        if (self.borderNormalColor){
            [self setBorderColor:self.borderNormalColor];
        }
    }else{
        if (self.borderDisableColor){
            [self setBorderColor:self.borderDisableColor];
        }
    }
}

- (void)setHighlighted:(BOOL)highlighted{
    [super setHighlighted:highlighted];
    
    if (highlighted){
        if (self.borderSelectedColor){
            [self setBorderColor:self.borderSelectedColor];
        }
    }else{
        if (self.borderNormalColor){
            [self setBorderColor:self.borderNormalColor];
        }
    }
}
@end
