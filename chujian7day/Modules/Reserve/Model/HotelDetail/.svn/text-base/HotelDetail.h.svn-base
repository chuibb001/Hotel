//
//  HotelDetail.h
//  chujian7day
//
//  Created by yan kai on 13-4-24.
//  Copyright (c) 2013年 chujian. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ISevenDaysService.h"

@interface HotelDetail : NSObject

@property(nonatomic) int hotelId;
@property(nonatomic, strong) NSString* name;
@property(nonatomic, strong) NSString* phone;
@property(nonatomic, strong) NSString* address;
@property(nonatomic) double latitude;
@property(nonatomic) double longitude;
@property(nonatomic) BOOL vacant;
@property(nonatomic) double price;
@property(nonatomic, strong) UIImage* coverImage;
@property(nonatomic, strong) NSMutableArray* imageList; //url
@property(nonatomic, strong) NSString* introduction;
@property(nonatomic, strong) NSMutableArray* rooms; //rooomId name price availableRooms
@property(nonatomic, strong) NSMutableArray* supplies;

-(id)initWithHotel:(Hotel*)hotel;

@end
