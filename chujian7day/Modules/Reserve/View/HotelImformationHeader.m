//
//  HotelImformationHeader.m
//  chujian7day
//
//  Created by simon on 13-4-19.
//  Copyright (c) 2013年 chujian. All rights reserved.
//

#import "HotelImformationHeader.h"

@implementation HotelImformationHeader

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        self.backgroundColor=[UIColor whiteColor];
        // 正门图片
        self.hotelImageView=[[UIImageView alloc] initWithFrame:CGRectMake(5, 5, 60, 60)];
        [self addSubview:self.hotelImageView];
        
        // 酒店名称
        self.nameLabel=[[UILabel alloc] initWithFrame:CGRectMake(100, 5, 200, 20)];
        self.nameLabel.font=[UIFont boldSystemFontOfSize:16.0];
        self.nameLabel.text=@"7天中大北门店";
        self.nameLabel.backgroundColor=[UIColor clearColor];
        [self addSubview:self.nameLabel];
        
        // 酒店地址
        self.addressLabel=[[UILabel alloc] initWithFrame:CGRectMake(100, 25, 100, 20)];
        self.addressLabel.font=[UIFont systemFontOfSize:14.0];
        self.addressLabel.text=@"地址:中大北门";
        self.addressLabel.backgroundColor=[UIColor clearColor];
        self.addressLabel.textColor=[UIColor grayColor];
        [self addSubview:self.addressLabel];
        
        // 酒店电话
        self.phoneLabel=[[UILabel alloc] initWithFrame:CGRectMake(100, 45, 100, 20)];
        self.phoneLabel.font=[UIFont systemFontOfSize:14.0];
        self.phoneLabel.text=@"电话:6225463";
        self.phoneLabel.backgroundColor=[UIColor clearColor];
        self.phoneLabel.textColor=[UIColor grayColor];
        [self addSubview:self.phoneLabel];
    }
    return self;
}


@end
