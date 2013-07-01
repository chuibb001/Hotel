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
            switch (row) {
                case 0:
                {
                    UILabel *keyLabel=[[UILabel alloc] initWithFrame:CGRectMake(20, 10, 120, 30)];
                    keyLabel.backgroundColor=[UIColor clearColor];
                    [cell addSubview:keyLabel];
                    keyLabel.text=@"订单编号:";
                    UILabel *valueLabel=[[UILabel alloc] initWithFrame:CGRectMake(160, 10, 120, 20)];
                    valueLabel.backgroundColor=[UIColor clearColor];
                    valueLabel.text=@"123456";
                    [cell addSubview:valueLabel];
                }
                    break;
                case 1:
                {
                    UILabel *keyLabel=[[UILabel alloc] initWithFrame:CGRectMake(20, 10, 120, 30)];
                    keyLabel.backgroundColor=[UIColor clearColor];
                    [cell addSubview:keyLabel];
                    keyLabel.text=@"酒店信息:";
                }
                    break;
                case 2:
                {
                    UILabel *keyLabel=[[UILabel alloc] initWithFrame:CGRectMake(20, 10, 120, 30)];
                    keyLabel.backgroundColor=[UIColor clearColor];
                    [cell addSubview:keyLabel];
                    keyLabel.text=@"入住酒店:";
                    
                    UILabel *keyLabel2=[[UILabel alloc] initWithFrame:CGRectMake(20, 30, 120, 30)];
                    keyLabel2.backgroundColor=[UIColor clearColor];
                    keyLabel2.text=@"酒店地址:";
                    [cell addSubview:keyLabel2];
                    
                    UILabel *keyLabel3=[[UILabel alloc] initWithFrame:CGRectMake(20, 50, 120, 30)];
                    keyLabel3.backgroundColor=[UIColor clearColor];
                    keyLabel3.text=@"联系电话";
                    [cell addSubview:keyLabel3];
                    
                    UILabel *valueLabel=[[UILabel alloc] initWithFrame:CGRectMake(160, 10, 120, 20)];
                    valueLabel.backgroundColor=[UIColor clearColor];
                    valueLabel.text=@"7天中大北门店";
                    [cell addSubview:valueLabel];
                    
                    UILabel *valueLabel2=[[UILabel alloc] initWithFrame:CGRectMake(160, 30, 120, 20)];
                    valueLabel2.backgroundColor=[UIColor clearColor];
                    valueLabel2.text=@"广州大道南";
                    [cell addSubview:valueLabel2];
                    
                    UILabel *valueLabel3=[[UILabel alloc] initWithFrame:CGRectMake(160, 50, 120, 20)];
                    valueLabel3.backgroundColor=[UIColor clearColor];
                    valueLabel3.text=@"62254645";
                    [cell addSubview:valueLabel3];
                    
                }
                    break;
                case 3:
                {
                    UILabel *keyLabel=[[UILabel alloc] initWithFrame:CGRectMake(20, 10, 120, 30)];
                    keyLabel.text=@"入住信息:";
                    keyLabel.backgroundColor=[UIColor clearColor];
                    [cell addSubview:keyLabel];
                }
                    break;
                case 4:
                {
                    // 标签
                    UILabel *keyLabel=[[UILabel alloc] initWithFrame:CGRectMake(20, 10, 120, 30)];
                    keyLabel.backgroundColor=[UIColor clearColor];
                    [cell addSubview:keyLabel];
                    keyLabel.text=@"住店日期:";
                    
                    UILabel *keyLabel2=[[UILabel alloc] initWithFrame:CGRectMake(20, 30, 120, 30)];
                    keyLabel2.backgroundColor=[UIColor clearColor];
                    keyLabel2.text=@"房间数量:";
                    [cell addSubview:keyLabel2];
                    
                    UILabel *keyLabel3=[[UILabel alloc] initWithFrame:CGRectMake(20, 50, 120, 30)];
                    keyLabel3.backgroundColor=[UIColor clearColor];
                    keyLabel3.text=@"入住类型";
                    [cell addSubview:keyLabel3];
                    
                    UILabel *keyLabel4=[[UILabel alloc] initWithFrame:CGRectMake(20, 70, 120, 30)];
                    keyLabel4.backgroundColor=[UIColor clearColor];
                    [cell addSubview:keyLabel4];
                    keyLabel4.text=@"入住人:";
                    
                    UILabel *keyLabel5=[[UILabel alloc] initWithFrame:CGRectMake(20, 90, 120, 30)];
                    keyLabel5.backgroundColor=[UIColor clearColor];
                    keyLabel5.text=@"联系人:";
                    [cell addSubview:keyLabel5];
                    
                    UILabel *keyLabel6=[[UILabel alloc] initWithFrame:CGRectMake(20, 110, 120, 30)];
                    keyLabel6.backgroundColor=[UIColor clearColor];
                    keyLabel6.text=@"电话";
                    [cell addSubview:keyLabel6];
                    
                    // 内容
                    UILabel *valueLabel=[[UILabel alloc] initWithFrame:CGRectMake(160, 10, 120, 20)];
                    valueLabel.backgroundColor=[UIColor clearColor];
                    valueLabel.text=@"7天中大北门店";
                    [cell addSubview:valueLabel];
                    
                    UILabel *valueLabel2=[[UILabel alloc] initWithFrame:CGRectMake(160, 30, 120, 20)];
                    valueLabel2.backgroundColor=[UIColor clearColor];
                    valueLabel2.text=@"广州大道南";
                    [cell addSubview:valueLabel2];
                    
                    UILabel *valueLabel3=[[UILabel alloc] initWithFrame:CGRectMake(160, 50, 120, 20)];
                    valueLabel3.backgroundColor=[UIColor clearColor];
                    valueLabel3.text=@"62254645";
                    [cell addSubview:valueLabel3];
                    
                    UILabel *valueLabel4=[[UILabel alloc] initWithFrame:CGRectMake(160, 70, 120, 20)];
                    valueLabel4.backgroundColor=[UIColor clearColor];
                    valueLabel4.text=@"7天中大北门店";
                    [cell addSubview:valueLabel4];
                    
                    UILabel *valueLabel5=[[UILabel alloc] initWithFrame:CGRectMake(160, 90, 120, 20)];
                    valueLabel5.backgroundColor=[UIColor clearColor];
                    valueLabel5.text=@"广州大道南";
                    [cell addSubview:valueLabel5];
                    
                    UILabel *valueLabel6=[[UILabel alloc] initWithFrame:CGRectMake(160, 110, 120, 20)];
                    valueLabel6.backgroundColor=[UIColor clearColor];
                    valueLabel6.text=@"62254645";
                    [cell addSubview:valueLabel6];
                }
                    break;
                default:
                    break;
            }
        }
            break;
        case 1:
        {
            UILabel *keyLabel=[[UILabel alloc] initWithFrame:CGRectMake(20, 10, 120, 30)];
            keyLabel.text=@"订单总价";
            keyLabel.backgroundColor=[UIColor clearColor];
            [cell addSubview:keyLabel];
            UILabel *valueLabel=[[UILabel alloc] initWithFrame:CGRectMake(160, 10, 120, 20)];
            valueLabel.backgroundColor=[UIColor clearColor];
            valueLabel.text=@"￥230";
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
    UIButton *searchBtn=[UIButton buttonWithType:UIButtonTypeRoundedRect];
    searchBtn.frame=CGRectMake(100, 400, 100, 50);
    [searchBtn addTarget:self action:@selector(btnQueryPressed:) forControlEvents:UIControlEventTouchUpInside];
    [searchBtn setTitle:@"下一步" forState:UIControlStateNormal];
    [self.view addSubview:searchBtn];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
