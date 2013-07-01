//
//  ModifiedCalendarView.h
//  chujian7day
//
//  Created by simon on 13-5-11.
//  Copyright (c) 2013年 chujian. All rights reserved.
//

#import "VRGCalendarView.h"

@interface ModifiedCalendarView : VRGCalendarView
{
    NSDate *_currentDate;
}

-(id)initWithDate:(NSDate *)date;

@end
