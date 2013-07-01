//
//  ReserveQueryViewController.h
//  chujian7day
//
//  酒店查询

//  用户设置的查询数据保存在ReserveData Singleton中,然后通过KVO update view

//  Created by yanyu on 13-4-16.
//  Copyright (c) 2013年 chujian. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TimeSelectViewController.h"
#import "HolderViewController.h"
#import "CitySelectViewController.h"
#import "AreaViewController.h"
#import "TimeSelectorCell.h"
#import "LocationSelectorCell.h"
#import "KeywordSelectorCell.h"
#import "ISevenDaysService.h"
#import "ThriftService.h"
#import "LBSManager.h"

@interface ReserveQueryViewController : UIViewController<UITableViewDataSource,UITableViewDelegate,UITextFieldDelegate>
{
    // view 
    UITableView *reserveTableView;
    LocationSelectorCell *citySelectorCell;
    LocationSelectorCell *regionSelectorCell;
    KeywordSelectorCell *keywordSelectorCell;
    TimeSelectorCell *timeSelectorCell;

    
    // data
    NSString *cityString;
    NSString *areaString;
    NSString *keyWordString;
    NSString *numberString;
    
}


@end
