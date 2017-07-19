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
    self.view.backgroundColor = [UIColor lightGrayColor];
    [self setupTableView];
}

- (void)setupTableView {
    self.sectionMode = YES;
    self.cellIdentifier = @"cell";
    self.refreshHeaderHidden = YES;
    self.refreshFooterHidden = YES;
    
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

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    NSLog(@"%ld", (long)indexPath.row);
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
