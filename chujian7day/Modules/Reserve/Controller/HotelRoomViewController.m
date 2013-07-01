//
//  HotelRoomViewController.m
//  chujian7day
//
//  Created by yan kai on 13-4-17.
//  Copyright (c) 2013年 chujian. All rights reserved.
//
//
#import "HotelRoomViewController.h"

@interface HotelRoomViewController ()

@end

@implementation HotelRoomViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    [self initData];
    [self initNav];
    [self initImformationHeader];
    [self initTableView];
}

#pragma mark UITableView
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    switch (section) {
        case 0:
        {
            return 0;
        }
        break;
        case 1:
        {
            return hotelDetailCell.isOpen?1:0;
        }
        break;
        case 2:
        {
            return hotelPicCell.isOpen?1:0;
        }
        break;
        case 3:  // 房间列表
        {
            return 13;
        }
        break;
        default:
        break;
    }
    return 0;
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 4;
}
-(UIView*)tableView:(UITableView*)tableView viewForHeaderInSection:(NSInteger)section
{
    switch (section) {
        case 0:
        {
            UILabel *label=[[UILabel alloc] initWithFrame:CGRectMake(0, 0, 320, 20)];
            label.backgroundColor=[UIColor clearColor];
            // 要显示的日期
            NSString *s1=[ReserveData sharedReserveData].startTimeString;
            NSString *s2=[ReserveData sharedReserveData].startWeekString;
            NSString *s3=[ReserveData sharedReserveData].endTimeString;
            NSString *s4=[ReserveData sharedReserveData].endWeekString;
            NSString *str=[NSString stringWithFormat:@"住店日期    %@ %@ 至 %@ %@",s1,s2,s3,s4];
            label.text=str;
            return  label;
        }
            break;
        case 1:
        {
            UILabel *label=[[UILabel alloc] initWithFrame:CGRectMake(0, 0, 320, 20)];
            label.backgroundColor=[UIColor clearColor];
            label.text=@"酒店详情";
            
            // 点击事件
            UITapGestureRecognizer *tap=[[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(showHotelDetail:)];
            [label addGestureRecognizer:tap];
            label.userInteractionEnabled=YES;
            return label;
        }
            break;
        case 2:
        {
            UILabel *label=[[UILabel alloc] initWithFrame:CGRectMake(0, 0, 320, 20)];
            label.backgroundColor=[UIColor clearColor];
            label.text=@"酒店图片";
            
            // 点击事件
            UITapGestureRecognizer *tap=[[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(showHotelPic:)];
            [label addGestureRecognizer:tap];
            label.userInteractionEnabled=YES;
            return label;
        }
            break;
        default:
            break;
    }
    return  nil;
    
}
-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{

    if(section==3)
        return 0;
    else
        return 20;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    int section=[indexPath section];
    switch (section) {
        case 0:
        {
            return nil;
        }
            break;
        case 1:  // 酒店详情
        {
            
            return hotelDetailCell;
        }
            break;
        case 2:  // 酒店图片
        {
            
            return hotelPicCell;
        }
            break;
        case 3:  // 房间列表
        {
            static NSString *cellIdentifier=@"hotelCell";
            HotelCell *cell=[tableView dequeueReusableCellWithIdentifier:cellIdentifier];
            
            if(cell==nil)
            {
                cell=[[HotelCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier];
            }
            cell.roomTypeLabel.text=@"自主大床房";
            cell.priceLabel.text=@"230";
            
            cell.selectionStyle=UITableViewCellSelectionStyleNone;
            
            return cell;
        }
            break;
        default:
            break;
    }
    
    return nil;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    int section=[indexPath section];
    switch (section) {
        case 0:
        {
            return 0;
        }
            break;
        case 1:
        {
            return hotelDetailCell.height;
        }
            break;
        case 2:
        {
            return hotelPicCell.height;
        }
            break;
        case 3:
        {
            return 60.0;
        }
            break;
        default:
            break;
    }
    return 0;
}

#pragma mark init
-(void)initData
{
    listData=[[NSMutableArray alloc] init];
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
-(void)initTableView
{
    hotelTableView=[[UITableView alloc] initWithFrame:CGRectMake(0, 80+44, 320, self.view.frame.size.height-144) style:UITableViewStylePlain];
    hotelTableView.delegate=self;
    hotelTableView.dataSource=self;
    UIView *tmp=[[UIView alloc] init];
    [hotelTableView setTableFooterView:tmp];
    [self.view addSubview:hotelTableView];
}
-(void)initImformationHeader
{
    imformationHeader=[[HotelImformationHeader alloc] initWithFrame:CGRectMake(0, 44, 320, 80)];
    [self.view addSubview:imformationHeader];
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

-(void) showHotelDetail:(id)sender
{
    NSIndexPath *ip=[NSIndexPath indexPathForRow:0 inSection:1];
    NSArray *arr=[[NSArray alloc] initWithObjects:ip, nil];
    if(!hotelDetailCell) 
    {
        // alloc
        hotelDetailCell=[[HotelDetailCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:nil];
        // insert
        [hotelTableView insertRowsAtIndexPaths:arr withRowAnimation:UITableViewRowAnimationAutomatic];
    }
    else
    {
        if(!hotelDetailCell.isOpen)
        {
            hotelDetailCell.isOpen=YES;
            // insert
            [hotelTableView insertRowsAtIndexPaths:arr withRowAnimation:UITableViewRowAnimationAutomatic];
        }
        else
        {
            hotelDetailCell.isOpen=NO;
            // delete
            [hotelTableView deleteRowsAtIndexPaths:arr withRowAnimation:UITableViewRowAnimationAutomatic];
        }
    }
}

-(void) showHotelPic:(id)sender
{
    NSIndexPath *ip=[NSIndexPath indexPathForRow:0 inSection:2];
    NSArray *arr=[[NSArray alloc] initWithObjects:ip, nil];
    if(!hotelPicCell)
    {
        // alloc
        hotelPicCell=[[HotelPicCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:nil];
        // insert
        [hotelTableView insertRowsAtIndexPaths:arr withRowAnimation:UITableViewRowAnimationAutomatic];
    }
    else
    {
        if(!hotelPicCell.isOpen)
        {
            hotelPicCell.isOpen=YES;
            // insert
            [hotelTableView insertRowsAtIndexPaths:arr withRowAnimation:UITableViewRowAnimationAutomatic];
        }
        else
        {
            hotelPicCell.isOpen=NO;
            // delete
            [hotelTableView deleteRowsAtIndexPaths:arr withRowAnimation:UITableViewRowAnimationAutomatic];
        }
    }
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
