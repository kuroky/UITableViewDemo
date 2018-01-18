//
//  RefreshViewController.m
//  TableViewControllerDemo
//
//  Created by kuroky on 2017/7/19.
//  Copyright © 2017年 kuroky. All rights reserved.
//

#import "RefreshViewController.h"

@interface RefreshViewController ()

@end

@implementation RefreshViewController

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
    self.sectionIsSingle = NO;
    self.cellIdentifier = @"cell";
    self.rowHeight = 100.0;
    self.hideFooterRefresh = YES;
    [self.tableView registerClass:[UITableViewCell class]
           forCellReuseIdentifier:@"cell"];
    
    self.MXHeaderHeightBlock = ^CGFloat(NSInteger index) {
        if (index == 0) {
            return 0;
        }
        else {
            return 10.0;
        }
    };
    
    self.MXCellHeightBlock = ^CGFloat(NSIndexPath *indexPath) {
        if (indexPath.row % 2 == 0) {
            return 60;
        }
        else {
            return 120;
        }
    };
    
    [self mx_reloadData:^(UITableViewCell *cell, NSString *item, NSIndexPath *indexPath) {
        cell.textLabel.text = @(indexPath.section).stringValue;
    }];
}

#pragma mark - Refresh
- (void)mx_headerRefresh {
    [self.dataList removeAllObjects];
    self.mx_start = 0;
    for (NSInteger i = 0; i < 20; i++) {
        [self.dataList addObject:@(i).stringValue];
    }
    self.hideFooterRefresh = NO;
    [super mx_headerRefresh];
}

- (void)mx_footerRefresh {
    NSInteger count = (arc4random() + 1) % 20;
    for (NSInteger i = 0; i < count; i++) {
        [self.dataList addObject:@(i).stringValue];
    }
    
    self.mx_start = self.dataList.count;
    [super mx_footerRefresh];
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    NSLog(@"%ld", (long)indexPath.row);
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
