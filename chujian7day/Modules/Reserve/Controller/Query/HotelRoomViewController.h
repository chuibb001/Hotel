//
//  HotelRoomViewController.h
//  chujian7day
//
//  酒店可预订房间
//
//  Created by yan kai on 13-4-17.
//  Copyright (c) 2013年 chujian. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "HotelCell.h"
#import "HotelDetailCell.h"
#import "HotelPicCell.h"
#import "HotelImformationHeader.h"
#import "ReserveData.h"

@interface HotelRoomViewController : UIViewController<UITableViewDataSource,UITableViewDelegate>
{
    // view
    UITableView *hotelTableView;
    HotelDetailCell *hotelDetailCell;
    HotelPicCell *hotelPicCell;
    HotelImformationHeader *imformationHeader;
    
    // data
    NSMutableArray *listData;
    NSMutableArray *images;
    NSString *details;
    
    ReserveData *data;
}

@end

