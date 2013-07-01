//
//  LoginViewController.h
//  chujian7day
//
//  Created by 王 瑞 on 13-5-10.
//  Copyright (c) 2013年 chujian. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LoginViewController : UIViewController

@property (strong, nonatomic) IBOutlet UITextField *username;
@property (strong, nonatomic) IBOutlet UITextField *password;
- (IBAction)submit:(id)sender;

- (IBAction)cancel:(id)sender;
@end
