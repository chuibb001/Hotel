//
//  ReserveQueryResultViewController.m
//  chujian7day
//
//  Created by yan kai on 13-4-16.
//  Copyright (c) 2013年 chujian. All rights reserved.
//

#import "ReserveQueryResultViewController.h"

@interface ReserveQueryResultViewController ()

@end

@implementation ReserveQueryResultViewController
#pragma mark lifrcycle
- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    self.view.backgroundColor=[UIColor whiteColor];
    [self initData];
    [self initHeaderView];
    [self initTableView];
    [self initDropDownList];
}

#pragma mark UITableView
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 4;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    static NSString *cellIdentifier=@"reserveResultCell";
    ReserveResultCell *cell=[tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    
    if(cell==nil)
    {
        cell=[[ReserveResultCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier];
    }
    cell.hotelNameLabel.text=@"七天酒店";
    cell.hotelAddressLabel.text=@"xxxx";
    cell.conditionLabel.text=@"有房";
    cell.priceLabel.text=@"230";
    
    cell.selectionStyle=UITableViewCellSelectionStyleNone;
    
    return cell;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 60;
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [self.delegate1 tableClicked];
}

#pragma mark init
-(void)initData
{
    listData=[[NSMutableArray alloc] init];
}


-(void)initDropDownList
{
    DropDownView * dropDownList=[[DropDownView alloc] initWithFrame:CGRectMake(0, 44, 100, 200)];
    [self.view addSubview:dropDownList];
}
-(void)initHeaderView
{
    // 入住时间
    startTimeLabel=[[UILabel alloc] initWithFrame:CGRectMake(80, 5+44, 50, 20)];
    startTimeLabel.font=[UIFont systemFontOfSize:15.0];
    startTimeLabel.text=[ReserveData sharedReserveData].startTimeString;//@"04-08";
    startTimeLabel.backgroundColor=[UIColor clearColor];
    [self.view addSubview:startTimeLabel];
    // 入住星期
    startWeekLabel=[[UILabel alloc] initWithFrame:CGRectMake(80, 20+44, 50, 20)];
    startWeekLabel.backgroundColor=[UIColor clearColor];
    startWeekLabel.font=[UIFont systemFontOfSize:13.0];
    startWeekLabel.text=[ReserveData sharedReserveData].startWeekString;
    [self.view addSubview:startWeekLabel];
    // “入住”
    UILabel *checkInLabel=[[UILabel alloc] initWithFrame:CGRectMake(110, 20+44, 50, 20)];
    checkInLabel.backgroundColor=[UIColor clearColor];
    checkInLabel.font=[UIFont systemFontOfSize:13.0];
    checkInLabel.text=@"入住";
    checkInLabel.textColor=[UIColor blueColor];
    [self.view addSubview:checkInLabel];
    // 选择入住时间
    UIButton *startBtn=[UIButton buttonWithType:UIButtonTypeRoundedRect];
    startBtn.frame=CGRectMake(150, 10+44, 30, 30);
    [startBtn addTarget:self action:@selector(startBtnClicked:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:startBtn];
    
    // 离店时间
    endTimeLabel=[[UILabel alloc] initWithFrame:CGRectMake(200, 5+44, 50, 20)];
    endTimeLabel.backgroundColor=[UIColor clearColor];
    endTimeLabel.font=[UIFont systemFontOfSize:15.0];
    endTimeLabel.text=[ReserveData sharedReserveData].endTimeString;//@"04-09";
    [self.view addSubview:endTimeLabel];
    // 离店星期
    endWeekLabel=[[UILabel alloc] initWithFrame:CGRectMake(200, 20+44, 50, 20)];
    endWeekLabel.backgroundColor=[UIColor clearColor];
    endWeekLabel.font=[UIFont systemFontOfSize:13.0];
    endWeekLabel.text=[ReserveData sharedReserveData].endWeekString;
    [self.view addSubview:endWeekLabel];
    // “离店”
    UILabel *checkOutLabel=[[UILabel alloc] initWithFrame:CGRectMake(230, 20+44, 50, 20)];
    checkOutLabel.backgroundColor=[UIColor clearColor];
    checkOutLabel.font=[UIFont systemFontOfSize:13.0];
    checkOutLabel.textColor=[UIColor blueColor];
    checkOutLabel.text=@"离店";
    [self.view addSubview:checkOutLabel];
    // 选择离店时间
    UIButton *endBtn=[UIButton buttonWithType:UIButtonTypeRoundedRect];
    endBtn.frame=CGRectMake(270, 10+44, 30, 30);
    [endBtn addTarget:self action:@selector(endBtnClicked:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:endBtn];
}

-(void)initTableView
{
    resultTableView=[[UITableView alloc] initWithFrame:CGRectMake(0, 50+44, 320, self.view.frame.size.height) style:UITableViewStylePlain];
    resultTableView.delegate=self;
    resultTableView.dataSource=self;
    UIView *tmp=[[UIView alloc] init];
    [resultTableView setTableFooterView:tmp];
    [self.view addSubview:resultTableView];
}

#pragma mark Button Clicked
-(void)rightButtonClicked:(id)sender
{
    [self.navigationController popViewControllerAnimated:YES];
}

-(void)leftButtonClick:(id)sender
{
    [self.navigationController popViewControllerAnimated:YES];
}
-(void)startBtnClicked:(id)sender
{
    [self.delegate2 timeBtnClicked:1];
}
-(void)endBtnClicked:(id)sender
{
    [self.delegate2 timeBtnClicked:2];
}

#pragma mark Selected Time
-(void)SelectedTime:(NSString *)time andWeek:(NSString *)week andType:(NSString *)type
{
    if([type isEqual:@"1"])
    {
        startTimeLabel.text=time;
        startWeekLabel.text=week;
    }
    else
    {
        endTimeLabel.text=time;
        endWeekLabel.text=week;
    }
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
