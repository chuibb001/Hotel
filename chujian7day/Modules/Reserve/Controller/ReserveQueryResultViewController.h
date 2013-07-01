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

@protocol HotelTableClickedDelegate;
@protocol TimeButtonClickedDelegate;

@interface ReserveQueryResultViewController : UIViewController<UITableViewDataSource,UITableViewDelegate,TimeSelectedValueDelegate>
{
    // view 
    UITableView *resultTableView;
    UILabel *startTimeLabel;
    UILabel *startWeekLabel;
    UILabel *endTimeLabel;
    UILabel *endWeekLabel;
    
    //data
    NSMutableArray *listData;
}

@property (nonatomic,weak) id<HotelTableClickedDelegate> delegate1;
@property (nonatomic,weak) id<TimeButtonClickedDelegate> delegate2;

@end

// 点击酒店列表的某一行后，让其父视图执行pushVC
@protocol HotelTableClickedDelegate <NSObject>

-(void)tableClicked;

@end

 // 点击时间选择按钮后，让其父视图执行pushVC
@protocol TimeButtonClickedDelegate <NSObject>

-(void)timeBtnClicked:(int)type;

@end