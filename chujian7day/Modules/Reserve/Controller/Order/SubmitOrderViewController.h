//
//  SubmitOrderViewController.h
//  chujian7day
//
//  Created by simon on 13-4-23.
//  Copyright (c) 2013年 chujian. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "OrderDetailViewController.h"
#import "ReserveData.h"
#import "Goods.h"

@interface SubmitOrderViewController : UIViewController<UITableViewDataSource,UITableViewDelegate>
{
    // view 
    UITableView *submitTableView;
    
    // data
    ReserveData *data;
    Boolean showGoods;
}
@end
