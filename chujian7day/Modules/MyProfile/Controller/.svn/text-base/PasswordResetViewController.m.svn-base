//
//  PasswordResetViewController.m
//  chujian7day
//
//  Created by 王 瑞 on 13-5-18.
//  Copyright (c) 2013年 chujian. All rights reserved.
//

#import "PasswordResetViewController.h"
#import "PassResetCell.h"
#import "SVProgressHUD.h"
@interface PasswordResetViewController ()

@end

@implementation PasswordResetViewController

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
    [self initBackground];
    [self initTable];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(void)initBackground{
    self.wholeBackgroudButton=[UIButton buttonWithType:UIButtonTypeCustom];
    self.wholeBackgroudButton.backgroundColor=[UIColor clearColor];
    self.wholeBackgroudButton.frame=CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT);
    [self.wholeBackgroudButton addTarget:self action:@selector(resignAllStuff) forControlEvents:UIControlEventTouchUpInside];
    self.wholeBackgroudButton.highlighted=NO;
    [self.view addSubview:self.wholeBackgroudButton];
}
-(void)initNav{
    self.navigationItem.title=@"重置密码";
    
}
-(void)initTable{
    self.mainTable = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, 44*3+50) style:UITableViewStyleGrouped];
    self.mainTable.delegate=self;
    self.mainTable.dataSource=self;
    self.mainTable.scrollEnabled=NO;
    self.mainTable.backgroundColor = [UIColor clearColor];
    self.mainTable.backgroundView=nil;
    self.mainTable.opaque=NO;
    
  //  self.mainTable.
    [self.view addSubview:self.mainTable];
    _label=[[UILabel alloc] initWithFrame:CGRectMake(10,132+10, 320, 33)];
    _label.font=[UIFont systemFontOfSize:14.0];
    _label.textColor=[UIColor orangeColor];
    _label.backgroundColor=[UIColor clearColor];
    _label.text=@"密码需要包含数字和字母，长度6到8位";
    [self.mainTable addSubview:_label];
   // self.mainTable.tableFooterView=label;
    
    UITapGestureRecognizer *tapToResign=[[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(resignAllStuff)];
    tapToResign.numberOfTapsRequired=1;
    tapToResign.numberOfTouchesRequired=1;
    _label.userInteractionEnabled=YES;
    [_label addGestureRecognizer:tapToResign];
    
    _acquireButton=[UIButton buttonWithType:UIButtonTypeCustom];
    _acquireButton.frame=CGRectMake(50, SCREEN_HEIGHT-140, 220, 44);
    [_acquireButton setTitle:@"确认" forState:UIControlStateNormal];
    _acquireButton.backgroundColor=[UIColor blueColor];
    [_acquireButton addTarget:self action:@selector(confirm) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:_acquireButton];
}
#pragma mark -
#pragma mark Table View
//-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
//    PassResetCell *aCell = (PassResetCell *)[tableView cellForRowAtIndexPath:indexPath];
//    aCell.selectionStyle = UITableViewCellSelectionStyleNone;
//}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{

    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{

    // Return the number of rows in the section.
    return 3;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    NSString *identifier = @"PassReset";
    PassResetCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    if (cell == nil) {
        NSArray *nib = [[UINib nibWithNibName:@"PassResetCell" bundle:nil] instantiateWithOwner:self options:nil];
        cell = (PassResetCell*)[nib objectAtIndex:0];
    }
    [cell setContents:indexPath.row];
    cell.tag=indexPath.row+1;
    return cell;
}
-(void)resignAllStuff{
    for (PassResetCell *aCell in self.mainTable.visibleCells) {
        [aCell.pass resignFirstResponder];
    }
}

-(void)confirm{
    for (PassResetCell *aCell in self.mainTable.visibleCells) {
        if ([aCell.pass.text isEqualToString:@""]){
            
            [SVProgressHUD showErrorWithStatus:@"密码不能为空" duration:1.0f];
            return;
        }

        if(aCell.pass.text.length < 6 || aCell.pass.text.length > 8){
            NSString *remind = [NSString stringWithFormat:@"%@只能为6到8位",aCell.title.text];
            [SVProgressHUD showErrorWithStatus:remind duration:1.0f];
        }
    
    }


    
}


@end
