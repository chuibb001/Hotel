//
//  HotelCommodityViewController.h
//  chujian7day
//
//  Created by simon on 13-4-22.
//  Copyright (c) 2013年 chujian. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CommodityCell.h"
#import "SubmitOrderViewController.h"
#import "ReserveData.h"
#import "Goods.h"

@interface HotelCommodityViewController : UIViewController<UITableViewDataSource,UITableViewDelegate,UIPickerViewDataSource,UIPickerViewDelegate>
{
    UITableView *commodityTableView;
    UISwitch *switches;
    UILabel *totalPriceLabel;
    UIPickerView *numberPickerView;
    UIToolbar *sureToolBar;
    
    // data
    ReserveData *data;
    NSMutableArray *supplies;
    
    NSIndexPath *selectedIP;
    int number;
    int numbers[20];
    NSMutableArray *goodsArr;
}
@end
