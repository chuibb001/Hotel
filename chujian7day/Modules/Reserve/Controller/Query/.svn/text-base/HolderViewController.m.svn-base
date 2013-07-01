//
//  HolderViewController.m
//  chujian7day
//
//  Created by simon on 13-4-20.
//  Copyright (c) 2013年 chujian. All rights reserved.
//

#import "HolderViewController.h"

@interface HolderViewController ()

@end

@implementation HolderViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    [self setViewControler];
    [self initNav];
    
}

#pragma mark Init
-(void)initNav
{
    
    /*--------------------------
     这里必须要用自定义的navBar了
     不然不能实现动画效果...
     ---------------------------*/
    self.navigationController.navigationBar.hidden=YES;
    UINavigationBar *navigationBar = [[UINavigationBar alloc] initWithFrame:CGRectMake(0, 0, 320, 44)];
    UINavigationItem *navagationItem = [[UINavigationItem alloc] initWithTitle:@"酒店订阅"];
    [navigationBar pushNavigationItem:navagationItem animated:YES];
    [self.view addSubview:navigationBar];
    
    
    rightButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [rightButton setBackgroundColor:[UIColor clearColor]];
    rightButton.frame = CGRectMake(0, 0, 49,30);
    //UIImage *backImage=[[UIImage imageNamed:@"navibutton.png"] stretchableImageWithLeftCapWidth:5 topCapHeight:5];
    //[rightButton setBackgroundImage:backImage forState:UIControlStateNormal];
    [rightButton setTitle:@"地图" forState:UIControlStateNormal];
    rightButton.titleLabel.font=[UIFont fontWithName:@"Arial-BoldMT" size:14.0];
    [rightButton addTarget:self action:@selector(rightButtonClicked:) forControlEvents:UIControlEventTouchUpInside];
    UIBarButtonItem *button1 = [[UIBarButtonItem alloc] initWithCustomView:rightButton];
    
    [navagationItem setRightBarButtonItem:button1 animated:YES];
    
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
-(void)setViewControler
{
    resultVC=[[ReserveQueryResultViewController alloc] init];
    resultVC.delegate=self;
    [self.view addSubview:resultVC.view];
    current_vc=1;
}

#pragma mark Button Clicked
-(void)rightButtonClicked:(id)sender
{
    [UIView beginAnimations:@"Curl" context:nil];
    //    平滑动画效果
    [UIView setAnimationCurve:UIViewAnimationCurveEaseIn];
    [UIView setAnimationDuration:0.8];
    [UIView setAnimationTransition:UIViewAnimationTransitionFlipFromLeft forView:self.view cache:YES];
    
    // 页面切换
    if(current_vc==1)
    {
        if(!mapVC)
        {
            mapVC=[[HotelMapViewController alloc] init];
            mapVC.delegate=self;
        }
        [resultVC.view removeFromSuperview];
        [self.view insertSubview:mapVC.view atIndex:0];
        current_vc=2;
        
        [rightButton setTitle:@"列表" forState:UIControlStateNormal];
    }
    else
    {
        if(!resultVC)
        {
            resultVC=[[ReserveQueryResultViewController alloc] init];
            resultVC.delegate=self;
        }
        [mapVC.view removeFromSuperview];
        [self.view insertSubview:resultVC.view atIndex:0];
        current_vc=1;
        
        [rightButton setTitle:@"地图" forState:UIControlStateNormal];
    }

    [UIView commitAnimations];
}
-(void)leftButtonClick:(id)sender
{
    [self.navigationController popViewControllerAnimated:YES];
}
#pragma mark delegate
-(void)Push
{
    Holder2ViewController *holderVC=[[Holder2ViewController alloc] init];
    [self.navigationController pushViewController:holderVC animated:YES];
}


// 子controller的点击事件
-(void)startBtnClicked:(id)sender
{
    TimeSelectViewController *timeVC=[[TimeSelectViewController alloc] init];
    [timeVC setValue:[NSString stringWithFormat:@"1"] forKey:@"type"];
    [self.navigationController pushViewController:timeVC animated:YES];
}
-(void)endBtnClicked:(id)sender
{
    TimeSelectViewController *timeVC=[[TimeSelectViewController alloc] init];
    [timeVC setValue:[NSString stringWithFormat:@"2"] forKey:@"type"];
    [self.navigationController pushViewController:timeVC animated:YES];
}
@end
