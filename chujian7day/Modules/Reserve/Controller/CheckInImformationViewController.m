//
//  CheckInImformationViewController.m
//  chujian7day
//
//  Created by simon on 13-4-22.
//  Copyright (c) 2013年 chujian. All rights reserved.
//

#import "CheckInImformationViewController.h"

@interface CheckInImformationViewController ()

@end

@implementation CheckInImformationViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    [self initNav];
    [self initTableView];
    [self initButton];
    [self initCustomView];
}
#pragma mark UITableView
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    switch (section) {
        case 0:
        {
            return 1;
        }
            break;
        case 1:
        {
            return counterView.count;
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

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 3;
}
-(UIView*)tableView:(UITableView*)tableView viewForHeaderInSection:(NSInteger)section
{
    switch (section) {
        case 0:  // 订房数量
        {
            UILabel *label=[[UILabel alloc] initWithFrame:CGRectMake(0, 0, 320, 20)];
            label.backgroundColor=[UIColor clearColor];
            label.text=@"订房数量";
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
-(UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section
{
    if(section==0)
    {
        UILabel *label=[[UILabel alloc] initWithFrame:CGRectMake(0, 0, 320, 20)];
        label.backgroundColor=[UIColor clearColor];
        label.text=@"提示";
        return label;
    }
    return nil;
}
-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 30;
}
-(CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
{
    return 20;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    int section=[indexPath section];
    int row=[indexPath row];
    
    static NSString *cellIdentifier=@"checkCell";
    UITableViewCell *cell=[tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    UILabel *keyLabel;
    if(cell==nil)
    {
        cell=[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier];
        // Key Label
        keyLabel=[[UILabel alloc] initWithFrame:CGRectMake(20, 10, 120, 30)];
        keyLabel.backgroundColor=[UIColor clearColor];
        [cell addSubview:keyLabel];
        
        if(section == 1)
        {
            switch (row) {
                case 0:
                {
                    textField1=[[UITextField alloc] initWithFrame:CGRectMake(90, 10, 100, 30)];
                    textField1.background=nil;
                    textField1.backgroundColor=[UIColor clearColor];
                    textField1.returnKeyType=UIReturnKeyDone;
                    textField1.delegate=self;
                    [cell addSubview:textField1];
                    
                }
                break;
                case 1:
                {
                    textField2=[[UITextField alloc] initWithFrame:CGRectMake(90, 10, 100, 30)];
                    textField2.background=nil;
                    textField2.backgroundColor=[UIColor clearColor];
                    textField2.returnKeyType=UIReturnKeyDone;
                    textField2.delegate=self;
                    [cell addSubview:textField2];
                    
                }
                break;
                case 2:
                {
                    textField3=[[UITextField alloc] initWithFrame:CGRectMake(90, 10, 100, 30)];
                    textField3.background=nil;
                    textField3.backgroundColor=[UIColor clearColor];
                    textField3.returnKeyType=UIReturnKeyDone;
                    textField3.delegate=self;
                    [cell addSubview:textField3];
                }
                break;
                default:
                break;
            }
        }
    }
    switch (section)
    {
        case 0:  // 订房数量
        {
            keyLabel.text=@"自主大床房";
            // 计数器
            [counterView.addButton addTarget:self action:@selector(addButtonClicked:) forControlEvents:UIControlEventTouchUpInside];
            [counterView.minusButton addTarget:self action:@selector(minusButtonClicked:) forControlEvents:UIControlEventTouchUpInside];
            [cell addSubview:counterView];
            
        }
        break;
        case 1:  // 入住人信息
        {
            keyLabel.text=@"姓名";
            
        }
        break;
        case 2:  // 联系人信息
        {
            if(row==0)
            {
                keyLabel.text=@"姓名";
                contractTextField=[[UITextField alloc] initWithFrame:CGRectMake(90, 10, 100, 30)];
                contractTextField.background=nil;
                contractTextField.backgroundColor=[UIColor clearColor];
                contractTextField.returnKeyType=UIReturnKeyDone;
                contractTextField.delegate=self;
                [cell addSubview:contractTextField];
            }
            else
            {
                keyLabel.text=@"电话";
                phoneTextField=[[UITextField alloc] initWithFrame:CGRectMake(90, 10, 100, 30)];
                phoneTextField.background=nil;
                phoneTextField.backgroundColor=[UIColor clearColor];
                phoneTextField.returnKeyType=UIReturnKeyDone;
                phoneTextField.delegate=self;
                [cell addSubview:phoneTextField];
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
    checkinTableView=[[UITableView alloc] initWithFrame:CGRectMake(0, 44, 320, self.view.frame.size.height-44) style:UITableViewStyleGrouped];
    checkinTableView.delegate=self;
    checkinTableView.dataSource=self;
    checkinTableView.backgroundColor=[UIColor clearColor];
    UIView *tmp=[[UIView alloc] init];
    checkinTableView.backgroundView=tmp;
    //checkinTableView.scrollEnabled=NO;
    [self.view addSubview:checkinTableView];
}
-(void)initNav
{
    self.view.backgroundColor=[UIColor whiteColor];
    self.navigationController.navigationBar.hidden=YES;
    UINavigationBar *navigationBar = [[UINavigationBar alloc] initWithFrame:CGRectMake(0, 0, 320, 44)];
    UINavigationItem *navagationItem = [[UINavigationItem alloc] initWithTitle:@"酒店列表"];
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
-(void)initCustomView
{
    counterView=[[CounterView alloc] initWithFrame:CGRectMake(160, 0, 100, 40)];
}
#pragma mark Button Clicked
-(void)btnQueryPressed:(id)sender
{
    HotelCommodityViewController *commodityVC=[[HotelCommodityViewController alloc] init];
    [self.navigationController pushViewController:commodityVC animated:YES];
}
-(void)leftButtonClick:(id)sender
{
    [self.navigationController popViewControllerAnimated:YES];
}
-(void)addButtonClicked:(id)sender
{
    if([counterView Add])
    {
        // 增加一行
        NSIndexPath *ip=[NSIndexPath indexPathForRow:[counterView count]-1 inSection:1];
        NSArray *arr=[[NSArray alloc] initWithObjects:ip, nil];
        [checkinTableView insertRowsAtIndexPaths:arr withRowAnimation:UITableViewRowAnimationAutomatic];
    }
    
}
-(void)minusButtonClicked:(id)sender
{
    if([counterView Minus])
    {
        // 减少一行
        NSIndexPath *ip=[NSIndexPath indexPathForRow:[counterView count] inSection:1];
        NSArray *arr=[[NSArray alloc] initWithObjects:ip, nil];
        [checkinTableView deleteRowsAtIndexPaths:arr withRowAnimation:UITableViewRowAnimationAutomatic];
    }
}

#pragma mark 键盘
- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [textField1 resignFirstResponder];
    [textField2 resignFirstResponder];
    [textField3 resignFirstResponder];
    [phoneTextField resignFirstResponder];
    [contractTextField resignFirstResponder];
    return YES;
}@end
