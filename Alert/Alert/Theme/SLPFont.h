//
//  SLPFont.h
//  Sleepace
//
//  Created by mac on 4/5/17.
//  Copyright © 2017 YJ. All rights reserved.
//

#import <Foundation/Foundation.h>

#import <UIKit/UIKit.h>

typedef NS_ENUM(NSInteger,SLPFontWeight) {
    SLPFontWeight_Thin,
    SLPFontWeight_Regular,
    SLPFontWeight_Bold,
};

@interface SLPFont : NSObject
@property (nonatomic,readonly) UIFont *T1;//导航栏标题文字 常规按钮文字
@property (nonatomic,readonly) CGFloat t1LineGap;//T1字体的行高
@property (nonatomic,readonly) UIFont *T2;//导航栏操作文字
@property (nonatomic,readonly) CGFloat t2LineGap;//T2字体的行高
@property (nonatomic,readonly) UIFont *T3;//正文文字 其他按钮文字
@property (nonatomic,readonly) CGFloat t3LineGap;//T3字体的行高
@property (nonatomic,readonly) UIFont *T4;//正文文字
@property (nonatomic,readonly) CGFloat t4LineGap;//T3字体的行高
@property (nonatomic,readonly) UIFont *T5;//提示文字
@property (nonatomic,readonly) CGFloat t5LineGap;//T3字体的行高
@property (nonatomic,readonly) UIFont *T6;//很弱提示文字
@property (nonatomic,readonly) CGFloat t6LineGap;//T3字体的行高
@property (nonatomic,readonly) UIFont *T7;//标签文字
@property (nonatomic,readonly) CGFloat t7LineGap;//T3字体的行高


//字体从小到大
//较弱 用于辅助性文字
@property (nonatomic,readonly) UIFont *weak1;
@property (nonatomic,readonly) UIFont *weak2;

//一般
@property (nonatomic,readonly) UIFont *body;//用于大段文字
@property (nonatomic,readonly) UIFont *tag;//用于标签栏、辅助文字
@property (nonatomic,readonly) UIFont *tinyTitle;//用于列表、小标题
@property (nonatomic,readonly) UIFont *title;//用于标题栏
@property (nonatomic,readonly) UIFont *bigTitle;//用于大标题

//用在少数重要的数据显示
@property (nonatomic,readonly) UIFont *display1;
@property (nonatomic,readonly) UIFont *display2;
@property (nonatomic,readonly) UIFont *display3;

- (UIFont *)fontWithSize:(CGFloat)size weight:(SLPFontWeight)weight;
@end
