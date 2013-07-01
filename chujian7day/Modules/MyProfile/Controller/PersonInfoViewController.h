//
//  PersonInfoViewController.h
//  chujian7day
//
//  Created by 王 瑞 on 13-5-17.
//  Copyright (c) 2013年 chujian. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PersonInfoViewController : UITableViewController<UITableViewDataSource,UITableViewDelegate>


@property (strong, nonatomic) UITableView *mainTable;
@property (strong, nonatomic) UIButton *resetPass;
@end

