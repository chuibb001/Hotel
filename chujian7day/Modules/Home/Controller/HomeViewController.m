//
//  HomeViewController.m
//  chujian7day
//
//  Created by yan kai on 13-4-16.
//  Copyright (c) 2013年 chujian. All rights reserved.
//

#import "HomeViewController.h"
#import <QuartzCore/QuartzCore.h>
#import "ReserveQueryViewController.h"
#import "PersonViewController.h"
//#import "loginViewController.h"
#import "PayOrderViewController.h"

@interface HomeViewController ()

@end

@implementation HomeViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    
    /**     初始化UI   **/
    CGFloat pageWidth = self.view.frame.size.width;
    
    btnReserve = [UIButton buttonWithType:UIButtonTypeCustom];
    [btnReserve setBackgroundColor:[UIColor grayColor]];
    [btnReserve setFrame:CGRectMake(20, 20, pageWidth-40, 50)];
    [btnReserve setTitle:@"酒店预订" forState:UIControlStateNormal];
    [btnReserve addTarget:self action:@selector(switchToReserve) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btnReserve];
    
    btnNearHotel = [UIButton buttonWithType:UIButtonTypeCustom];
    [btnNearHotel setBackgroundColor:[UIColor grayColor]];
    [btnNearHotel setFrame:CGRectMake(20, 90, pageWidth-40, 50)];
    [btnNearHotel setTitle:@"附近酒店" forState:UIControlStateNormal];
    [btnNearHotel addTarget:self action:@selector(switchToNearHotel) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btnNearHotel];
    
    btnCoupon = [UIButton buttonWithType:UIButtonTypeCustom];
    [btnCoupon setBackgroundColor:[UIColor grayColor]];
    [btnCoupon setFrame:CGRectMake(20, 160, pageWidth-40, 50)];
    [btnCoupon setTitle:@"专属优惠" forState:UIControlStateNormal];
    [btnCoupon addTarget:self action:@selector(switchToCoupon) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btnCoupon];
    
    btnActivity = [UIButton buttonWithType:UIButtonTypeCustom];
    [btnActivity setBackgroundColor:[UIColor grayColor]];
    [btnActivity setFrame:CGRectMake(20, 230, pageWidth-40, 50)];
    [btnActivity setTitle:@"最近活动" forState:UIControlStateNormal];
    [btnActivity addTarget:self action:@selector(switchToActivity) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btnActivity];
    
    /**     初始化新手指引图    **/
    // TODO:需要读取是否第一次打开应用
    startViewCtrl = [[GuideViewController alloc] init];
    startViewCtrl.delegate = self;
    
    if([self isBeginner]) {
        NSArray* startupImageList = [NSArray arrayWithObjects:@"img_01.jpg", @"img_02.jpg", @"img_03.jpg", nil];
        [startViewCtrl initStartImages:startupImageList];
        
        [self.navigationController.view addSubview:startViewCtrl.view];
    }
    
    /**     添加个人主页的按钮       **/
    //
    [self intNav];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(BOOL)isBeginner
{
    // TODO:需要读取本地文件
    return NO;
}

#pragma mark -
#pragma GuideViewController delegate
-(void)dismissGuide
{
    // Do something
}

#pragma mark -
#pragma 功能路由
-(void)switchToReserve
{
    ReserveQueryViewController* reserveQueryCtrl = [[ReserveQueryViewController alloc] init];
    [self.navigationController pushViewController:reserveQueryCtrl animated:YES];
}

-(void)switchToNearHotel
{
    NSLog(@"跳到：附近酒店");
}

-(void)switchToCoupon
{
    NSLog(@"跳到：专属优惠");
}

-(void)switchToActivity
{
    NSLog(@"跳到：最近活动");
    PayOrderViewController* payCtrl = [[PayOrderViewController alloc] init];
    [self.navigationController pushViewController:payCtrl animated:YES];
}

#pragma mark - Navigation Related Stuff
-(void)intNav{
    self.navigationItem.leftBarButtonItem=[[UIBarButtonItem alloc] initWithTitle:@"个人" style:UIBarButtonItemStyleDone target:self action:@selector(pushLeft)];
}

-(void)pushLeft{
    PersonViewController *personViewController=[[PersonViewController alloc] init];
   
    
    [self.revealSideViewController pushViewController:personViewController onDirection:PPRevealSideDirectionLeft animated:YES];
}
@end
