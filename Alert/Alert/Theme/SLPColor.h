//
//  SLPColor.h
//  Sleepace
//
//  Created by mac on 4/5/17.
//  Copyright © 2017 YJ. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface SLPColor : NSObject
@property (nonatomic,readonly) UIColor *C1;//主要用于按钮底色描边色，标签栏图标颜色
@property (nonatomic,readonly) UIColor *C1Disable;
@property (nonatomic,readonly) UIColor *C2;//高亮文字，可点击文字，按钮文字
@property (nonatomic,readonly) UIColor *C3;//标题文字，导航栏文字，列表文字，正文文字
@property (nonatomic,readonly) UIColor *C4;//正文文字 提示文字
@property (nonatomic,readonly) UIColor *C5;//分割线 体重要的提示文字 不可点击按钮背景色
@property (nonatomic,readonly) UIColor *C6;//成功提示底色
@property (nonatomic,readonly) UIColor *C7;//异常提示底色
@property (nonatomic,readonly) UIColor *C8;//背景
@property (nonatomic,readonly) UIColor *C9;//白色
@property (nonatomic,readonly) UIColor *C10;//输入框提示文字
@property (nonatomic,readonly) UIColor *C11;//导航栏和tabbar的颜色
@property (nonatomic,readonly) UIColor *C12;//运营类内容背景色

@property (nonatomic,readonly) UIColor *headColor;//头部颜色 不是导航栏
@property (nonatomic,readonly) UIColor *lineColor;//线条的颜色


//较弱
@property (nonatomic,readonly) UIColor *seprator;//用于分割线
@property (nonatomic,readonly) UIColor *placeHolder;//占位文字
@property (nonatomic,readonly) UIColor *inputFieldBorder;//用于输入框内容外框描边

//重要的
@property (nonatomic,readonly) UIColor *positive;//用于文字、按钮、图形 积极含义
@property (nonatomic,readonly) UIColor *neutral1;//用于按钮、图形、辅助文字 中性含义
@property (nonatomic,readonly) UIColor *neutral2;//用于文字、图标 中性含义
@property (nonatomic,readonly) UIColor *selected;//用于选中的文字 图形、图标
@property (nonatomic,readonly) UIColor *warn;//用于按钮、图形 警示含义

//一般
@property (nonatomic,readonly) UIColor *bg1;//用于图形
@property (nonatomic,readonly) UIColor *bg2;//用于图形
@property (nonatomic,readonly) UIColor *bg3;//用于图形
@property (nonatomic,readonly) UIColor *assist1;//用于辅助文字
@property (nonatomic,readonly) UIColor *assist2;//用于辅助文字/次要图标

//按钮
@property (nonatomic,readonly) UIColor *btnPositiveNormal; //积极含义
@property (nonatomic,readonly) UIColor *btnPositiveSelected;//积极含义
@property (nonatomic,readonly) UIColor *btnPositiveDisable;//积极含义

@property (nonatomic,readonly) UIColor *btnWarnNormal;//警示含义
@property (nonatomic,readonly) UIColor *btnWarnSelected;//警示含义

@property (nonatomic,readonly) UIColor *btnWeakNormal;//较弱含义
@property (nonatomic,readonly) UIColor *btnWeakSelected;//较弱含义
@property (nonatomic,readonly) UIColor *btnWeakDisable;//较弱含义

- (UIColor *)colorOf:(UIColor *)color alpha:(CGFloat)alpha;
@end
