//
//  FirstViewController.m
//  TableViewControllerDemo
//
//  Created by kuroky on 2017/7/19.
//  Copyright © 2017年 kuroky. All rights reserved.
//

#import "FirstViewController.h"

@interface FirstViewController ()

@end

@implementation FirstViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setupData];
    [self setupUI];
}

- (void)setupData {
    self.dataList = [NSMutableArray arrayWithArray:@[@"RowsViewController", @"SectionSViewController", @"RefreshViewController", @"", @""]];
}

- (void)setupUI {
    self.navigationItem.title = @"First";
    self.view.backgroundColor = [UIColor whiteColor];
    [self setupTableView];
}

- (void)setupTableView {
    self.cellIdentifier = @"cell";
    self.refreshHeaderHidden = YES;
    self.refreshFooterHidden = YES;
    self.stabledCellHeight = 100.0;
    [self.tableView registerClass:[UITableViewCell class]
           forCellReuseIdentifier:@"cell"];
    
    [self em_reloadData:^(UITableViewCell *cell, NSString *item) {
        cell.textLabel.text = item;
    }];
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    NSString *title = self.dataList[indexPath.row];
    [self.navigationController pushViewController:[NSClassFromString(title) new] animated:YES];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
