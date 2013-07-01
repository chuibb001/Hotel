//
//  PersonViewController.m
//  chujian7day
//
//  Created by 王 瑞 on 13-4-19.
//  Copyright (c) 2013年 chujian. All rights reserved.
//

#import "PersonViewController.h"
#import "MyViewController.h"
#import "LoginViewController.h"
#import "MemberDetail.h"
@interface PersonViewController ()

@end

@implementation PersonViewController


-(id)init{
    self=[super init];
    if (self) {
        isValid = NO;
    }
    return self;
}
- (void)viewDidLoad
{
    [super viewDidLoad];
	
    [self initView];
}


-(void)viewWillAppear:(BOOL)animated{
    if ([[NSUserDefaults standardUserDefaults] objectForKey:@"token"]) {
        isValid = YES;
        NSDictionary *dict = [[NSUserDefaults standardUserDefaults] objectForKey:@"userDetail"]; 
        NSString *nameString=[dict objectForKey:@"name"];
        NSString *singString=@"我的七天";
        NSString *level =[dict objectForKey:@"level"];
        if (![dict objectForKey:@"level"]) {
            level = @"0级";
        }
        NSString *levelString = level;
        [_headView setHeadImage:[UIImage imageNamed:@"placeholder.png"] nameString:nameString signString:singString leveString:levelString];
        [self setLogoutButtonHidden];
        [_mainTableView reloadData];
    }else{
        isValid = NO;
        NSString *warn=@"您尚未登陆7天账户";
        [_headView setHeadImage:[UIImage imageNamed:@"placeholder.png"] warningString:warn];
        [self setLogoutButtonHidden];
        [_mainTableView reloadData];
    }
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
   
}

#pragma mark -Get methods
-(NSMutableArray *)nameList{
    if (!_nameList) {
        _nameList=[[NSMutableArray alloc] initWithCapacity:10];
        [_nameList addObject:@"我的订单"];
        [_nameList addObject:@"我的会员资产"];
        [_nameList addObject:@"我的常驻与收藏"];
        [_nameList addObject:@"支付直通车管理"];
        [_nameList addObject:@"个人资料"];
        [_nameList addObject:@"帮助与反馈"];
        [_nameList addObject:@"随手拍"];
        [_nameList addObject:@"关于"];
    }
    return _nameList;
}

#pragma mark init methods
-(void)initView{
    if ([[NSUserDefaults standardUserDefaults] objectForKey:@"token"]) {
        isValid = YES;
    NSDictionary *dict = [[NSUserDefaults standardUserDefaults] objectForKey:@"userDetail"];

    _headView=[[PHeadView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, 95)];
    NSString *nameString=[dict objectForKey:@"name"];
    //    NSLog(@"%@",nameString);
    NSString *singString=@"我的七天";
        NSString *level =[dict objectForKey:@"level"];
    if (![dict objectForKey:@"level"]) {
             level = @"0级";
    }
        NSString *levelString = level;
    [_headView setHeadImage:[UIImage imageNamed:@"placeholder.png"] nameString:nameString signString:singString leveString:levelString];
    

    _mainTableView=[[UITableView alloc] initWithFrame:CGRectMake(0, 0,SCREEN_WIDTH,SCREEN_HEIGHT-70)  style:UITableViewStylePlain];
    _mainTableView.delegate=self;
    _mainTableView.dataSource=self;
    _mainTableView.backgroundColor=[UIColor clearColor];
    //_mainTableView.scrollEnabled=NO;
    _mainTableView.tableHeaderView=_headView;
    [self.view addSubview:_mainTableView];
    
    [self initLogoutButton];
    [self setLogoutButtonHidden];
    }else{
        isValid = NO;
         _headView=[[PHeadView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, 95)];
        NSString *warn=@"您尚未登陆7天账户";
        [_headView setHeadImage:[UIImage imageNamed:@"placeholder.png"] warningString:warn];
        
        _mainTableView=[[UITableView alloc] initWithFrame:CGRectMake(0, 0,SCREEN_WIDTH,SCREEN_HEIGHT-70)  style:UITableViewStylePlain];
        _mainTableView.delegate=self;
        _mainTableView.dataSource=self;
        _mainTableView.backgroundColor=[UIColor clearColor];
        //_mainTableView.scrollEnabled=NO;
        _mainTableView.tableHeaderView=_headView;
        [self.view addSubview:_mainTableView];
        [self initLogoutButton];
        [self setLogoutButtonHidden];
   }
    
        
        
}
-(void)initLogoutButton{
    _logoutButton=[UIButton buttonWithType:UIButtonTypeRoundedRect];
    _logoutButton.frame=CGRectMake(20, SCREEN_HEIGHT-65, SCREEN_WIDTH-120, 40);
    [_logoutButton setTitle:@"退出账号" forState:UIControlStateNormal];
    [_logoutButton addTarget:self action:@selector(logout) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:_logoutButton];
}
-(void)setLogoutButtonHidden{
    if (isValid) {
        _logoutButton.hidden=NO;
    }else{
        _logoutButton.hidden=YES;
    }
}
-(void)useIdentButtons:(UITableViewCell *)aCell{
    _loginButton=[UIButton buttonWithType:UIButtonTypeRoundedRect];
    _loginButton.frame=CGRectMake(20, 45, SCREEN_WIDTH-120, 40);
    [_loginButton setTitle:@"登陆" forState:UIControlStateNormal];
    [_loginButton addTarget:self action:@selector(login) forControlEvents:UIControlEventTouchUpInside];
    [aCell addSubview:_loginButton];
    
    _registerButton=[UIButton buttonWithType:UIButtonTypeRoundedRect];
    _registerButton.frame=CGRectMake(20, 105, SCREEN_WIDTH-120, 40);
    [_registerButton setTitle:@"注册" forState:UIControlStateNormal];
    [_registerButton addTarget:self action:@selector(regist) forControlEvents:UIControlEventTouchUpInside];
    [aCell addSubview:_registerButton];
}

#pragma mark - table view datasource
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    if (isValid) {
        return 8;
    }else{
        return 1;
    }
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    if(isValid)
    {
    static NSString *identifier=@"Cell";
    UITableViewCell *cell=[tableView dequeueReusableCellWithIdentifier:identifier];
    
    if (!cell) {
        cell=[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
        cell.textLabel.text=[self.nameList objectAtIndex:indexPath.row];
    }
    return cell;
    }
    else{
        static NSString *identifier=@"lrCell";
        UITableViewCell *cell=[tableView dequeueReusableCellWithIdentifier:identifier];
        
        if (!cell) {
            cell=[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
            [self useIdentButtons:cell];
            cell.selectionStyle=UITableViewCellSelectionStyleNone;
        }
        return cell;
    }
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (!isValid) {
        return SCREEN_HEIGHT-95;
    }else{
        return 45;
    }
}
#pragma  mark - table view delegate
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    if (isValid) {
        if (indexPath.row==0) {
        MyViewController *myviewController=[[MyViewController alloc] initWithNibName:nil bundle:nil];
        UINavigationController *nav = [[UINavigationController alloc] initWithRootViewController:myviewController];
        [self.revealSideViewController popViewControllerWithNewCenterController:nav
                                                                       animated:YES];
        }
    }else{
     
    }
}

#pragma mark - method
-(void)logout{
    [[NSUserDefaults standardUserDefaults] setObject:nil forKey:@"userDetail"];
    [[NSUserDefaults standardUserDefaults] setObject:nil forKey:@"token"];
    [_headView setHeadImage:[UIImage imageNamed:@"placeholder.png"] warningString:@"您尚未登陆7天账户"];
    isValid = NO;
    [_mainTableView reloadData];
    _logoutButton.hidden = YES;
}

-(void)login{
   
    LoginViewController *loginView = [[LoginViewController alloc] initWithNibName:nil bundle:nil];
    [self presentViewController:loginView animated:YES completion:nil];

    
}
-(void)regist{
    
}
@end
