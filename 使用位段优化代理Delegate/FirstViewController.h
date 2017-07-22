/*********************************************************/
/*                                                       *
 *                                                       *
 *   Follow your heart, but take your brain with you.    *
 *                                                       *
 *                                                       *
 *********************************************************/
//
//  FirstViewController.h
//  使用位段优化代理Delegate
//
//  Created by 刘一峰 on 2017/7/21.
//  Copyright © 2017年 刘一峰. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol FirstViewControllerDelegate <NSObject>

- (void)optimizingDelegateMethodsByBitfield;

@end

@interface FirstViewController : UIViewController
@property(nonatomic, weak) id<FirstViewControllerDelegate> delegate;
@end
