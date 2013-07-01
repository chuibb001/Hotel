//
//  MasterViewController.h
//  chujian7day
//
//  Created by 王 瑞 on 13-4-19.
//  Copyright (c) 2013年 chujian. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "HomeViewController.h"

@interface MasterViewController : UIViewController<PPRevealSideViewControllerDelegate>

@property (nonatomic, strong) PPRevealSideViewController *revealSideViewController;

@end
