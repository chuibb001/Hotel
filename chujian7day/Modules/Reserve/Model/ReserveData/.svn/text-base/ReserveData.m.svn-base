//
//  ReserveData.m
//  chujian7day
//
//  Created by simon on 13-4-19.
//  Copyright (c) 2013年 chujian. All rights reserved.
//

#import "ReserveData.h"
#import "Goods.h"

@implementation ReserveData

static ReserveData *reserveData=nil;

-(id)init
{
    self=[super init];
    if(self)
    {   
        self.startTime=[[ReserveTime alloc] init];
        self.endTime=[[ReserveTime alloc] init];
    }
    return self;
}
-(float)totalGoodsPrice
{
    float sum=0.0;
    for(Goods *g in self.goods)
    {
        sum+=g.price*g.quantiry;
    }
    return sum;
}
-(float)totalPrice
{
    float sum=0.0;
    sum=self.selectedRoom.price *(float)self.roomCount +[self totalGoodsPrice];
    return  sum;
}
// Singleton
+(ReserveData *)sharedReserveData
{
    if(!reserveData)
        reserveData=[[ReserveData alloc] init];
    
    return reserveData;
}

// 通过NSDate对象设置ReserveTime对象
-(void)setStartDate:(NSDate *)sdate
{
    if(sdate != self.startTime.date)
    {
        [self.startTime customSetDate:sdate];
        
        self.dayStr=[NSString stringWithFormat:@"%d",[self numberOfDays]];
        
        // 如果大于endDate
        NSComparisonResult result=[sdate compare:self.endTime.date];
        if(result==NSOrderedDescending)
        {
            [self.endTime setTomorrow:sdate];
            self.dayStr=[NSString stringWithFormat:@"%d",[self numberOfDays]];
        }
    }
}

-(void)setEndDate:(NSDate *)edate
{
    if(edate != self.endTime.date)
    {
        [self.endTime customSetDate:edate];
        
        self.dayStr=[NSString stringWithFormat:@"%d",[self numberOfDays]];
    }
}

// 计算两个日期相差几天
-(int)numberOfDays
{
    NSDate *startDate=self.startTime.date;
    NSDate *endDate=self.endTime.date;
    
    NSCalendar *calendar = [[NSCalendar alloc] initWithCalendarIdentifier:NSGregorianCalendar];
    unsigned int unitFlag = NSDayCalendarUnit;
    NSDateComponents *components = [calendar components:unitFlag fromDate:startDate toDate:endDate options:0];
    int days = [components day];
    
    return days;
}

@end
