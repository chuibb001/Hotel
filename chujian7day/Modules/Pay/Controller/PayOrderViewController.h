//
//  PayOrderViewController.h
//  chujian7day
//
//  Created by yan kai on 13-4-19.
//  Copyright (c) 2013年 chujian. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PayOrderViewController : UIViewController<UITableViewDataSource,UITableViewDelegate>
{
    // 订单总价（显示的时候/100)
    double totalPrice;
    
    UIView* totalPriceView;
    UITableView* payDetailView;
    UIButton* btnNext;
}

@end
