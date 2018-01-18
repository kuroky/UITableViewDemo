//
//  RowsViewController.m
//  TableViewControllerDemo
//
//  Created by kuroky on 2017/7/19.
//  Copyright © 2017年 kuroky. All rights reserved.
//

#import "RowsViewController.h"

@interface RowsViewController ()

@end

@implementation RowsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setupData];
    [self setupUI];
}

- (void)setupData {
    self.dataList = [NSMutableArray arrayWithArray:@[@"1", @"2", @"3", @"4", @"5", @"6", @"7", @"8"]];
}

- (void)setupUI {
    self.navigationItem.title = @"First";
    self.view.backgroundColor = [UIColor lightGrayColor];
    [self setupTableView];
}

- (void)setupTableView {
    self.tableView.frame = self.view.bounds;
    self.cellIdentifier = @"cell";
    self.hideHeaderRefresh = YES;
    self.hideFooterRefresh = YES;
    [self.tableView registerClass:[UITableViewCell class]
           forCellReuseIdentifier:@"cell"];
    
    self.MXCellHeightBlock = ^CGFloat(NSIndexPath *indexPath) {
        if (indexPath.row % 2 == 0) {
            return 50.0;
        }
        else {
            return 100.0;
        }
    };
    
    [self mx_reloadData:^(UITableViewCell *cell, NSString *item, NSIndexPath *indexPath) {
        cell.textLabel.text = item;
    }];
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    NSLog(@"%ld", (long)indexPath.row);
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
