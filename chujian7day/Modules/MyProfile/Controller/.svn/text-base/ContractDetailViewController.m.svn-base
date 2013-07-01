//
//  ContractDetailViewController.m
//  chujian7day
//
//  Created by 王 瑞 on 13-4-22.
//  Copyright (c) 2013年 chujian. All rights reserved.
//

#import "ContractDetailViewController.h"

#import "Detail0Cell.h"

#import "Detail2Cell.h"

@interface ContractDetailViewController ()

@end

@implementation ContractDetailViewController

- (id)init
{
    self = [super init];
    if (self) {
        
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	
    [self initNav];
    [self initView];
    [self initTable];
    [self initButton];
};

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)initNav{
    self.navigationItem.title=@"订单详情";
    
}
-(void)initView{
    self.view.backgroundColor=[UIColor whiteColor];
}
-(void)initTable{
    self.detailTable=[[UITableView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT) style:UITableViewStyleGrouped];
    self.detailTable.delegate=self;
    self.detailTable.dataSource=self;
    self.detailTable.autoresizingMask=UIViewAutoresizingFlexibleWidth|UIViewAutoresizingFlexibleHeight;
    [self.view addSubview:self.detailTable];
}
-(void)initButton{
    self.cancelButton=[UIButton buttonWithType:UIButtonTypeRoundedRect];
    [self.cancelButton setFrame:CGRectMake(20, SCREEN_HEIGHT-124, SCREEN_WIDTH-40, 44)];
    
    [self.cancelButton addTarget:self action:@selector(cancelOrder) forControlEvents:UIControlEventTouchUpInside];
    [self.cancelButton setTitle:@"取消订单" forState:UIControlStateNormal];
    [self.view addSubview:self.cancelButton];
}
#pragma mark - Button
-(void)cancelOrder{
    
}

#pragma mark - Table View Data Source
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 3;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.row==0) {
        static NSString *ident0=@"DetailCell0";
        Detail0Cell *a0Cell=[tableView dequeueReusableCellWithIdentifier:ident0];
        if (!a0Cell) {
            a0Cell=[[Detail0Cell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:ident0];
        }
        a0Cell.textLabel.text=@"订单编号：10212321";
        a0Cell.detailTextLabel.text=@"有效/已支付";
        a0Cell.detailTextLabel.textColor =[UIColor blueColor];
        return a0Cell;
    }else if (indexPath.row==1){
        static NSString *ident1=@"DetailCell1";
        UITableViewCell *a1Cell=[tableView dequeueReusableCellWithIdentifier:ident1];
        if (!a1Cell) {
            a1Cell=[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:ident1];
        }
        a1Cell.textLabel.text=@"酒店信息";
        return a1Cell;
    }else if(indexPath.row==2){
        static NSString *ident2=@"DetailCell2";
        Detail2Cell *a2Cell=[tableView dequeueReusableCellWithIdentifier:ident2];
        if (!a2Cell) {
            a2Cell=[[Detail2Cell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:ident2];
        }
        
        return a2Cell;
    }
    
    
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
   
    switch (indexPath.row) {
        case 0:
            return 40;
            break;
        case 1:
            return 40;
            break;
        case 2:
            return 70;
            break;
        default:
            return 0;
            break;
    }
    
}

@end
