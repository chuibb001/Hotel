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
            return 5;
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
    UILabel *keyLabel=[[UILabel alloc] initWithFrame:CGRectMake(20, 10, 120, 30)];
    keyLabel.backgroundColor=[UIColor clearColor];
    [cell addSubview:keyLabel];
    
    switch (section)
    {
        case 0:
        {
            switch (row) {
                case 0:
                {
                    keyLabel.text=@"7天中大北门店";
                    UILabel *valueLabel=[[UILabel alloc] initWithFrame:CGRectMake(160, 10, 120, 20)];
                    valueLabel.backgroundColor=[UIColor clearColor];
                    valueLabel.text=@"共住1晚";
                    [cell addSubview:valueLabel];
                }
                    break;
                case 1:
                {
                    keyLabel.text=@"住店日期";
                    UILabel *valueLabel=[[UILabel alloc] initWithFrame:CGRectMake(160, 10, 120, 20)];
                    valueLabel.backgroundColor=[UIColor clearColor];
                    valueLabel.text=@"04-08";
                    [cell addSubview:valueLabel];
                }
                    break;
                case 2:
                {
                    keyLabel.text=@"自主大床房";
                    UILabel *valueLabel=[[UILabel alloc] initWithFrame:CGRectMake(160, 10, 120, 20)];
                    valueLabel.backgroundColor=[UIColor clearColor];
                    valueLabel.text=@"￥230";
                    [cell addSubview:valueLabel];
                }
                    break;
                case 3:
                {
                    keyLabel.text=@"自主大床房";
                    UILabel *valueLabel=[[UILabel alloc] initWithFrame:CGRectMake(160, 10, 120, 20)];
                    valueLabel.backgroundColor=[UIColor clearColor];
                    valueLabel.text=@"￥230";
                    [cell addSubview:valueLabel];
                }
                    break;
                case 4:
                {
                    keyLabel.text=@"总价";
                    UILabel *valueLabel=[[UILabel alloc] initWithFrame:CGRectMake(160, 10, 120, 20)];
                    valueLabel.backgroundColor=[UIColor clearColor];
                    valueLabel.text=@"￥230";
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
            valueLabel.text=@"李一名";
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
                    valueLabel.text=@"李一明";
                    [cell addSubview:valueLabel];
                }
                    break;
                case 1:
                {
                    keyLabel.text=@"电话";
                    UILabel *valueLabel=[[UILabel alloc] initWithFrame:CGRectMake(160, 10, 120, 20)];
                    valueLabel.backgroundColor=[UIColor clearColor];
                    valueLabel.text=@"13978982345";
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
    return 40;
}

#pragma mark init
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
    UIButton *searchBtn=[UIButton buttonWithType:UIButtonTypeRoundedRect];
    searchBtn.frame=CGRectMake(100, 400, 100, 50);
    [searchBtn addTarget:self action:@selector(btnQueryPressed:) forControlEvents:UIControlEventTouchUpInside];
    [searchBtn setTitle:@"下一步" forState:UIControlStateNormal];
    [self.view addSubview:searchBtn];
}

#pragma mark Button Clicked
-(void)btnQueryPressed:(id)sender
{
    OrderDetailViewController *detailVC=[[OrderDetailViewController alloc] init];
    [self.navigationController pushViewController:detailVC animated:YES];
}

@end
