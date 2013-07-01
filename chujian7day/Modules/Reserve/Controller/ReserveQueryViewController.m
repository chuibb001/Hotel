//
//  ReserveQueryViewController.m
//  chujian7day
//
//  Created by yanyu on 13-4-16.
//  Copyright (c) 2013年 chujian. All rights reserved.
//

#import "ReserveQueryViewController.h"

@interface ReserveQueryViewController ()

@end

@implementation ReserveQueryViewController

#pragma mark lifecycle
- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    [self initNav];
    [self initTableView];
    [self initButton];
}

#pragma mark UITableView
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 4;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *cellIdentifier=@"reserveCell";
    UITableViewCell *cell=[tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    
    int row=[indexPath row];
    if(cell==nil)
    {
        cell=[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier];
        switch (row) {
            case 0:
            {
                UILabel *keyLabel=[[UILabel alloc] initWithFrame:CGRectMake(20, 10, 50, 30)];
                keyLabel.backgroundColor=[UIColor clearColor];
                keyLabel.text=@"城市:";
                [cell addSubview:keyLabel];
                cityLabel=[[UILabel alloc] initWithFrame:CGRectMake(80, 10, 100, 30)];
                cityLabel.backgroundColor=[UIColor clearColor];
                cityLabel.text=@"广州";
                [cell addSubview:cityLabel];
            }
                break;
            case 1:
            {
                UILabel *keyLabel=[[UILabel alloc] initWithFrame:CGRectMake(20, 10, 50, 30)];
                keyLabel.backgroundColor=[UIColor clearColor];
                keyLabel.text=@"区域:";
                [cell addSubview:keyLabel];
                areaLabel=[[UILabel alloc] initWithFrame:CGRectMake(80, 10, 100, 30)];
                areaLabel.backgroundColor=[UIColor clearColor];
                areaLabel.text=@"越秀区";
                [cell addSubview:areaLabel];
            }
                break;
            case 2:
            {
                UILabel *keyLabel=[[UILabel alloc] initWithFrame:CGRectMake(20, 10, 70, 30)];
                keyLabel.backgroundColor=[UIColor clearColor];
                keyLabel.text=@"关键词:";
                [cell addSubview:keyLabel];
                keywordTextView=[[UITextView alloc] initWithFrame:CGRectMake(80, 10, 70, 30)];
                keywordTextView.backgroundColor=[UIColor clearColor];
                [cell addSubview:keywordTextView];
            }
                break;
            case 3:
            {
                UILabel *keyLabel=[[UILabel alloc] initWithFrame:CGRectMake(20, 10, 50, 30)];
                keyLabel.backgroundColor=[UIColor clearColor];
                keyLabel.text=@"住  晚:";
                [cell addSubview:keyLabel];
                numberLabel=[[UILabel alloc] initWithFrame:CGRectMake(40, 10, 30, 30)];
                numberLabel.backgroundColor=[UIColor clearColor];
                numberLabel.text=@"1";
                [cell addSubview:numberLabel];
                // 入住时间
                startTimeLabel=[[UILabel alloc] initWithFrame:CGRectMake(80, 5, 50, 20)];
                startTimeLabel.font=[UIFont systemFontOfSize:15.0];
                startTimeLabel.backgroundColor=[UIColor clearColor];
                [cell addSubview:startTimeLabel];
                // 入住星期
                startWeekLabel=[[UILabel alloc] initWithFrame:CGRectMake(80, 20, 50, 20)];
                startWeekLabel.backgroundColor=[UIColor clearColor];
                startWeekLabel.font=[UIFont systemFontOfSize:13.0];
                startWeekLabel.text=@"周一";
                [cell addSubview:startWeekLabel];
                // “入住”
                UILabel *checkInLabel=[[UILabel alloc] initWithFrame:CGRectMake(110, 20, 50, 20)];
                checkInLabel.backgroundColor=[UIColor clearColor];
                checkInLabel.font=[UIFont systemFontOfSize:13.0];
                checkInLabel.text=@"入住";
                checkInLabel.textColor=[UIColor blueColor];
                [cell addSubview:checkInLabel];
                // 选择入住时间
                UIButton *startBtn=[UIButton buttonWithType:UIButtonTypeRoundedRect];
                startBtn.frame=CGRectMake(150, 10, 30, 30);
                [startBtn addTarget:self action:@selector(startBtnClicked:) forControlEvents:UIControlEventTouchUpInside];
                [cell addSubview:startBtn];
                
                // 离店时间
                endTimeLabel=[[UILabel alloc] initWithFrame:CGRectMake(200, 5, 50, 20)];
                endTimeLabel.backgroundColor=[UIColor clearColor];
                endTimeLabel.font=[UIFont systemFontOfSize:15.0];
                [cell addSubview:endTimeLabel];
                // 离店星期
                endWeekLabel=[[UILabel alloc] initWithFrame:CGRectMake(200, 20, 50, 30)];
                endWeekLabel.backgroundColor=[UIColor clearColor];
                endWeekLabel.font=[UIFont systemFontOfSize:13.0];
                endWeekLabel.text=@"周二";
                [cell addSubview:endWeekLabel];
                // “离店”
                UILabel *checkOutLabel=[[UILabel alloc] initWithFrame:CGRectMake(230, 20, 50, 20)];
                checkOutLabel.backgroundColor=[UIColor clearColor];
                checkOutLabel.font=[UIFont systemFontOfSize:13.0];
                checkOutLabel.textColor=[UIColor blueColor];
                checkOutLabel.text=@"离店";
                [cell addSubview:checkOutLabel];
                // 选择离店时间
                UIButton *endBtn=[UIButton buttonWithType:UIButtonTypeRoundedRect];
                endBtn.frame=CGRectMake(270, 10, 30, 30);
                [endBtn addTarget:self action:@selector(endBtnClicked:) forControlEvents:UIControlEventTouchUpInside];
                [cell addSubview:endBtn];
            }
                break;
            default:
                break;
        }
    }
    
    switch (row) {
        case 0:
        {
            cityLabel.text=@"广州";
        }
            break;
        case 1:
        {
            areaLabel.text=@"越秀区";
        }
            break;
        case 2:
        {
            
        }
            break;
        case 3:
        {
            numberLabel.text=@"1";
            
            // 入住时间
            startTimeLabel.text=@"04-08";
            // 入住星期
            startWeekLabel.text=@"周一";
            
            // 离店时间
            endTimeLabel.text=@"04-09";
            // 离店星期
            endWeekLabel.text=@"周二";
        }
            break;
        default:
            break;
    }
    
    cell.selectionStyle=UITableViewCellSelectionStyleNone;
    return cell;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 50.0;
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    int row = [indexPath row];
    if(row==0)
    {
        CitySelectViewController *cityVC=[[CitySelectViewController alloc] init];
        [self.navigationController pushViewController:cityVC animated:YES];
    }
    else if(row==1)
    {
        AreaViewController *areaVC=[[AreaViewController alloc] init];
        [self.navigationController pushViewController:areaVC animated:YES];
    }
}

#pragma mark init
-(void)initTableView
{
    reserveTableView=[[UITableView alloc] initWithFrame:CGRectMake(0, 44, 320, self.view.frame.size.height-44) style:UITableViewStyleGrouped];
    reserveTableView.delegate=self;
    reserveTableView.dataSource=self;
    reserveTableView.scrollEnabled=NO;
    [self.view addSubview:reserveTableView];
}

-(void)initButton
{
    UIButton *searchBtn=[UIButton buttonWithType:UIButtonTypeRoundedRect];
    searchBtn.frame=CGRectMake(100, 300, 100, 50);
    [searchBtn addTarget:self action:@selector(btnQueryPressed:) forControlEvents:UIControlEventTouchUpInside];
    searchBtn.titleLabel.text=@"搜索";
    [self.view addSubview:searchBtn];
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
    [rightButton setTitle:@"右" forState:UIControlStateNormal];
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
    TimeSelectViewController *timeVC=[[TimeSelectViewController alloc] init];
    timeVC.delegate=self;
    [timeVC setValue:@"1" forKey:@"type"];
    [self.navigationController pushViewController:timeVC animated:YES];
}

-(void)endBtnClicked:(id)sender
{
    TimeSelectViewController *timeVC=[[TimeSelectViewController alloc] init];
    timeVC.delegate=self;
    [timeVC setValue:@"2" forKey:@"type"];
    [self.navigationController pushViewController:timeVC animated:YES];
}

-(void)btnQueryPressed:(id)sender
{
    HolderViewController *holderVC=[[HolderViewController alloc] init];
    [self.navigationController pushViewController:holderVC animated:YES];
}

#pragma mark Selected Time
-(void)SelectedTime:(NSString *)time andWeek:(NSString *)week andType:(NSString *)type
{
    if([type isEqual:@"1"])
    {
        startTimeLabel.text=time;
        startWeekLabel.text=week;
        // save to singleton
        ReserveData *data=[ReserveData sharedReserveData];
        data.startTimeString=time;
        data.startWeekString=week;
    }
    else
    {
        endTimeLabel.text=time;
        endWeekLabel.text=week;
        // save to singleton
        ReserveData *data=[ReserveData sharedReserveData];
        data.endTimeString=time;
        data.endWeekString=week;
    }
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
@end
