//
//  HomeViewController.h
//  chujian7day
//
//  Created by yan kai on 13-4-16.
//  Copyright (c) 2013年 chujian. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "GuideViewController.h"

@interface HomeViewController : UIViewController <GuideViewControllerDelegate>
{
    GuideViewController* startViewCtrl;
    UIButton *btnReserve;
    UIButton *btnNearHotel;
    UIButton *btnCoupon;
    UIButton *btnActivity;
}

-(void)switchToReserve;
-(void)switchToNearHotel;
-(void)switchToCoupon;
-(void)switchToActivity;

@end
