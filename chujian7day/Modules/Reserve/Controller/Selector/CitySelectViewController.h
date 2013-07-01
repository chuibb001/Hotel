//
//  CitySelectViewController.h
//  chujian7day
//
//  Created by simon on 13-4-20.
//  Copyright (c) 2013年 chujian. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ReserveData.h"

@interface CitySelectViewController : UIViewController<UITableViewDataSource,UITableViewDelegate,UISearchBarDelegate>
{
    // view
    UITableView *cityTableView;
    UISearchBar *searchBar;
    
    // data
    NSMutableArray *listData;
}

@end
