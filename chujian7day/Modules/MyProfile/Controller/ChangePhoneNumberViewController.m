//
//  ChangePhoneNumberViewController.m
//  chujian7day
//
//  Created by 王 瑞 on 13-5-19.
//  Copyright (c) 2013年 chujian. All rights reserved.
//

#import "ChangePhoneNumberViewController.h"

@interface ChangePhoneNumberViewController ()

@end

@implementation ChangePhoneNumberViewController

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
    [self initNav];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(void)initNav{
    self.navigationItem.title=@"修改手机号码";
}

- (IBAction)getCode:(id)sender {
}

- (IBAction)reGetCode:(id)sender {
}

- (IBAction)confirmChange:(id)sender {
}
@end
