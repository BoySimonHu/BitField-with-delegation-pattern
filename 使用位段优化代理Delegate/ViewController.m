//
//  ViewController.m
//  使用位段优化代理Delegate
//
//  Created by 刘一峰 on 2017/7/21.
//  Copyright © 2017年 刘一峰. All rights reserved.
//

#import "ViewController.h"
#import "FirstViewController.h"
@interface ViewController ()<FirstViewControllerDelegate>

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    UIStoryboard * sb = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    
    FirstViewController * vc = [sb instantiateViewControllerWithIdentifier:@"FirstViewController"];
    vc.delegate = self;
    [self presentViewController:vc animated:YES completion:nil];
}

- (void)optimizingDelegateMethodsByBitfield {
    self.view.backgroundColor = [UIColor orangeColor];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
