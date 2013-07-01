// Copyright (c) 2013 Chujian Inc.

namespace java com.chujian.sevendaysinn.model.thrift


// NEXT: 13
struct Member {
  1:i64 memberId,
  2:string name,
  3:string birthday,
  4:string idCard,
  5:string memberCard,
  6:string phone,
  9:bool phoneVerified,
  7:string email,
  8:string level,
  10:bool isMale,
  11:i32 memberType,
  12:bool isPayTrain,
}

// NEXT: 6
struct Voucher {
  1:i64 voucherId,
  2:double value,
  3:i64 startTime,
  4:i64 endTime,
  5:string notice,
}

// NEXT: 6
struct RefundCoupon {
  1:i64 refundCouponId,
  2:double value,
  3:i64 startTime,
  4:i64 endTime,
  5:string notice,
}

// NEXT: 10
struct Asset {
  1:i32 point,

  2:i32 voucherAmount,
  8:i32 voucherValue,
  3:list<Voucher> voucher,

  4:i32 refundCouponAmount,
  9:i32 refundCouponValue,
  5:list<RefundCoupon> refundCoupon,

  6:double storedValue,

  7:i32 totalTreasure,
}

// NEXT: 3
struct Signture {
  1:string username,
  2:string password,
}

// NEXT: 3
struct Credential {
  1:string token,
  2:Member member,
}

// NEXT: 4
struct MemberInfoRequest {
  1:i64 memberId,
  2:i32 pageIndex,
  3:i32 pageSize,
}
