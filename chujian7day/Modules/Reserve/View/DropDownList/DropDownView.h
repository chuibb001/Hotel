//
//  DropDownView.h
//  Public
//
//  Created by 01 developer on 12-9-15.
//  Copyright (c) 2012年 Sun Yat-sen University. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DropDownCell.h"

@protocol DropDownListDelegate;

@interface DropDownView : UIView <UITableViewDataSource,UITableViewDelegate>
{
    //选择的项目
    NSString *selected;
    
    //判断当前状态
    BOOL dropDownOpen;
    
    // view
    UITableView *table;
    
}

@property (strong ,nonatomic) NSArray *listData;
@property (nonatomic,weak) id<DropDownListDelegate> delegate;

-(void)action;
@end

@protocol DropDownListDelegate <NSObject>

-(void)didSelectCell:(int)type;

@end