//
//  MXBaseTableViewController.h
//  TableViewControllerDemo
//
//  Created by kuroky on 2018/1/18.
//  Copyright © 2018年 kuroky. All rights reserved.
//

#import <UIKit/UIKit.h>

/**
 cell设置
 
 @param cell custom cell
 @param item model data
 @param indexPath NSIndexPath
 */
typedef void (^MXCellConfigBlock)(id cell, id item, NSIndexPath *indexPath);

/**
 Custom TableViewController
 */
@interface MXBaseTableViewController : UIViewController

/**
 reload tableview之前调用
 
 @param block cell设置
 */
- (void)mx_reloadData:(MXCellConfigBlock)block;

@property (strong, nonatomic, readonly) UITableView *tableView;

/**
 tableview section 一行 
 */
@property (assign, nonatomic) BOOL sectionIsSingle;

/**
 cell identifier
 */
@property (nonatomic, copy) NSString *cellIdentifier;

/**
 Data Source
 */
@property (nonatomic, strong) NSMutableArray *dataList;

/**
 cell rowHeight
 */
@property (nonatomic, assign) CGFloat rowHeight;

/**
 section header高度
 */
@property (nonatomic, assign) CGFloat sectionHeaderHeight;

/**
 section footer高度
 */
@property (nonatomic, assign) CGFloat sectionFooterHeight;

/**
 自定义cell高度
 */
@property (nonatomic, copy) CGFloat (^MXCellHeightBlock)(NSIndexPath *indexPath);

/**
 自定义section 头部高度
 */
@property (nonatomic, copy) CGFloat (^MXHeaderHeightBlock)(NSInteger section);

/**
 自定义section 脚部高度
 */
@property (nonatomic, copy) CGFloat (^MXFooterHeightBlock)(NSInteger section);

#pragma mark - Refresh
@property (nonatomic, assign) BOOL hideHeaderRefresh; // 隐藏头部
@property (nonatomic, assign) BOOL hideFooterRefresh; // 隐藏底部

@property (nonatomic, assign) NSInteger mx_start;
@property (nonatomic, assign) NSInteger mx_count;

- (void)mx_headerRefresh; // 下拉刷新

- (void)mx_footerRefresh; // 上拉刷新

@end
