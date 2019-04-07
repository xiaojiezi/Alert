//
//  SLPBaseTableCell.h
//  Sleepace
//
//  Created by mac on 4/6/17.
//  Copyright © 2017 YJ. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SLPBaseTableCell : UITableViewCell
@property (nonatomic,strong) id cellData;

/*自定义cell上下的线,如果没有线 请忽略下面的属性
 如果需要线~ 将cell的内容设置在line up 和line down之间
 */
@property (nonatomic,weak) IBOutlet UIView *lineUp;//上边的线
@property (nonatomic,weak) IBOutlet NSLayoutConstraint *lineUpHeight;
@property (nonatomic,weak) IBOutlet UIView *lineDown;//下边的线
@property (nonatomic,weak) IBOutlet NSLayoutConstraint *lineDownHeight;
/*选中时的背景图 reload的时候也可以显示。
 系统的selectedBackgroundView在reload之后就会消失掉 不能记录选中状态 不易控制。
 */
@property (nonatomic,strong) UIView *selectedForgroundView;
@property (nonatomic,strong) UIColor *selectedBackgroundColor;

- (void)setUpLineHide:(BOOL)hide;
- (void)setDownLineHide:(BOOL)hide;

- (void)load;
+ (CGFloat)heightOfCellData:(id)cellData;
@end
