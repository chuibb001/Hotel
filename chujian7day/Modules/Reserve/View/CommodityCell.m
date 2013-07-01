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
        self.keyLabel=[[UILabel alloc] initWithFrame:CGRectMake(20, 10, 120, 30)];
        self.keyLabel.backgroundColor=[UIColor clearColor];
        [self addSubview:self.keyLabel];
        
        // 前台价
        self.frontDoorPriceLabel=[[UILabel alloc] initWithFrame:CGRectMake(160, 5, 120, 20)];
        self.frontDoorPriceLabel.backgroundColor=[UIColor clearColor];
        [self addSubview:self.frontDoorPriceLabel];
        
        // 网络价
        self.networkPriceLabel=[[UILabel alloc] initWithFrame:CGRectMake(160, 25, 120, 20)];
        self.networkPriceLabel.backgroundColor=[UIColor clearColor];
        [self addSubview:self.networkPriceLabel];
    }
    return self;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
