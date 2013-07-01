//
//  HotelRoomViewController.m
//  chujian7day
//
//  Created by yan kai on 13-4-17.
//  Copyright (c) 2013年 chujian. All rights reserved.
//

#import "HotelRoomViewController.h"
#import "ThriftService.h"

@interface HotelRoomViewController ()

@end

@implementation HotelRoomViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    [self initData];
    [self initImformationHeader];
    [self initTableView];

    [self requestForHotelDetail];
}

#pragma mark request
-(void)requestForHotelDetail
{
    int64_t checkinTimeStamp=[data.startTime timeStamp] * 1000;
    int64_t checkoutTimeStamp=[data.endTime timeStamp] * 1000;
    HotelRequest *request=[[HotelRequest alloc] initWithHotelId:data.selectedHotel.hotelId checkinTime:checkinTimeStamp checkoutTime:checkoutTimeStamp];
    ThriftService *service = [ThriftService shared];
    [service getHotelDetail:request success:^(HotelDetail *detail)
    {
        // success block
        data.detailData=detail;   // save for backup
        [self configImformationHeader];
        [self configHotelDetails];
        [self configHotelPics];
        [self configRooms];
        NSLog(@"%@",detail.rooms);
    } failed:^(NSString *error)
    {
        // fail block
        NSLog(@"%@",error);
    }];
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
            return [listData count];
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
            NSString *s1=[data.startTime dateString];
            NSString *s2=[data.startTime weekString];
            NSString *s3=[data.endTime dateString];
            NSString *s4=[data.endTime weekString];
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
            int row=[indexPath row];
            Room *room=[listData objectAtIndex:row];
            
            cell.roomTypeLabel.text=room.name;
            cell.priceLabel.text=[NSString stringWithFormat:@"￥%d",(int)room.price];
            [cell.reserveButton addTarget:self.parentViewController action:@selector(reserveButtonClicked:) forControlEvents:UIControlEventTouchUpInside];
            cell.selectionStyle=UITableViewCellSelectionStyleNone;
            cell.reserveButton.tag=row;
            
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
    data=[ReserveData sharedReserveData];
}
-(void)initTableView
{
    hotelTableView=[[UITableView alloc] initWithFrame:CGRectMake(0, 80+24, 320, self.view.frame.size.height-124) style:UITableViewStylePlain];
    hotelTableView.delegate=self;
    hotelTableView.dataSource=self;
    UIView *tmp=[[UIView alloc] init];
    [hotelTableView setTableFooterView:tmp];
    [self.view addSubview:hotelTableView];
}
-(void)initImformationHeader
{
    imformationHeader=[[HotelImformationHeader alloc] initWithFrame:CGRectMake(0, 24, 320, 80)];
    [self.view addSubview:imformationHeader];
}

#pragma mark config
-(void)configImformationHeader
{
    HotelDetail *detail=data.detailData;
    imformationHeader.hotelImageView.image=detail.coverImage;
    imformationHeader.nameLabel.text=detail.name;
    imformationHeader.addressLabel.text=detail.address;
    imformationHeader.phoneLabel.text=detail.phone;
}
-(void)configHotelDetails
{
    details=data.detailData.introduction;
}
-(void)configHotelPics
{
    NSMutableArray *arr=data.detailData.imageList;
    images=[[NSMutableArray alloc] init];
    for(Image *img in arr)
    {
        [images addObject:img.url];
    }
}
-(void)configRooms
{
    listData=data.detailData.rooms;
    NSIndexSet *set=[NSIndexSet indexSetWithIndex:3];
    [hotelTableView reloadSections:set withRowAnimation:UITableViewRowAnimationAutomatic];
}

#pragma mark Button Clicked
-(void) showHotelDetail:(id)sender
{
    NSIndexPath *ip=[NSIndexPath indexPathForRow:0 inSection:1];
    NSArray *arr=[[NSArray alloc] initWithObjects:ip, nil];
    if(!hotelDetailCell)
    {
        if(details)
        {
            // alloc
            hotelDetailCell=[[HotelDetailCell alloc] initWithContent:details];
            // insert
            [hotelTableView insertRowsAtIndexPaths:arr withRowAnimation:UITableViewRowAnimationAutomatic];
        }
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
        if(images)
        {
            // alloc
            hotelPicCell=[[HotelPicCell alloc] initWithImages:images];
            // insert
            [hotelTableView insertRowsAtIndexPaths:arr withRowAnimation:UITableViewRowAnimationAutomatic];
        }
        
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
