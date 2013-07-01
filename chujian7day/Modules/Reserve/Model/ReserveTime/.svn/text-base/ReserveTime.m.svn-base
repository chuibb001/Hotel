//
//  ReserveTime.m
//  chujian7day
//
//  Created by simon on 13-5-1.
//  Copyright (c) 2013年 chujian. All rights reserved.
//

#import "ReserveTime.h"

@implementation ReserveTime

// 自定义setter,可调整时差
-(void)customSetDate:(NSDate *)date
{
    //NSLog(@"pass");
    if(date != self.date)
    {
        NSTimeZone *zone = [NSTimeZone systemTimeZone];
        NSInteger interval = [zone secondsFromGMTForDate: date];
        NSDate *localeDate = [date dateByAddingTimeInterval: interval];
        self.date=localeDate;
        
        [self setDateString];
        [self setWeekString];
    }
    
}

#pragma mark setter
// 返回String类型，如“05-01"
-(void)setDateString
{
    self.dateString=[[self.date description] substringWithRange:NSMakeRange(5, 5)];

}

// 返回星期,如"周一"
-(void)setWeekString
{ 
    // 星期
    NSCalendar *calendar = [[NSCalendar alloc] initWithCalendarIdentifier:NSGregorianCalendar];
    NSDateComponents *comps = [[NSDateComponents alloc] init];
    NSInteger unitFlags = NSWeekdayCalendarUnit;
    comps = [calendar components:unitFlags fromDate:self.date];
    int week = [comps weekday];
    self.weekString=[self week:week];
}

-(int64_t)timeStamp
{
    return [self.date timeIntervalSince1970];
}
#pragma mark set defalut date
// 设置时间为今天
-(void)setToday
{
    NSDate *now=[NSDate date];
    
    
    
    // 把时间调整到今日0点
    NSDateFormatter *df = [[NSDateFormatter alloc] init];
    df.dateFormat  = @"yyyy/MM/dd HH:mm:ss";
    
    NSString *nowStr=[df stringFromDate:now];
    
    NSString *newStr=[NSString stringWithFormat:@"%@ 00:00:00",[nowStr substringToIndex:10]];
    NSDate *aDate = [df dateFromString:newStr];
    NSLog(@"aDate%@",aDate);
    
    // 调整8小时时差
    NSTimeZone *zone = [NSTimeZone systemTimeZone];
    NSInteger interval = [zone secondsFromGMTForDate: aDate];
    NSDate *localeDate = [aDate  dateByAddingTimeInterval: interval];
    
    self.date=localeDate;
    NSLog(@"localeDate%@",localeDate);
    [self setDateString];
    [self setWeekString];
}

// 设置时间为明天
-(void)setTomorrow
{
    // 明天
    NSDate *now=[NSDate date] ;
    NSTimeInterval secondsPerDay = 24 * 60 * 60;
    NSDate *second=[now dateByAddingTimeInterval:secondsPerDay];
    
    // 把时间调整到今日0点
    NSDateFormatter *df = [[NSDateFormatter alloc] init];
    df.dateFormat  = @"yyyy/MM/dd HH:mm:ss";
    
    NSString *nowStr=[df stringFromDate:second];
    
    NSString *newStr=[NSString stringWithFormat:@"%@ 00:00:00",[nowStr substringToIndex:10]];
    NSDate *aDate = [df dateFromString:newStr];
    
    // 调整8小时时差
    NSTimeZone *zone = [NSTimeZone systemTimeZone];
    NSInteger interval = [zone secondsFromGMTForDate: aDate];
    NSDate *localeDate = [aDate  dateByAddingTimeInterval: interval];
    
    self.date=localeDate;
    
    [self setDateString];
    [self setWeekString];
}

-(void)setTomorrow:(NSDate *)today
{
    NSTimeInterval secondsPerDay = 24 * 60 * 60;
    NSDate *second=[today dateByAddingTimeInterval:secondsPerDay];
    
    NSTimeZone *zone = [NSTimeZone systemTimeZone];
    NSInteger interval = [zone secondsFromGMTForDate: second];
    NSDate *localeDate = [second dateByAddingTimeInterval: interval];
    
    self.date=localeDate;
    
    [self setDateString];
    [self setWeekString];
}

// 返回星期的String格式
-(NSString*)week:(NSInteger)week
{
    NSString *weekString=nil;
    if(week==1)
    {
        weekString=@"周日";
    }else if(week==2){
        weekString=@"周一";
        
    }else if(week==3){
        weekString=@"周二";
        
    }else if(week==4){
        weekString=@"周三";
        
    }else if(week==5){
        weekString=@"周四";
        
    }else if(week==6){
        weekString=@"周五";
        
    }else if(week==7){
        weekString=@"周六";
    }
    
    return weekString;
}

@end
