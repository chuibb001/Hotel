//
//  HotelCommodityViewController.m
//  chujian7day
//
//  Created by simon on 13-4-22.
//  Copyright (c) 2013年 chujian. All rights reserved.
//

#import "HotelCommodityViewController.h"

@interface HotelCommodityViewController ()

@end

@implementation HotelCommodityViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    [self initNav];
    [self initTableView];
    [self initButton];
    [self initPickerView];
    [self initToolBar];
}
#pragma mark UITableView
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 6;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    int row=[indexPath row];
    
    switch (row) {
        case 0:
        {
            UITableViewCell *cell=[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:nil];
            // 用品名
            UILabel * keyLabel=[[UILabel alloc] initWithFrame:CGRectMake(20, 10, 120, 30)];
            keyLabel.backgroundColor=[UIColor clearColor];
            keyLabel.text=@"和上次一样";
            [cell addSubview:keyLabel];
            
            // 按钮
            switches=[[UISwitch alloc] initWithFrame:CGRectMake(160, 10, 30, 20)];
            [cell addSubview:switches];
            
            cell.selectionStyle=UITableViewCellSelectionStyleNone;
            return cell;
        }
            break;
        case 5:
        {
            UITableViewCell *cell=[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:nil];
            cell.selectionStyle=UITableViewCellSelectionStyleNone;
            
            // 用品名
            UILabel * keyLabel=[[UILabel alloc] initWithFrame:CGRectMake(20, 10, 120, 30)];
            keyLabel.backgroundColor=[UIColor clearColor];
            keyLabel.text=@"用品总价";
            [cell addSubview:keyLabel];
            
            totalPriceLabel=[[UILabel alloc] initWithFrame:CGRectMake(160, 10, 120, 30)];
            totalPriceLabel.backgroundColor=[UIColor clearColor];
            totalPriceLabel.text=@"500";
            [cell addSubview:totalPriceLabel];
            
            return cell;
        }
            break;
        default:
        {
            static NSString *cellIdentifier=@"commodityCell";
            CommodityCell *cell=[tableView dequeueReusableCellWithIdentifier:cellIdentifier];
            
            if(cell==nil)
            {
                cell=[[CommodityCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier];
                
            }
            
            cell.keyLabel.text=@"550ml装水";
            cell.frontDoorPriceLabel.text=@"前台价:2.0";
            cell.networkPriceLabel.text=@"网络售价:1.5";
            return  cell;
            
        }
            break;
    }  
    return nil;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 40;
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [self.view addSubview:numberPickerView];
    [self.view addSubview:sureToolBar];
}

#pragma mark UIPickerView
-(NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView
{
    return 1;
}
-(NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component
{
    return 10;
}
-(NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component
{
    return @"a";
}
-(void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component
{
    NSLog(@"pass");
}
#pragma mark init
-(void)initTableView
{
    commodityTableView=[[UITableView alloc] initWithFrame:CGRectMake(0, 44, 320, self.view.frame.size.height-44) style:UITableViewStyleGrouped];
    commodityTableView.delegate=self;
    commodityTableView.dataSource=self;
    commodityTableView.backgroundColor=[UIColor clearColor];
    UIView *tmp=[[UIView alloc] init];
    commodityTableView.backgroundView=tmp;
    //checkinTableView.scrollEnabled=NO;
    [self.view addSubview:commodityTableView];
    
}
-(void)initNav
{
    self.view.backgroundColor=[UIColor whiteColor];
    self.navigationController.navigationBar.hidden=YES;
    UINavigationBar *navigationBar = [[UINavigationBar alloc] initWithFrame:CGRectMake(0, 0, 320, 44)];
    UINavigationItem *navagationItem = [[UINavigationItem alloc] initWithTitle:@"酒店用品"];
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

-(void)initButton
{
    UIButton *searchBtn=[UIButton buttonWithType:UIButtonTypeRoundedRect];
    searchBtn.frame=CGRectMake(100, 400, 100, 50);
    [searchBtn addTarget:self action:@selector(btnQueryPressed:) forControlEvents:UIControlEventTouchUpInside];
    [searchBtn setTitle:@"下一步" forState:UIControlStateNormal];
    [self.view addSubview:searchBtn];
}

-(void)initPickerView
{
    numberPickerView=[[UIPickerView alloc] initWithFrame:CGRectMake(0, self.view.frame.size.height-216, 320, 216)];
    numberPickerView.delegate=self;
    numberPickerView.dataSource=self;
    numberPickerView.showsSelectionIndicator=YES;
}

-(void)initToolBar
{
    sureToolBar=[[UIToolbar alloc] initWithFrame:CGRectMake(0, self.view.frame.size.height-216-44, 320, 44)];
    UIBarButtonItem *rightButton=[[UIBarButtonItem alloc] initWithTitle:@"确定" style:UIBarButtonItemStyleDone target:self action:@selector(sureButtonClicked:)];
    NSArray *arr=[[NSArray alloc] initWithObjects:rightButton, nil];
    //[sureToolBar setItems:arr];
    [sureToolBar setItems:arr animated:YES];
    
}

#pragma mark Button Clicked
-(void)btnQueryPressed:(id)sender
{
    SubmitOrderViewController *submitVC=[[SubmitOrderViewController alloc] init];
    [self.navigationController pushViewController:submitVC animated:YES];
}
-(void)sureButtonClicked:(id)sender
{
    
}
@end
