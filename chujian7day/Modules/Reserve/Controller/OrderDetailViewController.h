//
//  OrderDetailViewController.h
//  chujian7day
//
//  Created by simon on 13-4-23.
//  Copyright (c) 2013年 chujian. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface OrderDetailViewController : UIViewController<UITableViewDataSource,UITableViewDelegate>
{
    UITableView *detailTableView;
}
@end
