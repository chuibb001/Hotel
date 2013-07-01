//
//  RegisterViewController.m
//  chujian7day
//
//  Created by 王 瑞 on 13-5-20.
//  Copyright (c) 2013年 chujian. All rights reserved.
//

#import "RegisterViewController.h"
#import "RegistPassCell.h"
#import "RegistNormCell.h"
#import "RegisteIDCell.h"
@interface RegisterViewController ()

@end

@implementation RegisterViewController

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];

    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
 
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{

    // Return the number of sections.
    return 2;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if (section == 0) {
        return 5;
    }else{
        return 2;
    }

}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"RegisterNorm";
    static NSString *AnotherCellIdentifier = @"RegisterPass";
    static NSString *IDIdentifier = @"RegisterID";
    
    if (indexPath.section == 0) {
        if (indexPath.row==1) {
            RegisteIDCell *aCell = [tableView dequeueReusableCellWithIdentifier:IDIdentifier];
            if (aCell == nil) {
                aCell = [[RegisteIDCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:IDIdentifier];
            }
            
            return aCell;
        }else{
            RegistNormCell *aCell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
            if (aCell == nil) {
                NSArray *nib = [[UINib nibWithNibName:@"RegistNormCell" bundle:nil] instantiateWithOwner:self options:nil];
                aCell = (RegistNormCell *)[nib objectAtIndex:0];
            }
            if (indexPath.row == 0) {
                aCell.title.text=@"姓名";
            }else if (indexPath.row == 2){
                aCell.title.text=@"证件号码*";
            }else if (indexPath.row==3){
                aCell.title.text=@"手机号码*";
            }else if (indexPath.row==4){
                aCell.title.text=@"邮箱地址";
            }
            
            return aCell;
            
        }
        
    
    }else{
        RegistPassCell *aCell = [tableView dequeueReusableCellWithIdentifier:AnotherCellIdentifier];
        if (aCell == nil) {
            NSArray *nib = [[UINib nibWithNibName:@"RegistPassCell" bundle:nil] instantiateWithOwner:self options:nil];
            aCell = (RegistPassCell*)[nib objectAtIndex:0];
        }
        if (indexPath.row == 0) {
            aCell.title.text = @"密码";
        }else{
            aCell.title.text = @"确认密码";
        }
        return aCell;
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
    // Navigation logic may go here. Create and push another view controller.
    /*
     <#DetailViewController#> *detailViewController = [[<#DetailViewController#> alloc] initWithNibName:@"<#Nib name#>" bundle:nil];
     // ...
     // Pass the selected object to the new view controller.
     [self.navigationController pushViewController:detailViewController animated:YES];
     */
}

- (IBAction)cancel:(id)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}
@end
