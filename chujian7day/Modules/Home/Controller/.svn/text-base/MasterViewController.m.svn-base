//
//  MasterViewController.m
//  chujian7day
//
//  Created by 王 瑞 on 13-4-19.
//  Copyright (c) 2013年 chujian. All rights reserved.
//

#import "MasterViewController.h"
#import "HomeViewController.h"

@interface MasterViewController ()

@end

@implementation MasterViewController
@synthesize revealSideViewController = _revealSideViewController;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
       
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	
     UIStoryboard *story=[UIStoryboard storyboardWithName:@"MainStoryboard_iPhone" bundle:nil];
    
    HomeViewController *home=[story instantiateViewControllerWithIdentifier:@"HomeViewController"];
    
    UINavigationController *nav=[[UINavigationController alloc] initWithRootViewController:home];
    
    _revealSideViewController=[[PPRevealSideViewController alloc] initWithRootViewController:nav];
    _revealSideViewController.delegate=self;
    [self.view addSubview:_revealSideViewController.view];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma mark - PPRevealSideViewController delegate

- (void) pprevealSideViewController:(PPRevealSideViewController *)controller willPushController:(UIViewController *)pushedController {
   // PPRSLog(@"%@", pushedController);
}

- (void) pprevealSideViewController:(PPRevealSideViewController *)controller didPushController:(UIViewController *)pushedController {
 //   PPRSLog(@"%@", pushedController);
}

- (void) pprevealSideViewController:(PPRevealSideViewController *)controller willPopToController:(UIViewController *)centerController {
 //   PPRSLog(@"%@", centerController);
}

- (void) pprevealSideViewController:(PPRevealSideViewController *)controller didPopToController:(UIViewController *)centerController {
  //  PPRSLog(@"%@", centerController);
}

- (void) pprevealSideViewController:(PPRevealSideViewController *)controller didChangeCenterController:(UIViewController *)newCenterController {
   // PPRSLog(@"%@", newCenterController);
}

- (BOOL) pprevealSideViewController:(PPRevealSideViewController *)controller shouldDeactivateDirectionGesture:(UIGestureRecognizer*)gesture forView:(UIView*)view {
    return NO;
}

- (PPRevealSideDirection)pprevealSideViewController:(PPRevealSideViewController*)controller directionsAllowedForPanningOnView:(UIView*)view {
    
    if ([view isKindOfClass:NSClassFromString(@"UIWebBrowserView")]) return PPRevealSideDirectionLeft | PPRevealSideDirectionRight;
    
    return PPRevealSideDirectionLeft | PPRevealSideDirectionRight | PPRevealSideDirectionTop | PPRevealSideDirectionBottom;
}
@end
