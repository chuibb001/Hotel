//
//  HolderViewController.h
//  chujian7day
//
//  Created by simon on 13-4-20.
//  Copyright (c) 2013年 chujian. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "HotelMapViewController.h"
#import "ReserveQueryResultViewController.h"

@interface HolderViewController : UIViewController<HotelTableClickedDelegate,TimeButtonClickedDelegate>
{
    HotelMapViewController *mapVC;
    ReserveQueryResultViewController *resultVC;
    
    // flag
    int current_vc;
}
@end
