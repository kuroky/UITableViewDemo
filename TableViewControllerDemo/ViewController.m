//
//  ViewController.m
//  TableViewControllerDemo
//
//  Created by kuroky on 2017/7/19.
//  Copyright © 2017年 kuroky. All rights reserved.
//

#import "ViewController.h"
#import "FirstViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    btn.frame = CGRectMake(100, 100, 175, 40);
    [btn setBackgroundColor:[UIColor lightGrayColor]];
    [self.view addSubview:btn];
    [btn addTarget:self
            action:@selector(pushViewController)
  forControlEvents:UIControlEventTouchUpInside];
}

- (void)pushViewController {
    [self.navigationController pushViewController:[FirstViewController new]
                                         animated:YES];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
