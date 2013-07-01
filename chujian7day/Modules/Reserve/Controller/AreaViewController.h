//
//  AreaViewController.h
//  chujian7day
//
//  Created by simon on 13-4-20.
//  Copyright (c) 2013年 chujian. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AreaViewController : UIViewController<UITableViewDataSource,UITableViewDelegate>
{
    // view
    UITableView *areaTableView;
    
    // data
    NSMutableArray *listData;
}


@end
