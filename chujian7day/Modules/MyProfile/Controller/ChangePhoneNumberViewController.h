//
//  ChangePhoneNumberViewController.h
//  chujian7day
//
//  Created by 王 瑞 on 13-5-19.
//  Copyright (c) 2013年 chujian. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ChangePhoneNumberViewController : UIViewController
@property (strong, nonatomic) IBOutlet UITextField *examinCode;


@property (strong, nonatomic) IBOutlet UILabel *codeNotification;
- (IBAction)getCode:(id)sender;
- (IBAction)reGetCode:(id)sender;
- (IBAction)confirmChange:(id)sender;
@end
