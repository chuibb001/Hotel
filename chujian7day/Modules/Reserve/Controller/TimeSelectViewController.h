//
//  TimeSelectViewController.h
//  chujian7day
//
//  Created by simon on 13-4-19.
//  Copyright (c) 2013年 chujian. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "VRGCalendarView.h"

@protocol TimeSelectedValueDelegate;

@interface TimeSelectViewController : UIViewController<VRGCalendarViewDelegate>
{
    NSString *timeStr;
    NSString *weekStr;
}

@property(nonatomic,weak) id<TimeSelectedValueDelegate> delegate;
@property(nonatomic,strong) NSString *type;

@end

@protocol TimeSelectedValueDelegate <NSObject>

-(void)SelectedTime:(NSString *)time andWeek:(NSString *)week andType:(NSString *)type;

@end