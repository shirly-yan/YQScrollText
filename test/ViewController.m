//
//  ViewController.m
//  test
//
//  Created by shirly on 2017/3/31.
//  Copyright © 2017年 shirly. All rights reserved.
//

#import "ViewController.h"
#import "AutoScrollTextView.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    AutoScrollTextView *titleView = [[AutoScrollTextView alloc]initWithFrame:CGRectMake(0, 0, self.view.frame.size.width-100, 40)];
    titleView.text = @"这是标题这是标题这是标题这是标题这是标题这是标题";
    self.navigationItem.titleView = titleView;
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
