//
//  EMBaseViewController.m
//  ESignIn
//
//  Created by kuroky on 2017/6/19.
//  Copyright © 2017年 Kuroky. All rights reserved.
//

#import "EMBaseViewController.h"
//#import "EMBaseColor.h"

@interface EMBaseViewController ()

@end

@implementation EMBaseViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    //self.view.backgroundColor = [EMBaseColor em_viewBackgroudnColor];
}

- (UIStatusBarStyle)preferredStatusBarStyle {
    return UIStatusBarStyleLightContent;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
