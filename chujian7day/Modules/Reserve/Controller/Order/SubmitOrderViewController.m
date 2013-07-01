//
//  SubmitOrderViewController.m
//  chujian7day
//
//  Created by simon on 13-4-23.
//  Copyright (c) 2013年 chujian. All rights reserved.
//

#import "SubmitOrderViewController.h"

@interface SubmitOrderViewController ()

@end

@implementation SubmitOrderViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    // init data
    [self initData];
    
    // init view
    [self initNav];
    [self initTableView];
    [self initButton];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 3;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    switch (section) {
        case 0:
        {
            return (showGoods)?5:4;
        }
            break;
        case 1:
        {
            return 1;
        }
            break;
        case 2:
        {
            return 2;
        }
            break;
        default:
            break;
    }
    return 0;
}

-(UIView*)tableView:(UITableView*)tableView viewForHeaderInSection:(NSInteger)section
{
    switch (section) {
        case 0:  // 住店信息
        {
            UILabel *label=[[UILabel alloc] initWithFrame:CGRectMake(0, 0, 320, 20)];
            label.backgroundColor=[UIColor clearColor];
            label.text=@"住店信息";
            return label;
        }
            break;
        case 1:  // 入住人信息
        {
            UILabel *label=[[UILabel alloc] initWithFrame:CGRectMake(0, 0, 320, 20)];
            label.backgroundColor=[UIColor clearColor];
            label.text=@"入住人信息";
            return label;
        }
            break;
        case 2:  // 联系人信息
        {
            UILabel *label=[[UILabel alloc] initWithFrame:CGRectMake(0, 0, 320, 20)];
            label.backgroundColor=[UIColor clearColor];
            label.text=@"联系人信息";
            return label;
        }
            break;
        default:
            break;
    }
    
    return nil;
    
}

-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 30;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    int section=[indexPath section];
    int row=[indexPath row];
    
    UITableViewCell *cell=[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:nil];
    UILabel *keyLabel=[[UILabel alloc] initWithFrame:CGRectMake(20, 10, 150, 20)];
    keyLabel.backgroundColor=[UIColor clearColor];
    keyLabel.font=[UIFont systemFontOfSize:16.0];
    [cell addSubview:keyLabel];
    
    switch (section)
    {
        case 0:
        {
            switch (row) {
                case 0:
                {
                    // 酒店名字
                    keyLabel.text=data.selectedHotel.name;
                    UILabel *valueLabel=[[UILabel alloc] initWithFrame:CGRectMake(200, 10, 150, 20)];
                    valueLabel.backgroundColor=[UIColor clearColor];
                    valueLabel.font=[UIFont systemFontOfSize:16.0];
                    valueLabel.text=@"共住  晚";
                    [cell addSubview:valueLabel];
                    // 住几晚
                    UILabel *numberLabel=[[UILabel alloc] initWithFrame:CGRectMake(230, 10, 20, 20)];
                    numberLabel.backgroundColor=[UIColor clearColor];
                    numberLabel.text=data.dayStr;
                    numberLabel.font=[UIFont systemFontOfSize:16.0];
                    [cell addSubview:numberLabel];
                }
                    break;
                case 1:
                {
                    keyLabel.text=@"住店日期";
                    UILabel *valueLabel=[[UILabel alloc] initWithFrame:CGRectMake(130, 10, 200, 20)];
                    valueLabel.backgroundColor=[UIColor clearColor];
                    ReserveTime *s=data.startTime;
                    ReserveTime *e=data.endTime;
                    
                    valueLabel.text=[NSString stringWithFormat:@"%@ %@ 至 %@ %@",s.dateString,s.weekString,e.dateString,e.weekString];
                    valueLabel.font=[UIFont systemFontOfSize:15.0];
                    [cell addSubview:valueLabel];
                }
                    break;
                case 2:
                {
                    // 房型
                    keyLabel.text=data.selectedRoom.name;
                    // 数量
                    UILabel *numberLabel=[[UILabel alloc] initWithFrame:CGRectMake(120, 10, 120, 20)];
                    numberLabel.backgroundColor=[UIColor clearColor];
                    numberLabel.text=[NSString stringWithFormat:@"%d间",data.roomCount];
                    numberLabel.font=[UIFont systemFontOfSize:15.0];
                    [cell addSubview:numberLabel];
                    // 价钱
                    UILabel *valueLabel=[[UILabel alloc] initWithFrame:CGRectMake(240, 10, 120, 20)];
                    valueLabel.backgroundColor=[UIColor clearColor];
                    valueLabel.text=[NSString stringWithFormat:@"￥%.1f",data.selectedRoom.price * (float)data.roomCount];
                    valueLabel.font=[UIFont systemFontOfSize:16.0];
                    valueLabel.textColor=[UIColor blueColor];
                    [cell addSubview:valueLabel];
                    
                }
                    break;
                case 3:
                {
                    if(showGoods)
                    {
                        keyLabel.text=@"酒店用品";
                        NSMutableArray *arr=data.goods;
                        for(int i=0;i< [arr count];i++)
                        {
                            // 类型
                            UILabel *valueLabel=[[UILabel alloc] initWithFrame:CGRectMake(100, 10+i*20, 200, 20)];
                            valueLabel.backgroundColor=[UIColor clearColor];
                            Goods *g=[arr objectAtIndex:i];
                            valueLabel.text=[NSString stringWithFormat:@"%@",g.goodsName];
                            valueLabel.font=[UIFont systemFontOfSize:15.0];
                            [cell addSubview:valueLabel];
                            
                            // 价钱
                            UILabel *priceLabel=[[UILabel alloc] initWithFrame:CGRectMake(240, 10+i*20, 120, 20)];
                            priceLabel.backgroundColor=[UIColor clearColor];
                            priceLabel.text=[NSString stringWithFormat:@"￥%.1f",g.price*g.quantiry];
                            priceLabel.font=[UIFont systemFontOfSize:16.0];
                            priceLabel.textColor=[UIColor blueColor];
                            [cell addSubview:priceLabel];
                        }
                        
                    }
                    else
                    {
                        keyLabel.text=@"总价";
                        UILabel *valueLabel=[[UILabel alloc] initWithFrame:CGRectMake(240, 10, 120, 20)];
                        valueLabel.backgroundColor=[UIColor clearColor];
                        valueLabel.text=[NSString stringWithFormat:@"￥%.1f",[data totalPrice]];
                        valueLabel.textColor=[UIColor orangeColor];
                        valueLabel.font=[UIFont systemFontOfSize:16.0];
                        [cell addSubview:valueLabel];
                    }
                    
                }
                    break;
                case 4:
                {
                    keyLabel.text=@"总价";
                    UILabel *valueLabel=[[UILabel alloc] initWithFrame:CGRectMake(240, 10, 120, 20)];
                    valueLabel.backgroundColor=[UIColor clearColor];
                    valueLabel.text=[NSString stringWithFormat:@"￥%.1f",[data totalPrice]];
                    valueLabel.textColor=[UIColor orangeColor];
                    valueLabel.font=[UIFont systemFontOfSize:16.0];
                    [cell addSubview:valueLabel];
                }
                    break;
                default:
                    break;
            }
        }
            break;
        case 1:
        {
            keyLabel.text=@"姓名";
            UILabel *valueLabel=[[UILabel alloc] initWithFrame:CGRectMake(160, 10, 120, 20)];
            valueLabel.backgroundColor=[UIColor clearColor];
            valueLabel.text=data.contractName;
            valueLabel.font=[UIFont systemFontOfSize:15.0];
            [cell addSubview:valueLabel];
        }
            break;
        case 2:
        {
            switch (row) {
                case 0:
                {
                    keyLabel.text=@"姓名";
                    UILabel *valueLabel=[[UILabel alloc] initWithFrame:CGRectMake(160, 10, 120, 20)];
                    valueLabel.backgroundColor=[UIColor clearColor];
                    valueLabel.text=data.contractName;
                    valueLabel.font=[UIFont systemFontOfSize:15.0];
                    [cell addSubview:valueLabel];
                }
                    break;
                case 1:
                {
                    keyLabel.text=@"电话";
                    UILabel *valueLabel=[[UILabel alloc] initWithFrame:CGRectMake(160, 10, 120, 20)];
                    valueLabel.backgroundColor=[UIColor clearColor];
                    valueLabel.text=data.contractTel;
                    valueLabel.font=[UIFont systemFontOfSize:15.0];
                    [cell addSubview:valueLabel];
                }
                default:
                    break;
            }
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
    float height=40;
    if(showGoods && [indexPath row]==3)
    {
        height=40*[data.goods count];
    }
    return height;
}

#pragma mark init
-(void)initData
{
    data=[ReserveData sharedReserveData];
    if([data.goods count]==0)
        showGoods=NO;
    else
        showGoods=YES;
}
-(void)initTableView
{
    submitTableView=[[UITableView alloc] initWithFrame:CGRectMake(0, 44, 320, self.view.frame.size.height-44) style:UITableViewStyleGrouped];
    submitTableView.delegate=self;
    submitTableView.dataSource=self;
    submitTableView.backgroundColor=[UIColor clearColor];
    UIView *tmp=[[UIView alloc] init];
    submitTableView.backgroundView=tmp;
    //checkinTableView.scrollEnabled=NO;
    [self.view addSubview:submitTableView];
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
    
    UIButton *searchBtn=[UIButton buttonWithType:UIButtonTypeRoundedRect];
    searchBtn.frame=CGRectMake(100, 30, 100, 40);
    [searchBtn addTarget:self action:@selector(btnQueryPressed:) forControlEvents:UIControlEventTouchUpInside];
    [searchBtn setTitle:@"提交订单" forState:UIControlStateNormal];
    
    [footerView addSubview:searchBtn];
    [submitTableView setTableFooterView:footerView];
}

#pragma mark Button Clicked
-(void)btnQueryPressed:(id)sender
{
    OrderDetailViewController *detailVC=[[OrderDetailViewController alloc] init];
    [self.navigationController pushViewController:detailVC animated:YES];
}
-(void)leftButtonClick:(id)sender
{
    [self.navigationController popViewControllerAnimated:YES];
}

@end
