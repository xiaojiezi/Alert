//
//  SLPFrame.h
//  Sleepace
//
//  Created by mac on 6/2/17.
//  Copyright © 2017 YJ. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface SLPFrame : NSObject
@property (nonatomic,readonly) CGFloat cellTxtEdgeGap;//cell 文字边距
@property (nonatomic,readonly) CGFloat cellIconEdgeGap;//cell Icon边距
@property (nonatomic,readonly) CGFloat cellHeight;//cell 高度
@property (nonatomic,readonly) CGFloat lineHeight;//线高度
@property (nonatomic,readonly) CGFloat borderRadius;//边框的弧度
@end
