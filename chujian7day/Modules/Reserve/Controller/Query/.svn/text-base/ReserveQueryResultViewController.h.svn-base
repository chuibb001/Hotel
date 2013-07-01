//
//  ReserveQueryResultViewController.h
//  chujian7day
//
//  Created by yan kai on 13-4-16.
//  Copyright (c) 2013年 chujian. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TimeSelectViewController.h"
#import "DropDownView.h"
#import "ReserveResultCell.h"
#import "HotelRoomViewController.h"
#import "ReserveData.h"
#import "HotelMapViewController.h"
#import "TimeSelectorCell.h"
#import "DisplayTableView.h"
#import "HotelListManager.h"
#import "ThriftService.h"
#import "PushHelperProtocol.h"

@protocol PushHelperProtocol;
@interface ReserveQueryResultViewController : UIViewController<UITableViewDataSource,UITableViewDelegate,DropDownListDelegate,DisPlayDataSource,HotelListDelegate>
{
    // view 
    DisplayTableView *resultTableView;
    TimeSelectorCell *timeSelectorCell;
    DropDownView * dropDownList;
    
    //data
    NSMutableArray *listData;
    ReserveData *data;
    
    HotelListManager *listManager;
}

@property (nonatomic,weak) id<PushHelperProtocol> delegate;

@end


