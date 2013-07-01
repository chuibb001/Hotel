// Copyright (c) 2013 Chujian Inc.

namespace java com.chujian.sevendaysinn.model.thrift


// NEXT: 4
struct SuppliesOrder {
  1:i32 supplyId,
  2:i32 quantity,
  3:double price,
}

// NEXT: 3
struct RefundCouponConsumption {
  1:i64 refundCouponId,
  2:double value,
}

// NEXT: 16
struct BookingRequest {
  1:i64 memberId,
  2:i32 hotelId,
  3:i32 roomId,
  4:i64 checkinTime,
  5:i64 checkoutTime,

  6:i32 roomNumber,
  7:list<string> guest,
  8:string contactName,
  9:string contactPhone,
  10:list<SuppliesOrder> suppliesOrder,
  15:list<RefundCouponConsumption> refundCouponConsumption,
  
  11:i32 propertyId,
  12:i32 propertyType,
  13:i32 innSellerId,
  14:i32 innMarketId,
}

// NEXT: 4
struct ReservationRequest {
  1:i64 memberId,
  2:i64 reservationId,
  3:i32 hotelId,
}

// NEXT: 3
struct VoucherConsumption {
  1:i64 voucherId,
  2:double value,
}

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

// NEXT: 8
struct PayRequest {
  1:i64 memberId,
  2:i64 reservationId,
  7:i32 hotelId,
  
  3:list<VoucherConsumption> voucherConsumption,
  4:list<RefundCouponConsumption> refundCouponConsumption,
  5:double storedValue,
  
  6:double fastPayAmount,
}

// NEXT: 2
struct Payment {
}

// NEXT: 9
struct AssetRequest {
  1:i64 memberId,

  2:i32 cityId,
  3:i32 hotelId,
  4:i32 roomId,
  5:i64 checkinTime,
  6:i64 checkoutTime,

  7:i32 pageIndex,
  8:i32 pageSize,
}

