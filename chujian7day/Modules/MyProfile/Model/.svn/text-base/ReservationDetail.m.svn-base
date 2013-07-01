//
//  ReservationDetail.m
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

#import "ReservationDetail.h"

@implementation ReservationDetail

-(id)initWith:(Reservation *)aReservation{
    self = [super init];
    if(self){
        self.reservationID = [NSNumber numberWithInt:aReservation.reservationId];
        self.status = [NSNumber numberWithInt:aReservation.status];
        self.returnCode = [NSNumber numberWithInt:aReservation.returnCode];
        self.hotelID = [NSNumber numberWithInt:aReservation.hotelId];
        self.hotelAddress=aReservation.hotelAddress;
        self.hotelName=aReservation.hotelName;
        self.hotelPhone=aReservation.hotelPhone;
        
        self.checkinTime=[NSNumber numberWithInt:aReservation.checkinTime];
        self.checkoutTime=[NSNumber numberWithInt:aReservation.checkoutTime];
        self.roomID=[NSNumber numberWithInt:aReservation.roomId];
        self.roomName=aReservation.roomName;
        self.roomNumber=[NSNumber numberWithInt:aReservation.roomNumber];
        self.guest=aReservation.guest;
        self.contactName=aReservation.contactName;
        self.contactPhone=aReservation.contactPhone;
        self.suppliesOrder=aReservation.suppliesOrder;
        
        self.totalPrice=[NSNumber numberWithDouble:aReservation.totalPrice];
        self.paymentStatus=[NSNumber numberWithInt:aReservation.paymentStatus];
        self.cancelable=[NSNumber numberWithBool:aReservation.cancelable];
        self.keepOnLatestTIme=[NSNumber numberWithInt:aReservation.keepOnLatestTime];
        
    }
    return self;
}
@end
