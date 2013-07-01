//
//  OrderDetailCell0.h
//  chujian7day
//
//  Created by 王 瑞 on 13-4-21.
//  Copyright (c) 2013年 chujian. All rights reserved.
//

#import "ABTableViewCell.h"

@interface OrderDetailCell0 : ABTableViewCell
{
    
    UIFont *titleFont ;
    UIColor *titleColor;
    NSString *_OrderNum;
    NSString *_effect;
    NSString *_pay;

}
-(void)setOrderNum:(NSString *)aNum effect:(NSString *)aAffect pay:(NSString *)aPay;

@end
