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
    self.sectionMode = YES;
    self.cellIdentifier = @"cell";
    
    self.stabledCellHeight = 100.0;
    [self.tableView registerClass:[UITableViewCell class]
           forCellReuseIdentifier:@"cell"];
    
    self.EMHeadHeightBlock = ^CGFloat(NSInteger index) {
        if (index == 0) {
            return 0;
        }
        else {
            return 10.0;
        }
    };
    
    [self em_reloadData:^(UITableViewCell *cell, NSString *item) {
        cell.textLabel.text = item;
    }];
}

#pragma mark - Refresh
- (void)em_headerRefresh {
    [self.dataList removeAllObjects];
    for (NSInteger i = 0; i < 20; i++) {
        [self.dataList addObject:@(i).stringValue];
    }
    [super em_headerRefresh];
}

- (void)em_footerRefresh {
    NSInteger count = (arc4random() + 1) % 20;
    for (NSInteger i = 0; i < count; i++) {
        [self.dataList addObject:@(i).stringValue];
    }
    
    self.em_start += count;
    [super em_footerRefresh];
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    NSLog(@"%ld", (long)indexPath.row);
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
