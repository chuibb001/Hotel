//
//  PasswordResetViewController.h
//  chujian7day
//
//  Created by 王 瑞 on 13-5-18.
//  Copyright (c) 2013年 chujian. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PasswordResetViewController : UIViewController<UITableViewDataSource,UITableViewDelegate>

@property (nonatomic, strong) UITableView *mainTable;
@property (nonatomic, strong) UIButton *wholeBackgroudButton;
@property (nonatomic, strong) UILabel *label;

@property (nonatomic, strong) UIButton *acquireButton;
@end
