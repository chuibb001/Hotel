//
//  HotelCell.m
//  chujian7day
//
//  Created by simon on 13-4-19.
//  Copyright (c) 2013年 chujian. All rights reserved.
//

#import "HotelCell.h"

@implementation HotelCell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code
        // 酒店名字
        self.roomTypeLabel=[[UILabel alloc] initWithFrame:CGRectMake(10, 20, 100, 20)];
        self.roomTypeLabel.font=[UIFont boldSystemFontOfSize:16.0];
        self.roomTypeLabel.backgroundColor=[UIColor clearColor];
        [self addSubview:self.roomTypeLabel];
        
        // 价格
        self.priceLabel=[[UILabel alloc] initWithFrame:CGRectMake(200, 20, 100, 20)];
        self.priceLabel.font=[UIFont boldSystemFontOfSize:18.0];
        self.priceLabel.backgroundColor=[UIColor clearColor];
        [self addSubview:self.priceLabel];
        
        // 预定按钮
        self.reserveButton=[UIButton buttonWithType:UIButtonTypeRoundedRect];
        self.reserveButton.frame=CGRectMake(250, 20, 50, 30);
        [self.reserveButton setTitle:@"预定" forState:UIControlStateNormal];
        [self addSubview:self.reserveButton];
    }
    return self;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
