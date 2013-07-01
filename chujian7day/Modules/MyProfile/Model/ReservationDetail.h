//
//  ReservationDetail.h
//  chujian7day
//
//  Created by 王 瑞 on 13-5-15.
//  Copyright (c) 2013年 chujian. All rights reserved.
//


/*
 // NEXT: 21
 struct Reservation {
 1:i64 reservationId,
 2:i32 status,
 20:i32 returnCode,
 
 // hotel information
 3:i32 hotelId,
 4:string hotelName,
 5:string hotelAddress,
 6:string hotelPhone,
 
 // guest information
 7:i64 checkinTime,
 8:i64 checkoutTime,
 9:i32 roomId,
 10:string roomName,
 11:i32 roomNumber,
 12:list<string> guest,
 13:string contactName,
 14:string contactPhone,
 18:list<SuppliesOrder> suppliesOrder,
 
 // payment
 15:double totalPrice,
 16:i32 paymentStatus,
 17:bool cancelable,
 19:i64 keepOnLatestTime,
 }
 
 
 */
#import <Foundation/Foundation.h>
#import "ThriftService.h"
@interface ReservationDetail : NSObject

@property(nonatomic,strong)NSNumber * reservationID;
@property(nonatomic,strong)NSNumber * status;
@property(nonatomic,strong)NSNumber * returnCode;

@property(nonatomic,strong)NSNumber * hotelID;
@property(nonatomic,strong)NSString *hotelName;
@property(nonatomic,strong)NSString *hotelAddress;
@property(nonatomic,strong)NSString *hotelPhone;

@property(nonatomic,strong)NSNumber *checkinTime;
@property(nonatomic,strong)NSNumber * checkoutTime;
@property(nonatomic,strong)NSNumber * roomID;
@property(nonatomic,strong)NSString *roomName;
@property(nonatomic,strong)NSNumber * roomNumber;
@property(nonatomic,strong)NSMutableArray *guest;
@property(nonatomic,strong)NSString *contactName;
@property(nonatomic,strong)NSString *contactPhone;
@property(nonatomic,strong)NSMutableArray *suppliesOrder;

@property(nonatomic,strong)NSNumber * totalPrice;
@property(nonatomic,strong)NSNumber * paymentStatus;
@property(nonatomic,strong)NSNumber * cancelable;
@property(nonatomic,strong)NSNumber * keepOnLatestTIme;


-(id)initWith:(Reservation *)aReservation;
@end
