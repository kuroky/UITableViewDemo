//
//  SectionSViewController.m
//  TableViewControllerDemo
//
//  Created by kuroky on 2017/7/19.
//  Copyright © 2017年 kuroky. All rights reserved.
//

#import "SectionSViewController.h"

@interface SectionSViewController ()

@end

@implementation SectionSViewController

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
    self.view.backgroundColor = [UIColor yellowColor];
    [self setupTableView];
}

- (void)setupTableView {
    self.tableView.frame = self.view.bounds;
    self.sectionIsSingle = NO;
    self.cellIdentifier = @"cell";
    self.hideHeaderRefresh = YES;
    self.hideFooterRefresh = YES;
    
    self.rowHeight = 100.0;
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
