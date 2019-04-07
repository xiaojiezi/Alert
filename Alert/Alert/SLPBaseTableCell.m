//
//  SLPBaseTableCell.m
//  Sleepace
//
//  Created by mac on 4/6/17.
//  Copyright © 2017 YJ. All rights reserved.
//

#import "SLPBaseTableCell.h"
//#import "SLPCommonUIConsts.h"

#define kBoldLineHeight  (2.0)
#define kDefaultLineHeight (0.5)

@interface SLPBaseTableCell ()
{
    UIView *_selectedForgroundView;
    UIColor *_selectedBackgroundColor;
}
@end

@implementation SLPBaseTableCell
@synthesize selectedForgroundView = _selectedForgroundView;

- (void)awakeFromNib{
    [super awakeFromNib];
    [self setUI];
}

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]){
        [self setUI];
    }
    return self;
}

- (void)setUI{
    [self setBackgroundColor:[UIColor clearColor]];
    [self.contentView setBackgroundColor:[UIColor clearColor]];
    //    [self setUpLineHide:YES];
    //    [self setDownLineHide:YES];
    UIColor *lineColor = SLPThemeColor.lineColor;
    [self.lineUp setBackgroundColor:lineColor];
    [self.lineDown setBackgroundColor:lineColor];
    
    [self setSelectedBackgroundColor:[Utils colorWithRGB:0x1f233b alpha:1.0]];
}

- (void)setSelectedBackgroundColor:(UIColor *)selectedBackgroundColor{
    _selectedBackgroundColor = selectedBackgroundColor;
    
    UIView *selectedView = [[UIView alloc] init];
    selectedView.backgroundColor = selectedBackgroundColor;
    self.selectedBackgroundView = selectedView;
}

- (void)setSelectedForgroundView:(UIView *)selectedForgroundView{
    if (_selectedForgroundView){
        return;
    }
    if (selectedForgroundView){
        _selectedForgroundView = selectedForgroundView;
    }
    [_selectedForgroundView setTranslatesAutoresizingMaskIntoConstraints:NO];
    [self.contentView addSubview:_selectedForgroundView];
    NSDictionary *subViews = NSDictionaryOfVariableBindings(_selectedForgroundView);
    [self.contentView addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-0-[_selectedForgroundView]-0-|" options:0 metrics:nil views:subViews]];
    [self.contentView addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-0-[_selectedForgroundView]-0-|" options:0 metrics:nil views:subViews]];
}

- (void)setHighlighted:(BOOL)highlighted animated:(BOOL)animated{
    if (!self.selectedForgroundView){
        [super setHighlighted:highlighted animated:animated];
    }
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated{
    if (!self.selectedForgroundView){
        [super setSelected:selected animated:animated];
    }
}

- (void)setUpLineHide:(BOOL)hide{
    CGFloat height = 0;
    if (!hide){
        height = kDefaultLineHeight;
    }
    [self.lineUpHeight setConstant:height];
}

- (void)setDownLineHide:(BOOL)hide{
    CGFloat height = 0;
    if (!hide){
        height = kDefaultLineHeight;
    }
    [self.lineDownHeight setConstant:height];
}

- (void)load{
    
}

+ (CGFloat)heightOfCellData:(id)cellData{
    return 0;
}
@end
