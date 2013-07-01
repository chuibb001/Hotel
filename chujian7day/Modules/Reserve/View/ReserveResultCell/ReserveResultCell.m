//
//  ReserveResultCell.m
//  chujian7day
//
//  Created by simon on 13-4-19.
//  Copyright (c) 2013年 chujian. All rights reserved.
//

#import "ReserveResultCell.h"

@implementation ReserveResultCell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code
        // 酒店名字
        self.hotelNameLabel=[[UILabel alloc] initWithFrame:CGRectMake(20, 10, 180, 20)];
        self.hotelNameLabel.font=[UIFont boldSystemFontOfSize:16.0];
        self.hotelNameLabel.backgroundColor=[UIColor clearColor];
        [self addSubview:self.hotelNameLabel];
        
        // 酒店地址
        self.hotelAddressLabel=[[UILabel alloc] initWithFrame:CGRectMake(20, 35, 180, 20)];
        self.hotelAddressLabel.font=[UIFont systemFontOfSize:14.0];
        self.hotelAddressLabel.backgroundColor=[UIColor clearColor];
        self.hotelAddressLabel.textColor=[UIColor grayColor];
        [self addSubview:self.hotelAddressLabel];
        
        // 有房无房
        self.conditionLabel=[[UILabel alloc] initWithFrame:CGRectMake(200, 20, 40, 20)];
        self.conditionLabel.font=[UIFont systemFontOfSize:14.0];
        self.conditionLabel.backgroundColor=[UIColor clearColor];
        self.conditionLabel.textAlignment=UITextAlignmentRight;
        [self addSubview:self.conditionLabel];
        
        // 价格
        self.priceLabel=[[UILabel alloc] initWithFrame:CGRectMake(250, 20, 50, 20)];
        self.priceLabel.font=[UIFont boldSystemFontOfSize:18.0];
        self.priceLabel.backgroundColor=[UIColor clearColor];
        [self addSubview:self.priceLabel];
    }
    return self;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
