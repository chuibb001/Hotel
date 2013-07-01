//
//  ReserveQueryViewController.h
//  chujian7day
//
//  酒店查询
//
//  Created by yanyu on 13-4-16.
//  Copyright (c) 2013年 chujian. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TimeSelectViewController.h"
#import "HolderViewController.h"
#import "CitySelectViewController.h"
#import "AreaViewController.h"

@interface ReserveQueryViewController : UIViewController<UITableViewDataSource,UITableViewDelegate,TimeSelectedValueDelegate>
{
    // view 
    UITableView *reserveTableView;
    UILabel *cityLabel;
    UILabel *areaLabel;
    UITextView *keywordTextView;
    UILabel *numberLabel;
    UILabel *startTimeLabel;
    UILabel *startWeekLabel;
    UILabel *endTimeLabel;
    UILabel *endWeekLabel;
    
    // data
    NSString *cityString;
    NSString *areaString;
    NSString *keyWordString;
    NSString *numberString;
    
}


@end
