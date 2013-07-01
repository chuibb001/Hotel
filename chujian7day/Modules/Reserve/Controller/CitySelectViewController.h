//
//  CitySelectViewController.h
//  chujian7day
//
//  Created by simon on 13-4-20.
//  Copyright (c) 2013年 chujian. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CitySelectViewController : UIViewController<UITableViewDataSource,UITableViewDelegate>
{
    // view
    UITableView *cityTableView;
    
    // data
    NSMutableArray *listData;
}
@end
