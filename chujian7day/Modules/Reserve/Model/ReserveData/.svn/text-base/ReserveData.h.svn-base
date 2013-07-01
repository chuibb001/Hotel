//
//  ReserveData.h
//  chujian7day

//  酒店查询的参数,查询结果等需要再多个VC重复使用的数据

//  Created by simon on 13-4-19.
//  Copyright (c) 2013年 chujian. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ReserveTime.h"
#import "HotelDetail.h"

@interface ReserveData : NSObject

+(ReserveData *)sharedReserveData;

// search params
@property (nonatomic,strong) NSString *cityString;
@property (nonatomic,strong) NSString *regionString;
@property (nonatomic,strong) ReserveTime *startTime;
@property (nonatomic,strong) ReserveTime *endTime;
@property (nonatomic,strong) NSString *dayStr;


// 保留一个搜索结果的引用，方便之后的VC使用
@property (nonatomic,strong) HotelDetail *detailData;

// user configue
@property (nonatomic,strong) Hotel *selectedHotel; // HotelId name address lat lon ...
@property (nonatomic,strong) Room *selectedRoom;  // roomID name price availableRooms
@property (nonatomic,assign) int roomCount; 
@property (nonatomic,strong) NSString *contractName;
@property (nonatomic,strong) NSString *contractTel;
@property (nonatomic,strong) NSMutableArray *goods;

-(float)totalGoodsPrice;
-(float)totalPrice;
-(void)setStartDate:(NSDate *)sdate;
-(void)setEndDate:(NSDate *)edate;

@end
