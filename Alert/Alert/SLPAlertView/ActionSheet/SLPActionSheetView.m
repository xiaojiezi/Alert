//
//  SLPActionSheet1View.m
//  Sleepace
//
//  Created by mac on 9/6/17.
//  Copyright © 2017 YJ. All rights reserved.
//

#import "SLPActionSheetView.h"
#import "SLPActionSheetItem.h"
#import "SLPActionSheetItemTableCell.h"

#define kActionSheetItemHeight (60.0)
@interface SLPActionSheetView ()<UITableViewDelegate,UITableViewDataSource>
@property (nonatomic,weak) IBOutlet NSLayoutConstraint *titleTopEdge;
@property (nonatomic,weak) IBOutlet UILabel *titleLabel;
@property (nonatomic,weak) IBOutlet NSLayoutConstraint *tableViewTopEdge;
@property (nonatomic,weak) IBOutlet UITableView *tableView;
@property (nonatomic,weak) IBOutlet NSLayoutConstraint *tableViewHeight;

@property (nonatomic,strong) NSMutableArray<SLPActionSheetItem *> *itemList;

@property (nonatomic,copy) void(^normalItemClicked)(NSInteger index);
@property (nonatomic,copy) void(^destructiveItemClicked)(void);
@property (nonatomic,copy) void(^cancelItemClicked)(void);
@end

@implementation SLPActionSheetView

- (void)awakeFromNib{
    [super awakeFromNib];
    [self.tableView setBounces:NO];
    [self.tableView setAlwaysBounceVertical:NO];
    [self.tableView setAlwaysBounceHorizontal:NO];
    [self.tableView setScrollEnabled:NO];
    [self.titleLabel setFont:SLPThemeFont.T3];
    [self.titleLabel setTextColor:SLPThemeColor.C4];
    self.itemList = [NSMutableArray array];
}

- (void)setTitle:(NSString *)title itemList:(NSArray *)itemList
        destructiveTitle:(NSString *)destructiveTitle cancelTitle:(NSString *)cancelTitle
        normalItemClicked:(void(^)(NSInteger index))normalItemClicked
        destructiveItemClicked:(void(^)())destructiveItemClicked
        cancelItemClicked:(void(^)())cancelItemClicked{
    if (title.length > 0){
        [Utils setLable:self.titleLabel text:title font:SLPThemeFont.T3 lineGap:SLPThemeFont.t3LineGap];
        [self.titleLabel setTextAlignment:NSTextAlignmentCenter];
    }else{
        [self.titleLabel setText:nil];
        [self.titleTopEdge setConstant:0];
        [self.tableViewTopEdge setConstant:0];
    }
    
    for (NSString *aTitle in itemList){
        SLPActionSheetItem *item = [SLPActionSheetItem new];
        [item setTitle:aTitle];
        [item setType:SLPActionSheetItemType_Normal];
        [self.itemList addObject:item];
    }
    
    if (destructiveTitle.length > 0){
        SLPActionSheetItem *item = [SLPActionSheetItem new];
        [item setTitle:destructiveTitle];
        [item setType:SLPActionSheetItemType_Destructive];
        [self.itemList addObject:item];
    }
    
    if (cancelTitle.length > 0){
        SLPActionSheetItem *item = [SLPActionSheetItem new];
        [item setTitle:cancelTitle];
        [item setType:SLPActionSheetItemType_Cancel];
        [self.itemList addObject:item];
    }
    NSInteger count = [self.itemList count];
    [self.tableViewHeight setConstant:count * kActionSheetItemHeight];
    [self.tableView reloadData];
    [self setNormalItemClicked:normalItemClicked];
    [self setDestructiveItemClicked:destructiveItemClicked];
    [self setCancelItemClicked:cancelItemClicked];
    
    [self updateConstraintsIfNeeded];
    [self setNeedsLayout];
    [self layoutIfNeeded];
}

#pragma mark UITableViewDelegate
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    NSInteger row = [self.itemList count];
    return row;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return kActionSheetItemHeight;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *identifier = @"identifier";
    SLPActionSheetItemTableCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    if (!cell){
        [tableView registerNib:[UINib nibWithNibName:@"SLPActionSheetItemTableCell" bundle:nil] forCellReuseIdentifier:identifier];
        cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    }
    SLPActionSheetItem *item = [self.itemList objectAtIndex:indexPath.row];
    [cell setCellData:item];
    [cell load];
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    NSInteger row = indexPath.row;
    SLPActionSheetItem *item = [self.itemList objectAtIndex:row];
    switch (item.type) {
        case SLPActionSheetItemType_Normal:
            if (self.normalItemClicked){
                self.normalItemClicked(row);
            }
            break;
        case SLPActionSheetItemType_Cancel:
            if (self.cancelItemClicked){
                self.cancelItemClicked();
            }
            break;
        case SLPActionSheetItemType_Destructive:
            if (self.destructiveItemClicked){
                self.destructiveItemClicked();
            }
            break;
        default:
            break;
    }
    [self dropDownAnimated:YES];
}

@end
