//
//  PayOrderViewController.m
//  chujian7day
//
//  Created by yan kai on 13-4-19.
//  Copyright (c) 2013年 chujian. All rights reserved.
//

#import "PayOrderViewController.h"
#import "ThriftService.h"

@implementation PayOrderViewController

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
    
    totalPrice = 150.50;
    
    [self initTotalPriceView];
    [self initPayDetailView];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark 初始化
- (void)initTotalPriceView
{    
    CGFloat pageWidth = self.view.frame.size.width;
    CGFloat viewWith = pageWidth;
    totalPriceView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, viewWith, 30)];
    totalPriceView.backgroundColor = [UIColor yellowColor];
    
    UILabel* keyLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 100, 30)];
    keyLabel.backgroundColor = [UIColor clearColor];
    keyLabel.text = @"订单总价:";
    [totalPriceView addSubview:keyLabel];
    
    UILabel* valLabel = [[UILabel alloc] initWithFrame:CGRectMake(viewWith-80, 0, 80, 30)];
    valLabel.backgroundColor=[UIColor clearColor];
    valLabel.text = [NSString stringWithFormat:@"%.2f", totalPrice];
    [totalPriceView addSubview:valLabel];
    
    [self.view addSubview:totalPriceView];
}

- (void)initPayDetailView
{
    CGFloat pageWidth = self.view.frame.size.width;
    CGFloat pageHeight = self.view.frame.size.height;
    CGFloat viewWidth = pageWidth;
    CGFloat viewHeight = pageHeight - 150;
    payDetailView = [[UITableView alloc] initWithFrame:CGRectMake(0, 30, viewWidth, viewHeight) style:UITableViewStylePlain];
    payDetailView.backgroundColor = [UIColor whiteColor];
    payDetailView.delegate = self;
    payDetailView.dataSource = self;
    
    [self.view addSubview:payDetailView];
    
    btnNext = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [btnNext setFrame:CGRectMake(pageWidth/2-40, 30+viewHeight+20, 80, 30)];
    [btnNext setTitle:@"下一步" forState:UIControlStateNormal];
    btnNext.backgroundColor = [UIColor clearColor];
    [btnNext addTarget:self action:@selector(btnNextPressed) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btnNext];
}

#pragma mark Button event
- (void)btnNextPressed
{
    NSLog(@"支付 下一步");
    
    // 测试：
    SearchRequest* request = [[SearchRequest alloc] init];
    request.cityId = 30;
    [[ThriftService shared] searchHotel:request
                                success:^(NSArray* hotelList){
                                    NSLog(@"查询酒店结果：%@", hotelList);
                                }
                                 failed:^(NSString* error) {
                                     NSLog(@"查询酒店失败：%@", error);
                                 }];
    
}

#pragma mark UITableView Delegate
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 9;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString* cellId = @"cell_pay";
    UITableViewCell *cell=[tableView dequeueReusableCellWithIdentifier:cellId];
    if(cell==nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellId];
    }
    
    NSInteger row = indexPath.row;
    switch(row) {
        case 0:
        {
            cell.backgroundColor = [UIColor yellowColor];
            UILabel* label1 = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 100, 20)];
            label1.font = [UIFont boldSystemFontOfSize:16];
            label1.text = @"会员资产支付";
            [cell addSubview:label1];
            
            UILabel* label2 = [[UILabel alloc] initWithFrame:CGRectMake(0, 20, 100, 10)];
            label2.font = [UIFont systemFontOfSize:8];
            label2.text = @"组合着用吧亲~";
            [cell addSubview:label2];
            
        }
            break;
            
        case 1:
        {
            
        }
            break;
    }
    
    
    return cell;
}


- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 80;
}

@end
