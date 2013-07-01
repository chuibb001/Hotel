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
    [self initData];
    // 初始化视图
    self.view.backgroundColor=[UIColor whiteColor];
    [self initHeaderView];
    [self initTableView];
    [self initDropDownList];
    
    // 初始化数据
    [self configueObserver];
    
    
    // 请求数据
    [self requestForData];
}
-(void)dealloc
{
    [[HotelListManager sharedInstance] clearCaches];  // 该VC销毁时，清空缓存
}
#pragma mark UITableView
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [listData count];
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    static NSString *cellIdentifier=@"reserveResultCell";
    ReserveResultCell *cell=[tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    
    if(cell==nil)
    {
        cell=[[ReserveResultCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier];
    }
    int row=[indexPath row];
    Hotel *hotel=[listData objectAtIndex:row];
    
    cell.hotelNameLabel.text=hotel.name;
    cell.hotelAddressLabel.text=hotel.address;
    if(hotel.vacant==YES)
        cell.conditionLabel.text=@"有房";
    else
        cell.conditionLabel.text=@"已住满";
    cell.priceLabel.text=[NSString stringWithFormat: @"￥%d",(int)hotel.price];
    
    cell.selectionStyle=UITableViewCellSelectionStyleNone;
    
    return cell;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 60;
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    // save hotel id to singleton
    Hotel *h=[listData objectAtIndex:[indexPath row]];
    [ReserveData sharedReserveData].selectedHotel=h;
    [self.delegate Push];
}

#pragma mark request
-(void)requestForData
{
    listManager=[HotelListManager sharedInstance];
    listManager.delegate=self;
    [listManager requestWithType:PriceAscending];
}

#pragma mark init data
-(void)configueObserver
{
    [data.startTime addObserver:self forKeyPath:@"dateString" options:NSKeyValueObservingOptionInitial | NSKeyValueObservingOptionNew context:nil];
    [data.endTime addObserver:self forKeyPath:@"dateString" options:NSKeyValueObservingOptionInitial | NSKeyValueObservingOptionNew context:nil];
    [data.startTime addObserver:self forKeyPath:@"weekString" options:NSKeyValueObservingOptionInitial | NSKeyValueObservingOptionNew context:nil];
    [data.endTime addObserver:self forKeyPath:@"weekString" options:NSKeyValueObservingOptionInitial | NSKeyValueObservingOptionNew context:nil];
}
-(void)initData
{
    listData=[[NSMutableArray alloc] init];
    data=[ReserveData sharedReserveData];
}

#pragma mark init view
-(void)initDropDownList
{
    // 左上角按钮
    UIButton *topButton=[UIButton buttonWithType:UIButtonTypeRoundedRect];
    topButton.frame=CGRectMake(5, 30, 60, 30);
    [topButton setTitle:@"筛选" forState:UIControlStateNormal];
    [topButton addTarget:self action:@selector(topButtonClicked:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:topButton];
    
    // 下拉列表
    dropDownList=[[DropDownView alloc] initWithFrame:CGRectMake(5, 24+50, 100, 200)];
    dropDownList.delegate=self;
    [self.view addSubview:dropDownList];

}
-(void)initHeaderView
{
    timeSelectorCell=[[TimeSelectorCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:nil];
    timeSelectorCell.frame=CGRectMake(0, 24, 320, 50);
    [self.view addSubview:timeSelectorCell];
    
    // 移除多余的view
    [timeSelectorCell.keyLabel removeFromSuperview];
    [timeSelectorCell.numberLabel removeFromSuperview];
    
    // 为该cell设置数据显示
    timeSelectorCell.startTimeLabel.text=[data.startTime dateString];
    timeSelectorCell.startWeekLabel.text=[data.startTime weekString];
    timeSelectorCell.endTimeLabel.text=[data.endTime dateString];
    timeSelectorCell.endWeekLabel.text=[data.endTime weekString];
    timeSelectorCell.numberLabel.text=data.dayStr;
    
    [timeSelectorCell.startBtn addTarget:self.parentViewController action:@selector(startBtnClicked:) forControlEvents:UIControlEventTouchUpInside];
    [timeSelectorCell.endBtn addTarget:self.parentViewController action:@selector(endBtnClicked:) forControlEvents:UIControlEventTouchUpInside];
}

-(void)initTableView
{
    resultTableView=[[DisplayTableView alloc] initWithFrame:CGRectMake(0, 50+24, 320, self.view.frame.size.height-50-44)];
    resultTableView.delegate=self;
    resultTableView.dataSource=self;
    resultTableView.disPlayDataSource=self;
    [self.view addSubview:resultTableView];
}

// Observer
#pragma mark Data Changed
-(void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary *)change context:(void *)context
{
    if([keyPath isEqualToString:@"dateString"])
    {
        if([object isEqual:data.startTime])
        {
            NSString *dayeStr=[change objectForKey:NSKeyValueChangeNewKey];
            timeSelectorCell.startTimeLabel.text=dayeStr;
        }
        else
        {
            NSString *dayeStr=[change objectForKey:NSKeyValueChangeNewKey];
            timeSelectorCell.endTimeLabel.text=dayeStr;
        }
    }
    else if([keyPath isEqualToString:@"weekString"])
    {
        if([object isEqual:data.startTime])
        {
            NSString *dayeStr=[change objectForKey:NSKeyValueChangeNewKey];
            timeSelectorCell.startWeekLabel.text=dayeStr;
        }
        else
        {
            NSString *dayeStr=[change objectForKey:NSKeyValueChangeNewKey];
            timeSelectorCell.endWeekLabel.text=dayeStr;
        }
    }
}

#pragma mark Button Clicked
-(void)topButtonClicked:(id)sender
{
    [dropDownList action];
}
-(void)rightButtonClicked:(id)sender
{
    [self.navigationController popViewControllerAnimated:YES];
}

-(void)leftButtonClick:(id)sender
{
    [self.navigationController popViewControllerAnimated:YES];
}


#pragma mark hotel list delegate
-(void)hotelList:(NSMutableArray *)array
{
    listData=array;
    
    [resultTableView reloadData];
    [resultTableView Stop];
}

#pragma mark drop down list
-(void)didSelectCell:(int)type
{
    NSLog(@"%d",type);
    [listManager requestWithType:type];
}

#pragma mark- Display DataSource
-(void)loadMoreData
{
    [listManager requestNextPageWithType];
}

#pragma mark - UIScrollViewDelegate
- (void) scrollViewWillBeginDragging:(UIScrollView *)scrollView
{
    [resultTableView beginScroll];
}

- (void) scrollViewDidScroll:(UIScrollView *)scrollView
{
    [resultTableView Scrolling:scrollView];
}

- (void)scrollViewDidEndDragging:(UIScrollView *)scrollView willDecelerate:(BOOL)decelerate
{
    [resultTableView endScroll:scrollView];
}
@end
