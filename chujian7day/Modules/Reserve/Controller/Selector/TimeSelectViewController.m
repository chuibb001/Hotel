//
//  TimeSelectViewController.m
//  chujian7day
//
//  Created by simon on 13-4-19.
//  Copyright (c) 2013年 chujian. All rights reserved.
//

#import "TimeSelectViewController.h"

@interface TimeSelectViewController ()

@end

@implementation TimeSelectViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    [self initCalendar];
    [self initNav];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark init
-(void)initCalendar
{
    VRGCalendarView *calendar;
    ReserveData *data=[ReserveData sharedReserveData];
    if([self.type isEqual:@"1"])
    {
        calendar = [[VRGCalendarView alloc] initWithStartDate:[self getToday] CurrentDate:[data startTime].date];
    }
    else
    {
        calendar = [[VRGCalendarView alloc] initWithStartDate:[data startTime].date CurrentDate:[data endTime].date];
    }
    calendar.delegate=self;
    [self.view addSubview:calendar];
}
-(void)initNav
{
    self.navigationController.navigationBar.hidden=YES;
    UINavigationBar *navigationBar = [[UINavigationBar alloc] initWithFrame:CGRectMake(0, 0, 320, 44)];
    UINavigationItem *navagationItem = [[UINavigationItem alloc] initWithTitle:@""];
    [navigationBar pushNavigationItem:navagationItem animated:YES];
    [self.view addSubview:navigationBar];
    
    
    UIButton *rightButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [rightButton setBackgroundColor:[UIColor clearColor]];
    rightButton.frame = CGRectMake(0, 0, 49,30);
    //UIImage *backImage=[[UIImage imageNamed:@"navibutton.png"] stretchableImageWithLeftCapWidth:5 topCapHeight:5];
    //[rightButton setBackgroundImage:backImage forState:UIControlStateNormal];
    [rightButton setTitle:@"确定" forState:UIControlStateNormal];
    rightButton.titleLabel.font=[UIFont fontWithName:@"Arial-BoldMT" size:14.0];
    [rightButton addTarget:self action:@selector(rightButtonClicked:) forControlEvents:UIControlEventTouchUpInside];
    UIBarButtonItem *button1 = [[UIBarButtonItem alloc] initWithCustomView:rightButton];
    
    [navagationItem setRightBarButtonItem:button1 animated:YES];
    
    UIButton *leftButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [leftButton setBackgroundColor:[UIColor clearColor]];
    leftButton.frame = CGRectMake(0, 0, 49, 30);
    
    //[leftButton setBackgroundImage:[UIImage imageNamed:@"backbutton.png"] forState:UIControlStateNormal];
    [leftButton setTitle:@"返回" forState:UIControlStateNormal];
    leftButton.titleLabel.font=[UIFont boldSystemFontOfSize:13.0];
    [leftButton setTitleEdgeInsets:UIEdgeInsetsMake(0, 8, 1, 0)];
    [leftButton addTarget:self action:@selector(leftButtonClick:) forControlEvents:UIControlEventTouchUpInside];
    UIBarButtonItem *button2 = [[UIBarButtonItem alloc] initWithCustomView:leftButton];
    [navagationItem setLeftBarButtonItem:button2 animated:YES];
}

// 选择日期，返回上一层
#pragma mark Button Clicked
-(void)rightButtonClicked:(id)sender
{
    if([self.type isEqual:@"1"])
    {
        if(_date!=nil)
        {
            [[ReserveData sharedReserveData] setStartDate:_date];
        }
    }
    else
    {
        if(_date!=nil)
        {
            [[ReserveData sharedReserveData] setEndDate:_date];
        }
    }

    [self.navigationController popViewControllerAnimated:YES];
}

-(void)leftButtonClick:(id)sender
{
    [self.navigationController popViewControllerAnimated:YES];
}

#pragma mark Cal Delegate
-(void)calendarView:(VRGCalendarView *)calendarView switchedToMonth:(int)month targetHeight:(float)targetHeight animated:(BOOL)animated {
    if (month==[[NSDate date] month])
    {
        NSArray *dates = [NSArray arrayWithObjects:[NSNumber numberWithInt:1],[NSNumber numberWithInt:5], nil];
        [calendarView markDates:dates];
    }
}

-(void)calendarView:(VRGCalendarView *)calendarView dateSelected:(NSDate *)date {
    _date=date;
    //NSLog(@"abc%@",date);
}
-(NSDate *)getToday
{
    NSDate *now=[NSDate date];
    
    // 把时间调整到今日0点
    NSDateFormatter *df = [[NSDateFormatter alloc] init];
    df.dateFormat  = @"yyyy/MM/dd HH:mm:ss";
    
    NSString *nowStr=[df stringFromDate:now];
    
    NSString *newStr=[NSString stringWithFormat:@"%@ 00:00:00",[nowStr substringToIndex:10]];
    NSDate *aDate = [df dateFromString:newStr];
    
    
    // 调整8小时时差
    NSTimeZone *zone = [NSTimeZone systemTimeZone];
    NSInteger interval = [zone secondsFromGMTForDate: aDate];
    NSDate *localeDate = [aDate  dateByAddingTimeInterval: interval];
    
    return localeDate;
}
@end
