//
//  OrderDetailViewController.m
//  chujian7day
//
//  Created by simon on 13-4-23.
//  Copyright (c) 2013年 chujian. All rights reserved.
//

#import "OrderDetailViewController.h"

@interface OrderDetailViewController ()

@end

@implementation OrderDetailViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    // init data
    [self initData];
    
    // init view
    [self initNav];
    [self initTableView];
    [self initButton];
}
#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 2;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    switch (section) {
        case 0:
        {
            return 5;
        }
            break;
        case 1:
        {
            return 1;
        }
            break;
        default:
            break;
    }
    return 0;
}


-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 20;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    int section=[indexPath section];
    int row=[indexPath row];
    
    UITableViewCell *cell=[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:nil];
    
    
    switch (section)
    {
        case 0:
        {
            switch (row) {     // 订单编号
                case 0:
                {
                    UILabel *keyLabel=[self LabelWithFrame:CGRectMake(20, 10, 300, 20) Title:[NSString stringWithFormat:@"订单编号: 123456"]];
                    [cell addSubview:keyLabel];
                }
                    break;
                case 1:     // 酒店信息
                {
                    UILabel *keyLabel=[self LabelWithFrame:CGRectMake(20, 10, 120, 20) Title:@"酒店信息:"];
                    [cell addSubview:keyLabel];
                }
                    break;
                case 2:
                {
                    Hotel *h=data.selectedHotel;
                    
                    UILabel *keyLabel=[self LabelWithFrame:CGRectMake(20, 10, 300, 20) Title:[NSString stringWithFormat:@"入住酒店: %@",h.name]];
                    [cell addSubview:keyLabel];
                    
                    UILabel *keyLabel2=[self LabelWithFrame:CGRectMake(20, 30, 300, 20) Title:[NSString stringWithFormat:@"酒店地址: %@",h.address]];
                    [cell addSubview:keyLabel2];
                    
                    UILabel *keyLabel3=[self LabelWithFrame:CGRectMake(20, 50, 300, 20) Title:[NSString stringWithFormat:@"酒店信息: %@",h.phone]];
                    [cell addSubview:keyLabel3];

                    
                }
                    break;
                case 3:
                {
                    UILabel *keyLabel=[self LabelWithFrame:CGRectMake(20, 10, 120, 20) Title:@"入住信息:"];
                    [cell addSubview:keyLabel];
                }
                    break;
                case 4:
                {
                    ReserveTime *s=data.startTime;
                    ReserveTime *e=data.endTime;
                    
                    // 标签
                    UILabel *keyLabel=[self LabelWithFrame:CGRectMake(20, 10, 300, 20) Title:[NSString stringWithFormat:@"住店日期: %@ %@ 至 %@ %@",s.dateString,s.weekString,e.dateString,e.weekString ]];
                    [cell addSubview:keyLabel];
                    
                    UILabel *keyLabel2=[self LabelWithFrame:CGRectMake(20, 30, 300, 20) Title:[NSString stringWithFormat:@"房间数量: %d",data.roomCount]];
                    [cell addSubview:keyLabel2];
                    
                    Room *r=data.selectedRoom;
                    UILabel *keyLabel3=[self LabelWithFrame:CGRectMake(20, 50, 300, 20) Title:[NSString stringWithFormat:@"入住类型: %@",r.name]];
                    [cell addSubview:keyLabel3];
                    
                    UILabel *keyLabel4=[self LabelWithFrame:CGRectMake(20, 70, 300, 20) Title:[NSString stringWithFormat:@"入住人: %@",data.contractName]];
                    [cell addSubview:keyLabel4];
                    
                    UILabel *keyLabel5=[self LabelWithFrame:CGRectMake(20, 90, 300, 20) Title:[NSString stringWithFormat:@"联系人: %@",data.contractName]];
                    [cell addSubview:keyLabel5];
                    
                    UILabel *keyLabel6=[self LabelWithFrame:CGRectMake(20, 110, 300, 20) Title:[NSString stringWithFormat:@"电话: %@",data.contractTel]];
                    [cell addSubview:keyLabel6];
                    
                }
                    break;
                default:
                    break;
            }
        }
            break;
        case 1:
        {
            UILabel *keyLabel=[[UILabel alloc] initWithFrame:CGRectMake(20, 10, 120, 20)];
            keyLabel.text=@"订单总价";
            keyLabel.backgroundColor=[UIColor clearColor];
            [cell addSubview:keyLabel];
            UILabel *valueLabel=[[UILabel alloc] initWithFrame:CGRectMake(160, 10, 120, 20)];
            valueLabel.backgroundColor=[UIColor clearColor];
            valueLabel.textColor=[UIColor orangeColor];
            valueLabel.font=[UIFont systemFontOfSize:16.0];
            valueLabel.text=[NSString stringWithFormat:@"￥%.1f",[data totalPrice]];
            [cell addSubview:valueLabel];
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
    int section=[indexPath section];
    int row=[indexPath row];
    
    switch (section) {
        case 0:
        {
            switch (row) {
                case 2:
                {
                    return 80;
                }
                    break;
                case 4:
                {
                    return 160;
                }
                    break;
                default:
                {
                    return 40;
                }
                    break;
            }
        }
            break;
            
        default:
        {
            return 40;
        }
            break;
    }
}

#pragma mark init
-(void)initData
{
    data=[ReserveData sharedReserveData];
}
-(void)initTableView
{
    detailTableView=[[UITableView alloc] initWithFrame:CGRectMake(0, 44, 320, self.view.frame.size.height-44) style:UITableViewStyleGrouped];
    detailTableView.delegate=self;
    detailTableView.dataSource=self;
    detailTableView.backgroundColor=[UIColor clearColor];
    UIView *tmp=[[UIView alloc] init];
    detailTableView.backgroundView=tmp;
    //checkinTableView.scrollEnabled=NO;
    [self.view addSubview:detailTableView];
}
-(void)initNav
{
    self.view.backgroundColor=[UIColor whiteColor];
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
-(void)initButton
{
    UIView *footerView=[[UIView alloc] initWithFrame:CGRectMake(0, 0, 320, 100)];
    
    UIButton *Btn1=[UIButton buttonWithType:UIButtonTypeRoundedRect];
    Btn1.frame=CGRectMake(20, 30, 120, 40);
    [Btn1 addTarget:self action:@selector(btnQueryPressed:) forControlEvents:UIControlEventTouchUpInside];
    [Btn1 setTitle:@"前台支付" forState:UIControlStateNormal];
    
    UIButton *Btn2=[UIButton buttonWithType:UIButtonTypeRoundedRect];
    Btn2.frame=CGRectMake(160, 30, 140, 40);
    [Btn2 addTarget:self action:@selector(btnQueryPressed:) forControlEvents:UIControlEventTouchUpInside];
    [Btn2 setTitle:@"网上支付,更多优惠" forState:UIControlStateNormal];
    
    [footerView addSubview:Btn1];
    [footerView addSubview:Btn2];
    [detailTableView setTableFooterView:footerView];
}

#pragma mark builder method
-(UILabel *)LabelWithFrame:(CGRect)rect Title:(NSString *)title
{
    UILabel *label=[[UILabel alloc] initWithFrame:rect];
    label.backgroundColor=[UIColor clearColor];
    label.font=[UIFont systemFontOfSize:16.0];
    label.text=title;
    return label;
    
}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
#pragma mark button
-(void)leftButtonClick:(id)sender
{
    [self.navigationController popViewControllerAnimated:YES];
}
@end
