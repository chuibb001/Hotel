//
//  HotelDetail.m
//  chujian7day
//
//  Created by yan kai on 13-4-24.
//  Copyright (c) 2013年 chujian. All rights reserved.
//

#import "HotelDetail.h"

@implementation HotelDetail

@synthesize hotelId;
@synthesize name;
@synthesize phone;
@synthesize address;
@synthesize latitude;
@synthesize longitude;
@synthesize vacant;
@synthesize price;
@synthesize coverImage;
@synthesize imageList;
@synthesize introduction;
@synthesize rooms;
@synthesize supplies;

- (id)initWithHotel:(Hotel*)hotel
{
    self = [super init];
    if(self) {
        hotelId = hotel.hotelId;
        name = hotel.name;
        phone = hotel.phone;
        address = hotel.address;
        latitude = hotel.latitude;
        longitude = hotel.longitude;
        vacant = hotel.vacant;
        price = hotel.price;
        
        // TODO:可以做成异步加载
        Image* ci = hotel.coverImage;
        coverImage = [[UIImage alloc] initWithContentsOfFile:ci.url];
        
        imageList = hotel.image;
        introduction = hotel.introduction;
        rooms = hotel.room;
        supplies = hotel.supplies;
    }
    
    return self;
}

@end
