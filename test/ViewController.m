//
//  ViewController.m
//  test
//
//  Created by shirly on 2017/3/31.
//  Copyright © 2017年 shirly. All rights reserved.
//

#import "ViewController.h"
#import "YQScrollText.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    YQScrollText *scrollText = [[YQScrollText alloc]initWithFrame:CGRectMake(0, 0, self.view.frame.size.width-100, 40)];
    scrollText.text = @"这是标题这是标题这是标题这是标题这是标题这是标题";
    self.navigationItem.titleView = scrollText;
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
