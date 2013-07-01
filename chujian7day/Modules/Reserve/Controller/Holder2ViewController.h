//
//  Holder2ViewController.h
//  chujian7day
//
//  Created by simon on 13-4-22.
//  Copyright (c) 2013年 chujian. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "HotelRoomViewController.h"
#import "HotelDetailViewController.h"
#import "CheckInImformationViewController.h"

@interface Holder2ViewController : UIViewController
{
    HotelRoomViewController *roomVC;
    HotelDetailViewController *mapVC;
    
    // flag
    int current_vc;
    
    // view
    UIButton *rightButton;
}
@end
