//
//  PersonInfoViewController.m
//  chujian7day
//
//  Created by 王 瑞 on 13-5-17.
//  Copyright (c) 2013年 chujian. All rights reserved.
//

#import "PersonInfoViewController.h"
#import "HeadCell.h"
#import "PersonInfoCom.h"
#import "PasswordResetViewController.h"
#import "ChangePhoneNumberViewController.h"
@interface PersonInfoViewController ()

@end

@implementation PersonInfoViewController

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
      
        
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.mainTable.frame = CGRectMake(self.mainTable.frame.origin.x, self.mainTable.frame.origin.y, self.mainTable.frame.size.width, self.mainTable.frame.size.height-50);
    self.mainTable.opaque=NO;
    self.mainTable.backgroundView=nil;
    self.mainTable.backgroundColor=[UIColor clearColor];
    self.mainTable.dataSource=self;
    self.mainTable.delegate=self;
    self.mainTable.scrollEnabled=NO;
    
    self.resetPass = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    self.resetPass.frame=CGRectMake(60, self.view.frame.size.height-50, 200, 44);
    [self.resetPass setTitle:@"重置密码" forState:UIControlStateNormal];
    [self.resetPass addTarget:self action:@selector(resetPass:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:self.resetPass];

    [self initnav];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)initnav{
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"返回" style:UIBarButtonItemStyleBordered target:self action:@selector(cancel)];
    self.navigationItem.title = @"个人资料";
   
}

//-(void)cancel{
//    [self dismissViewControllerAnimated:YES completion:^(void){
//        
//    }];
//}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
#warning Potentially incomplete method implementation.
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
#warning Incomplete method implementation.
    // Return the number of rows in the section.
    return 7-1;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *headIdentifier = @"Head";
    static NSString *commenIdenfier = @"Norm";
    
    if (indexPath.row==0) {
        HeadCell *cell = [tableView dequeueReusableCellWithIdentifier:headIdentifier];
        if (!cell) {
            NSArray *nib = [[UINib nibWithNibName:@"HeadCell" bundle:nil] instantiateWithOwner:self options:nil];
            cell = (HeadCell*)[nib objectAtIndex:0];
        }
        [cell setEverying];
        return cell;
    }else{
        
        PersonInfoCom *cell = [tableView dequeueReusableCellWithIdentifier:commenIdenfier];
        if (cell ==nil) {
            cell = [[PersonInfoCom alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:commenIdenfier num:indexPath.row];
        }
        
        return cell;
    }
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.row==0) {
        return 88;
    }else{
        return 44;
    }
}


/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    }   
    else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath
{
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

#pragma mark - Table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.row==4) {
        ChangePhoneNumberViewController *changePhoneNumberViewController=[[ChangePhoneNumberViewController alloc] initWithNibName:nil bundle:nil];
        [self.navigationController pushViewController:changePhoneNumberViewController animated:YES];
    }else if(indexPath.row==5){
        
    }else{
        
    }
}

- (void)cancel{
    [self dismissViewControllerAnimated:YES completion:nil];
}
-(void)resetPass:(id)sender{
    PasswordResetViewController *passwordResetViewController = [[PasswordResetViewController alloc] initWithNibName:nil bundle:nil];
    [self.navigationController pushViewController:passwordResetViewController animated:YES];
}
@end
