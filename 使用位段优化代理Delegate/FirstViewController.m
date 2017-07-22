/*********************************************************/
/*                                                       *
 *                                                       *
 *   Follow your heart, but take your brain with you.    *
 *                                                       *
 *                                                       *
 *********************************************************/
//
//  FirstViewController.m
//  使用位段优化代理Delegate
//
//  Created by 刘一峰 on 2017/7/21.
//  Copyright © 2017年 刘一峰. All rights reserved.
//

#import "FirstViewController.h"

struct {
    _Bool respondsToSelector : 1;
}DelegateStatus;

//位置不同，所占内存空间也不相同，所以顺序应预先计算合理。
struct {
    unsigned int a: 1;
//    signed int b: 32;
    _Bool c: 1;
    signed int b: 32;
}BitField;

@interface FirstViewController ()

@property(nonatomic,assign)BOOL flag;

@end

@implementation FirstViewController

- (void)setDelegate:(id<FirstViewControllerDelegate>)delegate {
    _delegate = delegate;
    DelegateStatus.respondsToSelector = [delegate respondsToSelector:@selector(optimizingDelegateMethodsByBitfield)];

}
//    self.flag = [delegate respondsToSelector:@selector(optimizingDelegateMethodsByBitfield)];
- (void)viewDidLoad {
    [super viewDidLoad];
}
- (IBAction)popVc:(UIButton *)sender {
    [self dismissViewControllerAnimated:YES completion:^{
        if (DelegateStatus.respondsToSelector) {
            printf("%zd\n",sizeof(DelegateStatus));
            printf("%zd\n",sizeof(BitField));
            [self.delegate optimizingDelegateMethodsByBitfield];
        }
    }];

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
