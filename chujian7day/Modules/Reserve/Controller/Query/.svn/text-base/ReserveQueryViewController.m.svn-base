//
//  ReserveQueryViewController.m
//  chujian7day
//
//  Created by yanyu on 13-4-16.
//  Copyright (c) 2013年 chujian. All rights reserved.
//

#import "ReserveQueryViewController.h"
//#import "searchHotel.h"
@interface ReserveQueryViewController ()

@end

@implementation ReserveQueryViewController

#pragma mark lifecycle
- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    // 初始化视图
    [self initNav];
    [self initBackground];
    [self initTableView];
    [self initButton];
    
    // 初始化数据
    [self configueObserver];
    [self initReseveTime];  // 默认时间
    
}

#pragma mark UITableView
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 4;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    int row=[indexPath row];
    
    switch (row) {
        case 0:  // 城市
        {
            citySelectorCell=[[LocationSelectorCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:nil];
            citySelectorCell.keyLabel.text=@"城市:";
            citySelectorCell.valueLabel.text=@"暂无";
            
            return citySelectorCell;
        }
            break;
        case 1:  // 区域
        {
            regionSelectorCell=[[LocationSelectorCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:nil];
            regionSelectorCell.keyLabel.text=@"区域:";
            regionSelectorCell.valueLabel.text=@"暂无";
            
            return regionSelectorCell;
        }
            break;
        case 2:  // 关键词
        {
            keywordSelectorCell=[[KeywordSelectorCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:nil];
            // 处理键盘事件
            keywordSelectorCell.keywordTextField.delegate=self;
            
            return keywordSelectorCell;
        }
            break;
        case 3:  //时间段
        {
            timeSelectorCell=[[TimeSelectorCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:nil];

            // 为该cell设置数据显示
            timeSelectorCell.startTimeLabel.text=[[ReserveData sharedReserveData].startTime dateString];
            timeSelectorCell.startWeekLabel.text=[[ReserveData sharedReserveData].startTime weekString];
            timeSelectorCell.endTimeLabel.text=[[ReserveData sharedReserveData].endTime dateString];
            timeSelectorCell.endWeekLabel.text=[[ReserveData sharedReserveData].endTime weekString];
            timeSelectorCell.numberLabel.text=@"1";
            
            // 为里面的button设置触碰事件
            [timeSelectorCell.startBtn addTarget:self action:@selector(startBtnClicked:) forControlEvents:UIControlEventTouchUpInside];
            [timeSelectorCell.endBtn addTarget:self action:@selector(endBtnClicked:) forControlEvents:UIControlEventTouchUpInside];
            
            return timeSelectorCell;
        }
            break;
        default:
            return nil;
            break;
    }
    
    return nil;
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

#pragma mark init view
-(void)initTableView
{
    reserveTableView=[[UITableView alloc] initWithFrame:CGRectMake(0, 44, 320, self.view.frame.size.height-44) style:UITableViewStyleGrouped];
    reserveTableView.delegate=self;
    reserveTableView.dataSource=self;
    reserveTableView.backgroundColor=[UIColor clearColor];
    UIView *tmp=[[UIView alloc] init];
    reserveTableView.backgroundView=tmp;
    [self.view addSubview:reserveTableView];
}

-(void)initButton
{
    UIButton *searchBtn=[UIButton buttonWithType:UIButtonTypeRoundedRect];
    searchBtn.frame=CGRectMake(100, 300, 100, 50);
    [searchBtn addTarget:self action:@selector(btnQueryPressed:) forControlEvents:UIControlEventTouchUpInside];
    [searchBtn setTitle:@"搜索" forState:UIControlStateNormal];
    [reserveTableView addSubview:searchBtn];
}
-(void)initBackground
{
    self.view.backgroundColor=[UIColor whiteColor];
}
-(void)initNav
{
    self.navigationController.navigationBar.hidden=YES;
    UINavigationBar *navigationBar = [[UINavigationBar alloc] initWithFrame:CGRectMake(0, 0, 320, 44)];
    UINavigationItem *navagationItem = [[UINavigationItem alloc] initWithTitle:@"酒店预定"];
    [navigationBar pushNavigationItem:navagationItem animated:YES];
    [self.view addSubview:navigationBar];
    
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
#pragma mark init data
-(void)configueObserver
{
    [[ReserveData sharedReserveData] addObserver:self forKeyPath:@"cityString" options:NSKeyValueObservingOptionInitial | NSKeyValueObservingOptionNew context:nil];
    [[ReserveData sharedReserveData] addObserver:self forKeyPath:@"regionString" options:NSKeyValueObservingOptionInitial | NSKeyValueObservingOptionNew context:nil];
    [[ReserveData sharedReserveData] addObserver:self forKeyPath:@"dayStr" options:NSKeyValueObservingOptionInitial | NSKeyValueObservingOptionNew context:nil];
    [[ReserveData sharedReserveData].startTime addObserver:self forKeyPath:@"dateString" options:NSKeyValueObservingOptionInitial | NSKeyValueObservingOptionNew context:nil];
    [[ReserveData sharedReserveData].endTime addObserver:self forKeyPath:@"dateString" options:NSKeyValueObservingOptionInitial | NSKeyValueObservingOptionNew context:nil];
    [[ReserveData sharedReserveData].startTime addObserver:self forKeyPath:@"weekString" options:NSKeyValueObservingOptionInitial | NSKeyValueObservingOptionNew context:nil];
    [[ReserveData sharedReserveData].endTime addObserver:self forKeyPath:@"weekString" options:NSKeyValueObservingOptionInitial | NSKeyValueObservingOptionNew context:nil];
}
-(void)initReseveTime
{
    ReserveData *data=[ReserveData sharedReserveData];
    [data.startTime setToday];
    [data.endTime setTomorrow];
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
    [timeVC setValue:@"1" forKey:@"type"];
    [self.navigationController pushViewController:timeVC animated:YES];
}

-(void)endBtnClicked:(id)sender
{
    TimeSelectViewController *timeVC=[[TimeSelectViewController alloc] init];
    [timeVC setValue:@"2" forKey:@"type"];
    [self.navigationController pushViewController:timeVC animated:YES];
}

-(void)btnQueryPressed:(id)sender
{

    
    
    
    /*Signture *aSign = [[Signture alloc] initWithUsername:[NSString stringWithFormat:@"15902021102"] password:[NSString stringWithFormat:@"wow3215467"]];
    [SVProgressHUD showWithStatus:@"登录中"];
    
    [service useLogin:aSign success:^(MemberDetail *success){
        [SVProgressHUD showSuccessWithStatus:@"登陆成功" duration:0.5f];
        [self dismissViewControllerAnimated:YES completion:nil];
    }
               failed:^(NSString *error){
                   [SVProgressHUD showErrorWithStatus:@"登录失败" duration:0.7f];
               }];*/
    
    HolderViewController *holderVC=[[HolderViewController alloc] init];
    [self.navigationController pushViewController:holderVC animated:YES];
}

// Observer
#pragma mark Data Changed
-(void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary *)change context:(void *)context
{
    if([keyPath isEqualToString:@"cityString"])
    {
        NSString *cityStr=[change objectForKey:NSKeyValueChangeNewKey];
        citySelectorCell.valueLabel.text=cityStr;
    }
    else if([keyPath isEqualToString:@"regionString"])
    {
        NSString *regionStr=[change objectForKey:NSKeyValueChangeNewKey];
        regionSelectorCell.valueLabel.text=regionStr;
    }
    else if([keyPath isEqualToString:@"dayStr"])
    {
        NSString *numberStr=[change objectForKey:NSKeyValueChangeNewKey];
        timeSelectorCell.numberLabel.text=numberStr;
    }
    else if([keyPath isEqualToString:@"dateString"])
    {
        ReserveData *date=[ReserveData sharedReserveData];
        if([object isEqual:date.startTime])
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
        ReserveData *date=[ReserveData sharedReserveData];
        if([object isEqual:date.startTime])
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



#pragma mark 键盘
- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [keywordSelectorCell.keywordTextField resignFirstResponder];
    return YES;
}
@end
