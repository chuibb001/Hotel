//
//  CommodityCell.m
//  chujian7day
//
//  Created by simon on 13-4-22.
//  Copyright (c) 2013年 chujian. All rights reserved.
//

#import "CommodityCell.h"

@implementation CommodityCell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code
        // 用品名
        self.keyLabel=[[UILabel alloc] initWithFrame:CGRectMake(20, 10, 140, 30)];
        self.keyLabel.font=[UIFont boldSystemFontOfSize:15.0];
        self.keyLabel.backgroundColor=[UIColor clearColor];
        [self addSubview:self.keyLabel];
        
        // 前台价
        self.frontDoorPriceLabel=[[UILabel alloc] initWithFrame:CGRectMake(180, 5, 120, 20)];
        self.frontDoorPriceLabel.backgroundColor=[UIColor clearColor];
        self.frontDoorPriceLabel.font=[UIFont systemFontOfSize:13.0];
        [self addSubview:self.frontDoorPriceLabel];
        
        // 网络价
        self.networkPriceLabel=[[UILabel alloc] initWithFrame:CGRectMake(180, 25, 120, 20)];
        self.networkPriceLabel.backgroundColor=[UIColor clearColor];
        self.networkPriceLabel.font=[UIFont systemFontOfSize:14.0];
        self.networkPriceLabel.textColor=[UIColor redColor];
        [self addSubview:self.networkPriceLabel];
        
        // 数量
        self.quantiryLabel=[[UILabel alloc] initWithFrame:CGRectMake(280, 25, 120, 20)];
        self.quantiryLabel.backgroundColor=[UIColor clearColor];
        self.quantiryLabel.font=[UIFont systemFontOfSize:14.0];
        self.quantiryLabel.textColor=[UIColor redColor];
        [self addSubview:self.quantiryLabel];
        
        [self setSelectionStyle:UITableViewCellSelectionStyleNone];
    }
    return self;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
